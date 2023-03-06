import 'package:travel_app2/component/api_constant.dart';

class TopPodcastModel {
  late String id;
  late String title;
  late String poster;
  late String catName;
  late String author;

  late String view;
  late String status;
  late String createdAt;
  TopPodcastModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.catName,
    required this.author,
    required this.view,
    required this.status,
    required this.createdAt,
  });
  TopPodcastModel.fromJson(Map<String, dynamic> element) {
    id = element['id'];
    title = element['title'];
    poster = ApiConstant.hostUrl + element['poster'];

    catName = element['cat_name'];
    author = element['author'];
    view = element['view'];
    status = element['status'];
    createdAt = element['created_at'];
  }
}
