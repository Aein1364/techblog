import 'package:flutter/material.dart';

import '../component/Colors.dart';
import '../Models/FakeData.dart';
import '../component/MyComponents.dart';
import '../gen/assets.gen.dart';
import '../component/myStrings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          HomeScreenPoster(size: size, textTheme: textTheme),
          SizedBox(
            height: size.height / 14,
          ),
          //Tags
          HomeScreenTagList(size: size, textTheme: textTheme),

          //hotest Article Title
          HomeScreenAricleTitle(textTheme: textTheme),
          //Hotest Article Lists
          HomeScreenArticleList(size: size, textTheme: textTheme),
          //podcast List Title
          HomeScreenPodcastTitle(textTheme: textTheme),
          //podcasts list
          HomeScreenPodcastList(size: size, textTheme: textTheme)
        ],
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

class HomeScreenPodcastList extends StatelessWidget {
  const HomeScreenPodcastList({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 2.7,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: hotestPodcatList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(
                  right: index == 0 ? 25 : 10,
                  left: index == hotestPodcatList.length - 1 ? 25 : 10),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 5,
                    width: size.width / 2.6,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: hotestPodcatList[index].image,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //podcast content
                  Text(
                    hotestPodcatList[index].title,
                    style: textTheme.bodyLarge!.apply(color: Colors.black),
                  )
                ],
              ),
            );
          }),
    );
  }
}

class HomeScreenArticleList extends StatelessWidget {
  const HomeScreenArticleList({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 4.0,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: hotestList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  right: index == 0 ? 20 : 0,
                  left: index == hotestList.length - 1 ? 20 : 0),
              child: SizedBox(
                width: size.width / 2.3,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          width: size.width / 2.3,
                          height: size.height / 5.5,
                          foregroundDecoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: GradientColors.hotestBg,
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                              borderRadius: BorderRadius.circular(20)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: hotestList[index].image),
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
                                hotestList[index].name,
                                style: textTheme.bodyMedium,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    hotestList[index].view,
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
                        child: Text(hotestList[index].content,
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
    );
  }
}

class HomeScreenTagList extends StatelessWidget {
  const HomeScreenTagList({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: tagList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(
                right: index == 0 ? 20 : 0,
                left: index == tagList.length - 1 ? 20 : 0,
              ),
              child: MainTags(
                size: size,
                textTheme: textTheme,
                index: index,
              ),
            );
          }),
    );
  }
}

class HomeScreenPoster extends StatelessWidget {
  const HomeScreenPoster({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: homePagePosterMap['image']),
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
                  homePagePosterMap['title'],
                  style: textTheme.bodyLarge,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
