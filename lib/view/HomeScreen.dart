import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:travel_app2/controller/home_screen_controller.dart';

import '../component/Colors.dart';
import '../Models/FakeData.dart';
import '../gen/assets.gen.dart';
import '../component/myStrings.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Obx(
        () => Column(
          children: [
            poster(),
            SizedBox(
              height: size.height / 14,
            ),
            //Tags
            tagList(),

            //hotest Article Title
            HomeScreenAricleTitle(textTheme: textTheme),
            //Hotest Article Lists
            topVisited(),
            //podcast List Title
            HomeScreenPodcastTitle(textTheme: textTheme),
            //podcasts list
            topPodcasts(),
          ],
        ),
      ),
    );
  }

  Widget poster() {
    return homeScreenController.loading.value == false
        ? Obx(
            () => Stack(
              children: [
                //Poster
                Center(
                  child: Container(
                    width: size.width / 1.19,
                    height: size.height / 4.2,
                    foregroundDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                            colors: GradientColors.bestArticleBg,
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    child: CachedNetworkImage(
                      imageBuilder: (context, imageProvider) {
                        return ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(image: imageProvider));
                      },
                      imageUrl: homeScreenController.poster.value.image!,
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 15,
                  //PosterTitle
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                homePagePosterMap['writer'] +
                                    ' - ' +
                                    homePagePosterMap['date'],
                                style: textTheme.bodyMedium),
                            Row(
                              children: [
                                Text(
                                  homePagePosterMap['view'],
                                  style: textTheme.bodyMedium,
                                ),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 3, 3),
                                  child: Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: SolidColors.posterSubTitle,
                                    size: 15,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          homeScreenController.poster.value.title!,
                          style: textTheme.bodyLarge,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        : const SpinKitFadingCube(
            color: SolidColors.primeryColor,
            size: 32,
          );
  }

  Widget tagList() {
    return SizedBox(
      height: 40,
      child: Obx(
        () => ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: homeScreenController.tagsList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(
                  right: index == 0 ? 20 : 0,
                  left: index == homeScreenController.tagsList.length - 1
                      ? 20
                      : 0,
                ),
                child: Container(
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
                          homeScreenController.tagsList[index].title,
                          style: textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  Widget topVisited() {
    return SizedBox(
      height: size.height / 4.0,
      child: Obx(
        () => ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: homeScreenController.topVisitedList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                    right: index == 0 ? 20 : 0,
                    left:
                        index == homeScreenController.topVisitedList.length - 1
                            ? 20
                            : 0),
                child: SizedBox(
                  width: size.width / 2.3,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CachedNetworkImage(
                            errorWidget: (context, url, error) {
                              return const Icon(
                                Icons.image_not_supported_outlined,
                                color: SolidColors.primeryColor,
                                size: 32,
                              );
                            },
                            progressIndicatorBuilder: (context, url, progress) {
                              return const SpinKitFadingCube(
                                color: SolidColors.primeryColor,
                                size: 30,
                              );
                            },
                            imageUrl: homeScreenController
                                .topVisitedList[index].image,
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                width: size.width / 2.3,
                                height: size.height / 5.5,
                                foregroundDecoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      colors: GradientColors.hotestBg,
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                          //Tag Sub Title
                          Positioned(
                            right: 30,
                            bottom: 5,
                            left: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  homeScreenController
                                      .topVisitedList[index].author,
                                  style: textTheme.bodyMedium,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      homeScreenController
                                          .topVisitedList[index].view,
                                      style: textTheme.bodyMedium,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 3, 3),
                                      child: Icon(
                                        Icons.remove_red_eye_outlined,
                                        color: SolidColors.posterSubTitle,
                                        size: 15,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 7, 15, 0),
                          child: Text(
                              homeScreenController.topVisitedList[index].title,
                              style: textTheme.bodyMedium!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700)),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  Widget topPodcasts() {
    return SizedBox(
      height: size.height / 2.7,
      child: Obx(
        () => ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: homeScreenController.topPodcastList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(
                    right: index == 0 ? 25 : 10,
                    left:
                        index == homeScreenController.topPodcastList.length - 1
                            ? 25
                            : 10),
                child: Column(
                  children: [
                    CachedNetworkImage(
                      errorWidget: (context, url, error) {
                        return const Icon(
                          Icons.image_not_supported_outlined,
                          color: SolidColors.primeryColor,
                          size: 32,
                        );
                      },
                      progressIndicatorBuilder: (context, url, progress) {
                        return const SpinKitFadingCube(
                          color: SolidColors.primeryColor,
                          size: 32,
                        );
                      },
                      imageUrl:
                          homeScreenController.topPodcastList[index].poster,
                      imageBuilder: (context, imageProvider) {
                        return SizedBox(
                          height: size.height / 5,
                          width: size.width / 2.6,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //podcast content
                    Text(
                      homeScreenController.topPodcastList[index].title,
                      style: textTheme.bodyLarge!.apply(color: Colors.black),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class HomeScreenPodcastTitle extends StatelessWidget {
  const HomeScreenPodcastTitle({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 40, 32, 20),
      child: Row(
        children: [
          Assets.img.icons.microphone.image(height: 23, width: 23),
          const SizedBox(
            width: 5,
          ),
          Text(
            MyStrings.viewHotestpodcasts,
            style: textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}

class HomeScreenAricleTitle extends StatelessWidget {
  const HomeScreenAricleTitle({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 45, 32, 20),
      child: Row(
        children: [
          Assets.img.icons.pen.image(height: 20, width: 20),
          const SizedBox(
            width: 5,
          ),
          Text(
            MyStrings.viewHotestBlog,
            style: textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
