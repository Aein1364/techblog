import 'package:flutter/material.dart';

import '../component/Colors.dart';

import '../component/MyComponents.dart';
import '../gen/assets.gen.dart';
import '../component/myStrings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 60, 0, 10),
          child: Assets.img.profile
              .image(height: size.width / 3.5, width: size.width / 3.5),
        ),

        //Profile Image Editing
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkResponse(
              radius: 15,
              onTap: () {},
              child: Assets.img.icons.pen.image(height: 20, width: 20),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              MyStrings.imageProfileEditing,
              style:
                  textTheme.titleMedium!.apply(color: const Color(0xff286BB8)),
            )
          ],
        ),
        const SizedBox(
          height: 60,
        ),
        //Name
        Center(
          child: Text(
            'فاطمه امیری',
            style: textTheme.bodyLarge!.apply(color: Colors.black),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        //Email
        Center(
          child: Text(
            'fatemeamiri@gmail.com',
            style: textTheme.titleLarge!.apply(color: Colors.black),
          ),
        ),
        const Padding(
            padding: EdgeInsets.fromLTRB(0, 40, 0, 0), child: TechDivider()),
        //favorite article
        Center(
            child: TextButton(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size(size.width, 30)),
            overlayColor: MaterialStateProperty.all(SolidColors.primeryColor2),
          ),
          child: Text(
            MyStrings.myFavoriteArticle,
            style: textTheme.titleLarge!.apply(color: Colors.black),
          ),
          onPressed: () {},
        )),
        const TechDivider(),
        //favorite podcast
        Center(
          child: TextButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(size.width, 30)),
              overlayColor:
                  MaterialStateProperty.all(SolidColors.primeryColor2),
            ),
            child: Text(
              MyStrings.myFavoritePodcasts,
              style: textTheme.titleLarge!.apply(color: Colors.black),
            ),
            onPressed: () {},
          ),
        ),

        const TechDivider(),
        //exit profile account
        Center(
          child: TextButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(size.width, 30)),
              overlayColor:
                  MaterialStateProperty.all(SolidColors.primeryColor2),
            ),
            child: Text(
              MyStrings.exitProfileAccount,
              style: textTheme.titleLarge!.apply(color: Colors.black),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
