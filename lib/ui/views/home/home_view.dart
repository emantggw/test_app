import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:test_app/ui/common/app_colors.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  HomeView({Key? key}) : super(key: key);

  final bottomNavMenuList = [
    {
      'title': 'Home',
      'icon': OctIcons.apps_16,
      'selectedIcon': Icons.apps_rounded,
    },
    {
      'title': 'Qucon',
      'icon': BoxIcons.bx_video,
      'selectedIcon': Icons.video_call_rounded,
    },
    {
      'title': 'Zaddy',
      'icon': BoxIcons.bx_bot,
      'selectedIcon': FontAwesome.bots,
    },
    {
      'title': 'Organize',
      'icon': Icons.send_and_archive,
      'selectedIcon': Icons.safety_check,
    },
    {
      'title': 'Profile',
      'icon': Icons.person,
      'selectedIcon': Icons.person_2_rounded,
    }
  ];

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      key: viewModel.scaffoldKey,
      drawer: const MenuDrawer(),
      backgroundColor: kcPrimaryColorDark,
      // bottomNavigationBar: Container(
      //   color: kcPrimaryColorDark,
      //   child: BottomNavigationBar(
      //     selectedItemColor: kcPrimaryColor,
      //     showUnselectedLabels: true,
      //     backgroundColor: kcBackgroundColor,
      //     type: BottomNavigationBarType.fixed,
      //     unselectedItemColor: kcLightGrey,
      //     items: const <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(
      //         icon: Icon(OctIcons.apps_16),
      //         label: 'Home',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(EvaIcons.video),
      //         label: 'Qucon',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.replay),
      //         label: 'Zaady',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.arrow_back),
      //         label: 'Profile',
      //       ),
      //     ],
      //     currentIndex: viewModel.currentTapIndex,
      //     onTap: viewModel.onTapChanged,
      //   ),
      // ),
      bottomNavigationBar: viewModel.showButtons
          ? StyleProvider(
              style: BottomNavStyle(),
              child: ConvexAppBar.badge(
                const {
                  2: 5,
                },
                // badgeMargin: const EdgeInsets.only(bottom: 30.0, left: 30.0),
                style: TabStyle.react,
                elevation: 0,
                color: CupertinoColors.systemGrey,
                backgroundColor: kcPrimaryColorDark,
                activeColor: kcPrimaryColor,

                curveSize: 0,
                items: [
                  ...bottomNavMenuList.map(
                    (item) => TabItem(
                      icon: item['icon'] as IconData,
                      title: (item['title'] as String),
                    ),
                  ),
                ],
                onTap: (int i) => (i) {},
              ))
          : null,
      body: Stack(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: postContent(context, viewModel),
        ),
        if (viewModel.showButtons) reactionsButtons(context, viewModel),
        sideRetarctor(viewModel),
        topMenu(viewModel),
      ]),
    );
  }

  Positioned topMenu(HomeViewModel viewModel) {
    return Positioned(
        top: 10,
        left: 30,
        child: SafeArea(
          child: GestureDetector(
              onTap: viewModel.onTopMenuTapped,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: kcWhite, borderRadius: BorderRadius.circular(4)),
                child: const Icon(Icons.menu),
              )),
        ));
  }

  Widget postContent(BuildContext context, HomeViewModel viewModel) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/sample_image3.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Positioned(
            bottom: 50,
            left: 25,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height - 50),
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width * 0.75,
                    decoration: BoxDecoration(
                        color: kcSecondary.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: !viewModel.showReadMoreCaptionMode,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: viewModel.toggleCaptionReadMode,
                                child: const Text(
                                  "Less",
                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                              const Icon(
                                Icons.keyboard_double_arrow_down,
                                color: Colors.green,
                                size: 17,
                              )
                            ],
                          ),
                        ),
                        Visibility(
                          visible: viewModel.showReadMoreCaptionMode,
                          replacement: const Text(
                            "The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The long text caption should showed The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. \n\n The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. \nThe quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog.The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog.\n ",
                            style: TextStyle(color: kcLightGrey),
                          ),
                          child: const Text(
                            "The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog",
                            style: TextStyle(color: kcLightGrey),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "27 Oct, 2020 @5:23pm",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 237, 123, 161),
                                  fontSize: 12),
                            ),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: kcPrimaryColorDark.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Visibility(
                                visible: viewModel.showReadMoreCaptionMode,
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: viewModel.toggleCaptionReadMode,
                                      child: const Text(
                                        "...More",
                                        style: TextStyle(color: Colors.green),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.keyboard_double_arrow_up,
                                      color: Colors.green,
                                      size: 17,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ))
      ],
    );
  }

  Positioned sideRetarctor(HomeViewModel viewModel) {
    return Positioned(
        bottom: 15,
        left: viewModel.showButtons ? null : 0,
        right: viewModel.showButtons ? 0 : null,
        child: GestureDetector(
          onTap: viewModel.toggleButtons,
          child: Container(
            decoration: BoxDecoration(
                color: kcPrimaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.only(
                    topLeft: !viewModel.showButtons
                        ? Radius.zero
                        : const Radius.circular(8),
                    bottomLeft: !viewModel.showButtons
                        ? Radius.zero
                        : const Radius.circular(8),
                    topRight: viewModel.showButtons
                        ? Radius.zero
                        : const Radius.circular(8),
                    bottomRight: viewModel.showButtons
                        ? Radius.zero
                        : const Radius.circular(8))),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
              child: Icon(
                !viewModel.showButtons
                    ? Icons.keyboard_double_arrow_right_rounded
                    : Icons.keyboard_double_arrow_left_rounded,
                color: kcWhite,
              ),
            ),
          ),
        ));
  }

  Positioned reactionsButtons(BuildContext context, HomeViewModel viewModel) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.53,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Column(
          children: [
            ClipOval(
              child: Image.asset(
                "assets/images/sample_image4.jpg",
                width: 42,
                height: 42,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Icon(
              Icons.bookmark,
              color: kcWhite,
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: viewModel.onCommentTapped,
              child: const Column(
                children: [
                  Icon(
                    Icons.comment,
                    color: kcWhite,
                  ),
                  Text(
                    "45k",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Column(
              children: [
                Icon(
                  Icons.favorite,
                  color: kcWhite,
                ),
                Text(
                  "75k",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Icon(
              Icons.share,
              color: kcWhite,
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel(context: context);
}

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          width: MediaQuery.of(context).size.width * .65,
          backgroundColor: Colors.transparent,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.6,
                padding: const EdgeInsets.all(16),
                child: const Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.post_add,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Post a Seequl")
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          EvaIcons.heart,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("View your likes")
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.book_online,
                          color: Colors.brown,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Your Seequal posts")
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          EvaIcons.bookmark,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Reference contribution")
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          EvaIcons.hash,
                          color: Colors.brown,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Hashtag challenges")
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          EvaIcons.bell,
                          color: Color.fromARGB(255, 30, 106, 32),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Notification")
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          EvaIcons.info,
                          color: Colors.brown,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("About")
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class BottomNavStyle extends StyleHook {
  @override
  double get activeIconSize => 30;

  @override
  double get activeIconMargin => 10;

  @override
  double get iconSize => 24;

  @override
  TextStyle textStyle(Color color, String? fontFamily) {
    return TextStyle(fontSize: 14, color: color, fontFamily: fontFamily);
  }
}
