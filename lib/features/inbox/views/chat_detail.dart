import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/repos/authenticationrepo.dart';
import 'package:tiktok_clone/features/inbox/view_modal/messages_viewmodal.dart';

class ChatDetail extends ConsumerStatefulWidget {
  static const String routeName = 'chatDetail';
  static const String routeUrl = ':chatId';
  final String chatId;

  const ChatDetail({super.key, required this.chatId});

  @override
  ConsumerState<ChatDetail> createState() => _ChatDetailState();
}

class _ChatDetailState extends ConsumerState<ChatDetail> {
  final TextEditingController _textEditingController = TextEditingController();

  void _onSendPress() {
    final text = _textEditingController.text;
    if (text == '') {
      return;
    }
    ref.read(messageProvider.notifier).sendMessage(text);
    _textEditingController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(messageProvider).isLoading;
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: Sizes.size8,
          leading: SizedBox(
            width: 45,
            height: 45,
            child: Stack(
              fit: StackFit.loose,
              children: [
                const CircleAvatar(
                  radius: 20,
                  foregroundImage: NetworkImage(
                    'https://i.pinimg.com/474x/ba/9a/4b/ba9a4bf12c5fa0a2159ca22ca18077b0.jpg',
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      border: Border.all(
                        color: Colors.white,
                        width: 3.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          title: Text(
            'Nahul (${widget.chatId})',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            'Active now',
            style: TextStyle(
              color: Colors.grey[400],
            ),
          ),
          trailing: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                FontAwesomeIcons.flag,
                color: Colors.black,
                size: Sizes.size20,
              ),
              Gaps.h28,
              FaIcon(
                FontAwesomeIcons.ellipsis,
                color: Colors.black,
                size: Sizes.size20,
              ),
            ],
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context)
            .size
            .height, // Fixed height for the container
        child: Stack(
          children: [
            ref.watch(chatProvider).when(
                  data: (data) {
                    return ListView.separated(
                      reverse: true,
                      padding: EdgeInsets.only(
                        top: Sizes.size20,
                        bottom: MediaQuery.of(context).padding.bottom +
                            Sizes.size96,
                        left: Sizes.size14,
                        right: Sizes.size14,
                      ),
                      itemBuilder: (context, index) {
                        final message = data[index];
                        final isMine =
                            message.userId == ref.watch(authRepo).user!.uid;
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: isMine
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(
                                Sizes.size14,
                              ),
                              decoration: BoxDecoration(
                                color: isMine
                                    ? Colors.blue
                                    : Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(
                                    Sizes.size20,
                                  ),
                                  topRight: Radius.circular(
                                    isMine ? Sizes.size5 : Sizes.size20,
                                  ),
                                  bottomLeft: Radius.circular(
                                    isMine ? Sizes.size20 : Sizes.size5,
                                  ),
                                  bottomRight: Radius.circular(
                                    isMine ? Sizes.size20 : Sizes.size20,
                                  ),
                                ),
                              ),
                              child: Text(
                                message.text,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) => Gaps.v10,
                      itemCount: data.length,
                    );
                  },
                  error: (error, stackTrace) => Center(
                    child: Text(error.toString()),
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: BottomAppBar(
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 4,
                          ),
                          child: TextField(
                            controller: _textEditingController,
                            decoration: InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  Sizes.size32,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Gaps.h10,
                      IconButton(
                        onPressed: isLoading ? null : _onSendPress,
                        icon: FaIcon(
                          isLoading
                              ? FontAwesomeIcons.hourglass
                              : FontAwesomeIcons.paperPlane,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
