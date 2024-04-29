import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoint.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/utilis.dart';

import '../../generated/l10n.dart';

final tabs = [
  'Top',
  'Users',
  'Videos',
  'Sounds',
  'Live',
  'Shopping',
  'Entertainments'
];

class DiscoveScreen extends StatefulWidget {
  const DiscoveScreen({super.key});

  @override
  State<DiscoveScreen> createState() => _DiscoveScreenState();
}

class _DiscoveScreenState extends State<DiscoveScreen> {
  final TextEditingController _textEditingController =
      TextEditingController(text: 'intial');

  /*  void _onSearchChange(String value) {
    print('Searching for $value');
  }

  void _onSubmitted(String value) {
    print('Searched for $value');
  } */

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: /* const Text('Search bar'), */
              ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: Breakpoints.sm,
            ),
            child: CupertinoSearchTextField(
              // onChanged: _onSearchChange,
              // onSubmitted: _onSubmitted,
              controller: _textEditingController,
              style: TextStyle(
                color: isDarkMode(context) ? Colors.white : Colors.black,
              ),
            ),
          ),
          bottom: TabBar(
            splashFactory: NoSplash.splashFactory,
            tabAlignment: TabAlignment.start,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16,
            ),
            isScrollable: true,
            tabs: [
              for (var tab in tabs)
                Tab(
                  text: tab,
                ),
            ],
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: TabBarView(
            children: [
              GridView.builder(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size5,
                  vertical: Sizes.size5,
                ),
                itemCount: 20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: width > Breakpoints.lg ? 5 : 2,
                  mainAxisSpacing: Sizes.size10,
                  crossAxisSpacing: Sizes.size10,
                  childAspectRatio: 9 / 20,
                ),
                itemBuilder: (context, index) => LayoutBuilder(
                  builder: (context, constraints) => Column(
                    children: [
                      Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: AspectRatio(
                          aspectRatio: 9 / 15,
                          child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder: 'assets/images/img.jpeg',
                            image:
                                'https://i.pinimg.com/474x/79/d2/e3/79d2e329a0f6af978584d97dfd39396e.jpg',
                          ),
                        ),
                      ),
                      Gaps.v5,
                      Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        S.of(context).discover,
                        style: const TextStyle(
                          fontSize: Sizes.size16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gaps.v5,
                      DefaultTextStyle(
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: isDarkMode(context)
                              ? Colors.grey[300]
                              : Colors.grey[600],
                        ),
                        child: const Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundImage: NetworkImage(
                                'https://i.pinimg.com/474x/df/8f/e4/df8fe449245b2b6dbc9529feaf31d7bf.jpg',
                              ),
                            ),
                            Gaps.h8,
                            Expanded(
                              child: Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                'nahul_realme #sd #lovee #swss',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Gaps.h4,
                            FaIcon(
                              FontAwesomeIcons.heart,
                              size: Sizes.size14,
                            ),
                            Gaps.h2,
                            Text(
                              '2.5M',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              for (var tab in tabs.skip(1))
                Center(
                  child: Text(
                    tab,
                    style: const TextStyle(fontSize: 43),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
