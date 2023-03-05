import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:travel_app2/Models/FakeData.dart';
import 'package:travel_app2/Models/data_models.dart';

import 'package:travel_app2/gen/assets.gen.dart';

import '../component/Colors.dart';
import '../component/MyComponents.dart';
import '../component/myStrings.dart';

class MyCategory extends StatefulWidget {
  const MyCategory({super.key});

  @override
  State<MyCategory> createState() => _MyCategoryState();
}

class _MyCategoryState extends State<MyCategory> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
          child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                //monkey image
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                  child: Assets.img.monkey.svg(width: 120, height: 120),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: MyStrings.cangragulatino,
                    style: textTheme.titleMedium!
                        .apply(color: SolidColors.primeryColor),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //text field
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(size.width / 7, 0, size.width / 7, 0),
                  child: const TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(right: 40),
                          hintText: 'نام و نام خانوادگی')),
                ),
                const SizedBox(
                  height: 50,
                ),
                //category title
                Text(
                  MyStrings.chooseCategory,
                  style: textTheme.titleMedium!
                      .apply(color: SolidColors.primeryColor),
                ),
                // category items
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                  child: SizedBox(
                    height: 110,
                    child: GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: tagList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: .2,
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                if (!tagChoose.contains(tagList[index])) {
                                  tagChoose.add(tagList[index]);
                                }
                              });
                            },
                            child: MainTags(
                              size: size,
                              textTheme: textTheme,
                              index: index,
                            ),
                          );
                        }),
                  ),
                ),
                //flesh =>  padding for align in center
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Assets.img.icons.flesh.svg(height: 60),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                  child: SizedBox(
                    height: 110,
                    child: GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: tagChoose.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: .2,
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: size.width / 35),
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: SolidColors.choosenTagOontainerColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 15, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkResponse(
                                      onTap: () {
                                        setState(() {
                                          tagChoose.removeAt(index);
                                        });
                                      },
                                      child: const Icon(CupertinoIcons.delete)),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    tagChoose[index].title,
                                    style: textTheme.titleMedium!
                                        .apply(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
