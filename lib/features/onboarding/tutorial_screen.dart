import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/onboarding/widgets/tutorial_page1.dart';
import 'package:tiktok_clone/features/onboarding/widgets/tutorial_page2.dart';

import '../../constants/sizes.dart';

enum Direction { right, left }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  Page _page = Page.first;

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      // swipe right
      setState(() {
        _direction = Direction.right;
      });
    } else {
      // swipe left
      setState(() {
        _direction = Direction.left;
      });
    }
  }

  void _onPanEnd(DragEndDetails details) {
    if (_direction == Direction.right) {
      setState(() {
        _page = Page.first;
      });
    } else {
      setState(() {
        _page = Page.second;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size24,
          ),
          child: SafeArea(
            child: AnimatedCrossFade(
              crossFadeState: _page == Page.first
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
              firstChild: const TutorialPage1(),
              secondChild: const TutorialPage2(),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size24,
                horizontal: Sizes.size24,
              ),
              child: AnimatedOpacity(
                opacity: _page == Page.first ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 300),
                child: CupertinoButton(
                  color: Theme.of(context).primaryColor,
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                ),
              )),
        ),
      ),
    );
  }
}
