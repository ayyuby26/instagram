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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        topSection,
        main,
        actions,
        bottomSection,
      ],
    );
  }

  get main {
    return Image.network(
      contentImageUrl,
      width: double.maxFinite,
      fit: BoxFit.fitWidth,
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
            contentDescription,
          ],
        ),
      ),
    );
  }

  get contentDescription {
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
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(profileImageUrl),
              ),
              w8,
              const Text("MiawAug")
            ],
          ),
          IconButton(
            onPressed: () {},
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
            MyIconBtn(onTap: () {}, icon: const HeroIcon(HeroIcons.heart)),
            MyIconBtn(onTap: () {}, icon: const HeroIcon(HeroIcons.chatBubbleOvalLeft)),
            MyIconBtn(onTap: () {}, icon: const HeroIcon(HeroIcons.paperAirplane)),
          ],
        ),
        MyIconBtn(onTap: () {}, icon: const HeroIcon(HeroIcons.bookmark))
      ],
    );
  }
}
