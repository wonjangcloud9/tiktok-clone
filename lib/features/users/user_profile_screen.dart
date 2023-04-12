import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/settings/settings_screen.dart';
import 'package:tiktok_clone/features/users/widgets/persistent_tab_bar.dart';

class UserProfileScreen extends StatefulWidget {
  final String username;
  final String tab;

  const UserProfileScreen({
    super.key,
    required this.username,
    required this.tab,
  });

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  void _onGearPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: SafeArea(
        child: DefaultTabController(
          initialIndex: widget.tab == "likes" ? 1 : 0,
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  title: Text(widget.username),
                  actions: [
                    IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.gear,
                        size: Sizes.size20,
                      ),
                      onPressed: _onGearPressed,
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Gaps.v20,
                      const CircleAvatar(
                        radius: 50,
                        foregroundImage: NetworkImage(
                            "https://avatars.githubusercontent.com/u/48057918?v=4"),
                        child: Text("Wonjang"),
                      ),
                      Gaps.v20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "@${widget.username}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Sizes.size18,
                            ),
                          ),
                          Gaps.h5,
                          FaIcon(
                            FontAwesomeIcons.solidCircleCheck,
                            size: Sizes.size16,
                            color: Colors.blue.shade500,
                          ),
                        ],
                      ),
                      Gaps.v24,
                      SizedBox(
                        height: Sizes.size48,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  "37",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Sizes.size14,
                                  ),
                                ),
                                Gaps.v3,
                                Text(
                                  "Following",
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ],
                            ),
                            VerticalDivider(
                              color: Colors.grey.shade400,
                              width: Sizes.size32,
                              thickness: Sizes.size1,
                              indent: Sizes.size14,
                              endIndent: Sizes.size14,
                            ),
                            Column(
                              children: [
                                const Text(
                                  "10.5M",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Sizes.size14,
                                  ),
                                ),
                                Gaps.v3,
                                Text(
                                  "Followers",
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ],
                            ),
                            VerticalDivider(
                              color: Colors.grey.shade400,
                              width: Sizes.size32,
                              thickness: Sizes.size1,
                              indent: Sizes.size14,
                              endIndent: Sizes.size14,
                            ),
                            Column(
                              children: [
                                const Text(
                                  "194.3M",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Sizes.size14,
                                  ),
                                ),
                                Gaps.v3,
                                Text(
                                  "Likes",
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Gaps.v14,
                      FractionallySizedBox(
                        widthFactor: 0.33,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: Sizes.size12,
                          ),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(Sizes.size4),
                              )),
                          child: const Text(
                            "Follow",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Sizes.size16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Gaps.v14,
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.size32,
                        ),
                        child: Text(
                          "All highlights and where to watch live matches on FIFA I wonder how it would look",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Gaps.v14,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.link,
                            size: Sizes.size12,
                          ),
                          Gaps.h4,
                          Text(
                            "https://github.com/wonjangcloud9",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SliverPersistentHeader(
                  delegate: PersistentTabBar(),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              children: [
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: 20,
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: Sizes.size2,
                    mainAxisSpacing: Sizes.size2,
                    childAspectRatio: 9 / 14,
                  ),
                  itemBuilder: (context, index) => Column(
                    children: [
                      Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: 9 / 14,
                            child: FadeInImage.assetNetwork(
                              fit: BoxFit.cover,
                              placeholder: "assets/images/placeholder.jpg",
                              image:
                                  "https://upload.wikimedia.org/wikipedia/en/2/2d/SSU_Kirby_artwork.png",
                            ),
                          ),
                          Positioned(
                            left: Sizes.size10,
                            bottom: Sizes.size16,
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                horizontal: Sizes.size4,
                                vertical: Sizes.size2,
                              ),
                              child: Row(
                                children: const [
                                  FaIcon(
                                    FontAwesomeIcons.play,
                                    size: Sizes.size12,
                                    color: Colors.white,
                                  ),
                                  Gaps.h6,
                                  Text(
                                    "4.1M",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Sizes.size12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Center(
                  child: Text("Page two"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
