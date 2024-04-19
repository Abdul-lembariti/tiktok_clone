import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/settings/settings_screen.dart';
import 'package:tiktok_clone/features/users/widgets/persist_tab.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _onSetings(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const SettingsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    title: const Text('Nahul'),
                    actions: [
                      IconButton(
                        onPressed: () => _onSetings(context),
                        icon: const FaIcon(
                          FontAwesomeIcons.gear,
                          size: Sizes.size20,
                        ),
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
                            'https://i.pinimg.com/474x/56/f7/14/56f714e6f2cf618eeab51b7ed6e41d05.jpg',
                          ),
                          child: Text(
                            'NHL',
                          ),
                        ),
                        Gaps.v20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '@Nahul',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: Sizes.size18,
                              ),
                            ),
                            Gaps.h4,
                            FaIcon(
                              FontAwesomeIcons.solidCircleCheck,
                              size: Sizes.size16,
                              color: Colors.blue[500],
                            ),
                          ],
                        ),
                        Gaps.v20,
                        SizedBox(
                          height: Sizes.size60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    '97',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: Sizes.size18,
                                    ),
                                  ),
                                  Gaps.v3,
                                  Text(
                                    'Following',
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ],
                              ),
                              VerticalDivider(
                                width: Sizes.size32,
                                thickness: 1,
                                indent: Sizes.size10,
                                endIndent: Sizes.size14,
                                color: Colors.grey[300],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    '10.5M',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: Sizes.size18,
                                    ),
                                  ),
                                  Gaps.v3,
                                  Text(
                                    'Followers',
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ],
                              ),
                              VerticalDivider(
                                width: Sizes.size32,
                                thickness: 1,
                                indent: Sizes.size10,
                                endIndent: Sizes.size14,
                                color: Colors.grey[300],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    '12M',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: Sizes.size18,
                                    ),
                                  ),
                                  Gaps.v3,
                                  Text(
                                    'Likes',
                                    style: TextStyle(
                                      color: Colors.grey[500],
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
                                Radius.circular(
                                  Sizes.size4,
                                ),
                              ),
                            ),
                            child: const Text(
                              'Follow',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Gaps.v14,
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Sizes.size32,
                          ),
                          child: Text(
                            'All the trending story in town are from us, I wonder if u miss them u gonna be lorem iptusm',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Gaps.v14,
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.link,
                              size: Sizes.size12,
                            ),
                            Gaps.h4,
                            Text(
                              'https://jambo.team',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Gaps.v20,
                      ],
                    ),
                  ),
                  SliverPersistentHeader(
                    delegate: PersistentTabBar(),
                    pinned: true,
                  ),
                ];
              },
              body: TabBarView(children: [
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: 21,
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: Sizes.size2,
                    crossAxisSpacing: Sizes.size2,
                    childAspectRatio: 9 / 16.5,
                  ),
                  itemBuilder: (context, index) => Column(
                    children: [
                      Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: 9 / 16,
                            child: FadeInImage.assetNetwork(
                              fit: BoxFit.cover,
                              placeholder: 'assets/images/img.jpeg',
                              image:
                                  'https://i.pinimg.com/474x/79/d2/e3/79d2e329a0f6af978584d97dfd39396e.jpg',
                            ),
                          ),
                          if (index == 0)
                            Positioned(
                              left: 5,
                              top: 5,
                              child: Container(
                                padding: const EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: const Text(
                                  'Pinned',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          const Positioned(
                            bottom: 3,
                            left: 5,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.play,
                                  color: Colors.white,
                                ),
                                Gaps.h10,
                                Text(
                                  '4.1M',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Center(
                  child: Text(
                    'Page 2',
                  ),
                ),
              ])),
        ),
      ),
    );
  }
}

/*  */