import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/generated/l10n.dart';
import 'package:tiktok_clone/utilis.dart';

class CommentsVideo extends StatefulWidget {
  const CommentsVideo({super.key});

  @override
  State<CommentsVideo> createState() => _CommentsVideoState();
}

class _CommentsVideoState extends State<CommentsVideo> {
  bool _isWriting = false;

  void _onCloseComments() {
    Navigator.of(context).pop();
  }

  void _onTap() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  void _startWrting() {
    setState(() {
      _isWriting = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.7,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Sizes.size20,
        ),
      ),
      child: Scaffold(
        backgroundColor: isDark ? null : Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: isDark ? null : Colors.grey.shade50,
          automaticallyImplyLeading: false,
          title: Text(
            S.of(context).totalComment(
                  12323222,
                ),
          ),
          actions: [
            IconButton(
              onPressed: _onCloseComments,
              icon: const FaIcon(FontAwesomeIcons.xmark),
            ),
          ],
        ),
        body: GestureDetector(
          onTap: _onTap,
          child: Stack(
            children: [
              ListView.separated(
                padding: const EdgeInsets.only(
                  top: Sizes.size10,
                  left: Sizes.size16,
                  right: Sizes.size16,
                  bottom: Sizes.size96 + Sizes.size20,
                ),
                separatorBuilder: (context, index) => Gaps.v20,
                itemCount: 10,
                itemBuilder: (context, index) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 18,
                      foregroundImage: const NetworkImage(
                        'https://i.pinimg.com/474x/62/54/7e/62547eb56adaab5c73067cc63d80b253.jpg',
                      ),
                      backgroundColor: isDark ? Colors.grey[800] : null,
                      child: const Text('Nah'),
                    ),
                    Gaps.h10,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nahul',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Sizes.size14,
                              color: Colors.grey[400],
                            ),
                          ),
                          Gaps.v3,
                          Text(
                            S.of(context).comment,
                          ),
                        ],
                      ),
                    ),
                    Gaps.h10,
                    Column(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.heart,
                          size: Sizes.size20,
                          color: Colors.grey[500],
                        ),
                        Gaps.v2,
                        Text(
                          S.of(context).commentLike(122333),
                          style: TextStyle(
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                width: size.width,
                child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: Sizes.size16,
                      right: Sizes.size16,
                      top: Sizes.size10,
                      bottom: Sizes.size48,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 18,
                          foregroundImage: const NetworkImage(
                              'https://i.pinimg.com/474x/62/54/7e/62547eb56adaab5c73067cc63d80b253.jpg'),
                          backgroundColor: Colors.grey[500],
                          foregroundColor: Colors.white,
                          child: const Text('Nah'),
                        ),
                        Gaps.h10,
                        Expanded(
                          child: SizedBox(
                            height: Sizes.size48,
                            child: TextField(
                              onTap: _startWrting,
                              expands: true,
                              minLines: null,
                              maxLines: null,
                              textInputAction: TextInputAction.newline,
                              cursorColor: Theme.of(context).primaryColor,
                              decoration: InputDecoration(
                                hintText: 'Add Comment',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    Sizes.size12,
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: isDark
                                    ? Colors.grey[800]
                                    : Colors.grey[200],
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: Sizes.size12,
                                ),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                    right: Sizes.size14,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.at,
                                        color: isDark
                                            ? Colors.grey[500]
                                            : Colors.grey[900],
                                      ),
                                      Gaps.h14,
                                      FaIcon(
                                        FontAwesomeIcons.gift,
                                        color: isDark
                                            ? Colors.grey[500]
                                            : Colors.grey[900],
                                      ),
                                      Gaps.h14,
                                      FaIcon(
                                        FontAwesomeIcons.faceSmile,
                                        color: isDark
                                            ? Colors.grey[500]
                                            : Colors.grey[900],
                                      ),
                                      Gaps.h14,
                                      if (_isWriting)
                                        GestureDetector(
                                          onTap: _onTap,
                                          child: FaIcon(
                                            FontAwesomeIcons.circleArrowRight,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
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
      ),
    );
  }
}
