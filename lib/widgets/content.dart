import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:instagram/data_source/dummy.dart';
import 'package:instagram/shared/my_icon_btn.dart';
import 'package:instagram/shared/util.dart';

class Content extends StatefulWidget {
  const Content({super.key});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  int? maxLines = 2;
  bool isLike = false;
  bool isSave = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        topSection,
        mainContent,
        actions,
        bottomSection,
        h8,
      ],
    );
  }

  get comment {
    return GestureDetector(
      onTap: commentClick,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Text(
          "View all 30 comments",
          style: TextStyle(color: Colors.grey[600]!),
        ),
      ),
    );
  }

  get time {
    return Text(
      "3 hours ago",
      style: TextStyle(color: Colors.grey[600]!, fontSize: 12),
    );
  }

  get mainContent {
    return GestureDetector(
      onDoubleTap: () {
        isLike = true;
        setState(() {});
      },
      child: Image.network(
        contentImageUrl,
        width: double.maxFinite,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  get bottomSection {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("53 likes"),
            description,
            comment,
            time,
          ],
        ),
      ),
    );
  }

  get description {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style.copyWith(),
        children: <TextSpan>[
          const TextSpan(
            text: 'enterKomputer',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: ' yang kamu pake mouse gaming ranknya udah apa? jawab ya karena aku kepo bingit, jangan bikin aku marah ya, awas ya kamu uhk uhk uhk',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                maxLines = 99;
                setState(() {});
              },
          ),
        ],
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
    );
  }

  get topSection {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(99),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(99),
                    child: Image.network(
                      profileImageUrl,
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                w8,
                Text(
                  "MiawAug",
                  style: Theme.of(context).textTheme.labelLarge,
                )
              ],
            ),
          ),
          MyIconBtn(
            onTap: () {},
            icon: const HeroIcon(HeroIcons.ellipsisVertical),
          )
        ],
      ),
    );
  }

  Widget get actions {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            MyIconBtn(
                onTap: () {
                  isLike = !isLike;
                  setState(() {});
                },
                icon: HeroIcon(
                  HeroIcons.heart,
                  color: isLike ? Colors.red : Colors.black,
                  style: isLike ? HeroIconStyle.solid : HeroIconStyle.outline,
                )),
            MyIconBtn(
              onTap: commentClick,
              icon: const HeroIcon(HeroIcons.chatBubbleOvalLeft),
            ),
            MyIconBtn(onTap: () {}, icon: const HeroIcon(HeroIcons.paperAirplane)),
          ],
        ),
        MyIconBtn(
            onTap: () {
              isSave = !isSave;
              setState(() {});
            },
            icon: HeroIcon(
              HeroIcons.bookmark,
              style: isSave ? HeroIconStyle.solid : HeroIconStyle.outline,
            ))
      ],
    );
  }

  void commentClick() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(8 * 2),
            ),
            color: Colors.white,
          ),
          width: double.maxFinite,
          height: 300,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 8 * 2, 0, 8 * 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(99),
                  color: Colors.grey[700],
                ),
                height: 5,
                width: 40,
              ),
              const Text(
                "Comments",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              h8,
              Divider(
                color: Colors.grey[300],
              )
            ],
          ),
        );
      },
    );
  }
}
