import 'package:flutter/material.dart';

class EmojiesWidget extends StatelessWidget {
  List<String> emojies = [
    "❤️",
    "👍",
    "👎",
    "🥰",
    "🎉",
    "👏",
    "✅",
    "❌",
    "🥁",
    "🔥",
    "💪",
    "😄",
    "😂",
    "🤔",
    "🤯",
    "😱",
    "😢",
    "🤩",
    "🤮",
    "💩",
    "🙏",
    "🤡",
    "🥱",
    "🥴",
    "😍",
    "🐬",
    "😎",
    "🤟",
    "🥺",
    "😩",
    "😡",
    "👿",
    "👻",
    "😺",
    "😜",
    "👊",
    "👀",
    "😤",
    "🙃",
    "🤪",
    "🙏",
    "🎃",
    "🤖",
    "👽",
    "💀",
    "🤒",
    "😷",
    "🤧",
    "🤐",
    "😵",
    "👋",
    "🙋‍♂️",
    "🤦‍♂️",
    "🐶",
    "🦊",
    "🐓",
    "🍎",
    "⚽️",
    "🏀",
    "🎧",
    "🌍",
    "🌼",
    "💦",
    "🧊",
    "🍺",
    "❤️‍🔥",
    "❗️",
    "🔅",
    "❓",
    "❔",
    "🚗",
    "⛳️",
    "✌️"
  ];
  EmojiesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.025),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .8,
        width: MediaQuery.of(context).size.width * .85,
        child: SingleChildScrollView(
          child: RawScrollbar(
              child: Wrap(
            children: List<Widget>.generate(
                emojies.length,
                (index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(emojies[index]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          emojies[index],
                          style: const TextStyle(fontSize: 25),
                        ),
                      ),
                    )),
          )),
        ),
      ),
    );
  }
}
