import 'package:flutter/material.dart';
import '../Models/FakeData.dart';
import '../gen/assets.gen.dart';
import 'Colors.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: .5,
      color: SolidColors.divider,
      indent: 80,
      endIndent: 80,
    );
  }
}

class MainTags extends StatelessWidget {
  MainTags({
    super.key,
    required this.size,
    required this.textTheme,
    required this.index,
  });

  final Size size;
  final TextTheme textTheme;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width / 35),
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: SolidColors.colorTextTitle,
        gradient: const LinearGradient(
            colors: GradientColors.hashtagBg,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 15, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Assets.img.icons.hashtag.image(width: 12, height: 12),
            const SizedBox(
              width: 20,
            ),
            Text(
              tagList[index].title,
              style: textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
