import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/inbox/chat_detail.dart';

class ChatScreen extends StatefulWidget {
  static const String routeName = 'chats';
  static const String routeUrl = '/chats';
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();

  final Duration _duration = const Duration(
    milliseconds: 300,
  );

  void _addItem() {
    if (_key.currentState != null) {
      _key.currentState!.insertItem(0);
    }
  }

  void _onDelete(int index) {
    if (_key.currentState != null) {
      _key.currentState!.removeItem(
        index,
        (context, animation) => SizeTransition(
          sizeFactor: animation,
          child: Container(
            color: Colors.redAccent,
            child: _makeTile(index),
          ),
        ),
        duration: _duration,
      );
    }
  }

  void _onChatTap(int index) {
    context.pushNamed(
      ChatDetail.routeName,
      params: {
        'chatId': '$index',
      },
    );
  }

  Widget _makeTile(int index) {
    return ListTile(
      onTap: () => _onChatTap(index),
      onLongPress: () => _onDelete(index),
      leading: const CircleAvatar(
        radius: 30,
        backgroundColor: Colors.redAccent,
        backgroundImage: NetworkImage(
          'https://i.pinimg.com/474x/1c/55/dc/1c55dc5df7e3002083fafcb388091fee.jpg',
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Nahul ($index)',
          ),
          Text(
            '2:16 PM',
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: Sizes.size12,
            ),
          ),
        ],
      ),
      subtitle: const Text('Say hi to AntunioBm'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Direct messages'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const FaIcon(
              FontAwesomeIcons.plus,
            ),
          ),
        ],
        elevation: 1,
      ),
      body: AnimatedList(
        key: _key,
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size10,
        ),
        itemBuilder: (context, index, animation) {
          return FadeTransition(
            key: UniqueKey(),
            opacity: animation,
            child: SizeTransition(
              sizeFactor: animation,
              child: _makeTile(index),
            ),
          );
        },
      ),
    );
  }
}
