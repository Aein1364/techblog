import 'package:get/get.dart';
import 'package:travel_app2/Models/article_model.dart';
import 'package:travel_app2/Models/podcast_model.dart';
import 'package:travel_app2/Models/poster_model.dart';
import 'package:travel_app2/Models/tag_model.dart';
import 'package:travel_app2/component/api_constant.dart';
import 'package:travel_app2/services/dio_service.dart';

class HomeScreenController extends GetxController {
  Rx<PosterModel> poster = PosterModel().obs;
  RxList<TopVisitedModel> topVisitedList = RxList();
  RxList<TopPodcastModel> topPodcastList = RxList();
  RxList<TagsModel> tagsList = RxList();
  RxBool loading = false.obs;
  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    loading.value = true;

    var response = await DioService().getMethod(ApiConstant.getHomeItem);
    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topVisitedList.add(TopVisitedModel.fromJson(element));
      });
      response.data['top_podcasts'].forEach((element) {
        topPodcastList.add(TopPodcastModel.fromJson(element));
      });
      response.data['tags'].forEach((element) {
        tagsList.add(TagsModel.fromJson(element));
      });

      poster.value = PosterModel.fromJson(response.data['poster']);
      loading.value = false;
    }
  }
}
