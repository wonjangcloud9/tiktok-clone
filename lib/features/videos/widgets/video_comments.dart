import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Sizes.size14,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          automaticallyImplyLeading: false,
          title: const Text("test"),
          actions: [
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.xmark,
              ),
              onPressed: _onClosePressed,
            ),
          ],
        ),
        body: ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size16,
            vertical: Sizes.size10,
          ),
          separatorBuilder: (context, index) => Gaps.v20,
          itemCount: 10,
          itemBuilder: (context, index) => Row(
            children: [
              CircleAvatar(
                radius: 18,
                child: const Text("원장"),
              ),
              Gaps.h10,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "test",
                          style: TextStyle(color: Colors.grey.shade500),
                        ),
                        Gaps.h10,
                        Text(
                          "test",
                          style: TextStyle(color: Colors.grey.shade500),
                        ),
                      ],
                    ),
                    Gaps.v5,
                    Text(
                      "test",
                      style: TextStyle(color: Colors.grey.shade500),
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
                    color: Colors.grey.shade500,
                  ),
                  Gaps.v2,
                  Text(
                    "52.2K",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Add a comment...",
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size16,
                    vertical: Sizes.size10,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Post"),
            ),
          ],
        )),
      ),
    );
  }
}
