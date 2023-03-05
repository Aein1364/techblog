import 'package:flutter/material.dart';

import 'package:travel_app2/gen/assets.gen.dart';

import 'data_models.dart';

Map homePagePosterMap = {
  'image': Assets.img.programming.image(fit: BoxFit.cover),
  'writer': 'ملیکا عزیزی',
  'date': 'یک روز پیش',
  'view': '253',
  'title': 'دوازده قدم برنامه نویسی یک دوره ی...'
};

List<HashtagModel> tagList = [
  HashtagModel(title: 'جاوا'),
  HashtagModel(title: 'کاتلین'),
  HashtagModel(title: 'وب'),
  HashtagModel(title: 'هوش مصنوعی'),
  HashtagModel(title: 'iot'),
  HashtagModel(title: 'دارت'),
];

List<HotestModel> hotestList = [
  HotestModel(
      image: Assets.img.tag1.image(fit: BoxFit.cover),
      name: 'ملیکا عزیزی',
      view: '235',
      content: 'سالیدیتی چیست؛ معرفی زبان معروف برنامه‌نویسی ...'),
  HotestModel(
      image: Assets.img.tag2.image(fit: BoxFit.cover),
      name: 'سعید صادقی',
      view: '235',
      content: 'سالیدیتی چیست؛ معرفی زبان معروف برنامه‌نویسی ...'),
  HotestModel(
      image: Assets.img.tag1.image(fit: BoxFit.cover),
      name: 'ملیکا عزیزی',
      view: '235',
      content: 'سالیدیتی چیست؛ معرفی زبان معروف برنامه‌نویسی ...'),
  HotestModel(
      image: Assets.img.tag2.image(fit: BoxFit.cover),
      name: 'سعید صادقی',
      view: '235',
      content: 'سالیدیتی چیست؛ معرفی زبان معروف برنامه‌نویسی ...'),
];

List<HotestPodcastsModels> hotestPodcatList = [
  HotestPodcastsModels(
      image: Assets.img.podcast1.image(fit: BoxFit.cover), title: 'رمزون'),
  HotestPodcastsModels(
      image: Assets.img.podcast2.image(fit: BoxFit.cover),
      title: 'رادیو کدیاد'),
  HotestPodcastsModels(
      image: Assets.img.podcast3.image(fit: BoxFit.cover), title: 'تکنوکست'),
  HotestPodcastsModels(
      image: Assets.img.podcast4.image(fit: BoxFit.cover), title: 'پادیکست')
];

List<categoryItem> categoryList = [
  categoryItem(title: 'جاوا'),
  categoryItem(title: 'کاتلین'),
  categoryItem(title: 'وب'),
  categoryItem(title: 'هوش مصنوعی'),
  categoryItem(title: 'iot'),
  categoryItem(title: 'دارت'),
  categoryItem(title: 'جاوا'),
  categoryItem(title: 'کاتلین'),
  categoryItem(title: 'وب'),
  categoryItem(title: 'هوش مصنوعی'),
  categoryItem(title: 'iot'),
  categoryItem(title: 'دارت'),
  categoryItem(title: 'جاوا'),
  categoryItem(title: 'کاتلین'),
  categoryItem(title: 'وب'),
  categoryItem(title: 'هوش مصنوعی'),
  categoryItem(title: 'iot'),
  categoryItem(title: 'دارت'),
  categoryItem(title: 'جاوا'),
  categoryItem(title: 'کاتلین'),
  categoryItem(title: 'وب'),
  categoryItem(title: 'هوش مصنوعی'),
  categoryItem(title: 'iot'),
  categoryItem(title: 'دارت'),
];
List<HashtagModel> tagChoose = [];
