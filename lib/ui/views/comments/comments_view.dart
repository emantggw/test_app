import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:test_app/ui/common/app_colors.dart';

import 'comments_viewmodel.dart';

class CommentsView extends StackedView<CommentsViewModel> {
  const CommentsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CommentsViewModel viewModel,
    Widget? child,
  ) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Column(children: [
          Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 87, 83, 83),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                )),
            padding: const EdgeInsets.all(8),
            child: const Text(
              "45k Comments",
              style: TextStyle(color: kcWhite),
            ),
          ),
          const SizedBox(height: 15),
          userComment(context, viewModel, "assets/images/sample_image.jpg",
              "Kerry Johns", "@Kerryjo"),
          const SizedBox(height: 25),
          userComment(context, viewModel, "assets/images/sample_image2.jpg",
              "Tom Mamo", "@Tomiman"),
        ]),
      ),
    );
  }

  Row userComment(BuildContext context, CommentsViewModel viewModel,
      String avatar, String fullName, String userName) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipOval(
          child: Image.asset(
            avatar,
            height: 52,
            width: 52,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userNameAvatar(context, fullName, userName, "3 hours ago"),
            const SizedBox(height: 10),
            commentText(context,
                "The quick brown🔥 fox jumps over the lazy dog. The quick brown fox jumps❤️🧐 over the lazy dog. \nThe quick brown fox jumps over the lazy dog.The quick brown fox jumps over the lazy dog."),
            const SizedBox(height: 10),
            replayReactions(context, viewModel, "15", "7k"),
            const SizedBox(
              height: 5,
            ),
            viewReplies(),
            const SizedBox(height: 20),
            userNameAvatar(context, fullName, userName, "3 hours ago"),
            const SizedBox(height: 10),
            commentText(
                context, "The quick 🧐🤨brown fox jumps over the 🙄lazy dog"),
            const SizedBox(height: 10),
            replayReactions(context, viewModel, "", "4k"),
            const SizedBox(height: 20),
            userNameAvatar(context, "Kerry Johns", "@Kerryjo", "3 hours ago"),
            const SizedBox(height: 10),
            commentText(
                context, "The quick 🧐🤨brown fox jumps over the 🙄lazy dog"),
            const SizedBox(height: 10),
            replayReactions(context, viewModel, "", "4k"),
            const SizedBox(height: 10),
            viewReplies(),
          ],
        ),
      ],
    );
  }

  Row viewReplies() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromARGB(255, 246, 242, 242)),
          child: const Row(
            children: [
              Text("View 15 replies"),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: Color.fromARGB(255, 248, 117, 108),
              )
            ],
          ),
        ),
      ],
    );
  }

  SizedBox replayReactions(
    BuildContext context,
    CommentsViewModel viewModel,
    String comment,
    String heart,
  ) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: viewModel.onReplayComment,
            child: Row(
              children: [
                const Icon(
                  Bootstrap.chat,
                  color: Colors.grey,
                  size: 19,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  comment,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Row(
            children: [
              const Icon(
                Bootstrap.heart,
                color: Colors.grey,
                size: 19,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                heart,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const Icon(
            Bootstrap.bookmark,
            color: Colors.grey,
            size: 19,
          ),
        ],
      ),
    );
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
  CommentsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CommentsViewModel(context: context);
}
