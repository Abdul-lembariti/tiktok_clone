import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

enum Direction { right, left }

enum Page { first, second }

class Tutorial extends StatefulWidget {
  const Tutorial({super.key});

  @override
  State<Tutorial> createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  late Direction _direction = Direction.right;
  late Page _showPage = Page.first;

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      setState(() {
        _direction = Direction.right;
      });
    } else {
      setState(() {
        _direction = Direction.left;
      });
    }
  }

  void _onPanEnd(DragEndDetails details) {
    if (_direction == Direction.left) {
      setState(() {
        _showPage = Page.second;
      });
    } else {
      setState(() {
        _showPage = Page.first;
      });
    }
  }

  void _onNext() {
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size20,
          ),
          child: SafeArea(
            child: AnimatedCrossFade(
              firstChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v80,
                  const Text(
                    'Watch cool videos!',
                    style: TextStyle(
                      fontSize: Sizes.size36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v16,
                  const Text(
                    'Videos are personalized for you based on what you watch,like, and share',
                    style: TextStyle(
                      fontSize: Sizes.size20,
                    ),
                  ),
                  Gaps.v80,
                  SizedBox(
                    height: 400,
                    width: 600,
                    child: Image.network(
                      'https://i.pinimg.com/474x/50/99/f8/5099f86cae894937ec12319552870b47.jpg',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
              secondChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v80,
                  const Text(
                    'Follow the rules',
                    style: TextStyle(
                      fontSize: Sizes.size40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v16,
                  const Text(
                    'Take care of one another! Please',
                    style: TextStyle(
                      fontSize: Sizes.size20,
                    ),
                  ),
                  Gaps.v80,
                  SizedBox(
                    height: 500,
                    width: 600,
                    child: Image.network(
                      'https://i.pinimg.com/474x/50/99/f8/5099f86cae894937ec12319552870b47.jpg',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
              crossFadeState: _showPage == Page.first
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size24,
            horizontal: Sizes.size24,
          ),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _showPage == Page.first ? 0 : 1,
            child: CupertinoButton(
              color: Theme.of(context).primaryColor,
              onPressed: _onNext,
              child: const Text('Enter the app!'),
            ),
          ),
        ),
      ),
    );
  }
}
