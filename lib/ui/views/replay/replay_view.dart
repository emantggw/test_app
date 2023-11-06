import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:test_app/ui/common/app_colors.dart';

import 'replay_viewmodel.dart';

class ReplayView extends StackedView<ReplayViewModel> {
  ReplayView({Key? key}) : super(key: key);

  double textDescrHeight = 0;

  @override
  Widget builder(
    BuildContext context,
    ReplayViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: kcWhite,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Row(
            children: [
              InkWell(
                onTap: viewModel.onBack,
                child: const CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.black54,
                  child: Icon(
                    Icons.arrow_back,
                    color: kcWhite,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              const Text(
                "Replay",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 16),
              )
            ],
          ),
        ),
        body: Container(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/sample_image2.jpg",
                          height: 46,
                          width: 46,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 120,
                        child: VerticalDivider(
                          color: Color.fromARGB(255, 195, 181, 60),
                          width: 20,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        userNameAvatar(
                            context, "Kerry Johns", "Kerryjo", "3 hours ago"),
                        const SizedBox(height: 10),
                        LayoutBuilder(builder:
                            (BuildContext context, BoxConstraints constraints) {
                          textDescrHeight = constraints.maxHeight;
                          return commentText(context,
                              "The quick brown🔥 fox jumps over the lazy dog. The quick brown fox jumps❤️🧐 over the lazy dog. \nThe quick brown fox jumps over the lazy dog.The quick brown fox jumps over the lazy dog.");
                        }),
                        const SizedBox(height: 15),
                        const Row(
                          children: [
                            Text(
                              "Replying to ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            Text(
                              "John Doe @JohntheD",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 238, 215, 7)),
                            )
                          ],
                        ),
                      ])
                ]),
                Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        "assets/images/sample_image3.jpg",
                        height: 46,
                        width: 46,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                      controller: viewModel.textEditingController,
                      decoration: InputDecoration(
                        hintText: "Add reply",
                        contentPadding: EdgeInsets.zero,
                        prefixIcon: IconButton(
                            onPressed: viewModel.showEmojies,
                            icon: const Icon(Icons.emoji_emotions)),
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.send,
                            color: Colors.blue,
                          ),
                          onPressed: () {},
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ))
                  ],
                ),
              ],
            )));
  }

  SizedBox commentText(BuildContext context, String text) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Text(
          text,
          style: const TextStyle(color: Color.fromARGB(255, 129, 124, 124)),
        ));
  }

  Row userNameAvatar(
      BuildContext context, String fullName, String userName, String hours) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.48,
          child: Row(
            children: [
              Text(fullName,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(
                width: 5,
              ),
              Text(
                userName,
                style: const TextStyle(color: Colors.blue),
              )
            ],
          ),
        ),
        Text(
          hours,
          style: const TextStyle(color: Colors.grey),
        )
      ],
    );
  }

  @override
  ReplayViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ReplayViewModel(context: context);
}
