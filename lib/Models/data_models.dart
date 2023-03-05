import 'package:flutter/cupertino.dart';

class HashtagModel {
  String title;
  HashtagModel({required this.title});
}

class HotestModel {
  Image image;
  String name;
  String view;
  String content;

  HotestModel(
      {required this.image,
      required this.name,
      required this.view,
      required this.content});
}

class HotestPodcastsModels {
  Image image;
  String title;
  HotestPodcastsModels({
    required this.image,
    required this.title,
  });
}

class categoryItem {
  String title;
  categoryItem({required this.title});
}
