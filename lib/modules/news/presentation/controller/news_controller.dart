import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news_app/modules/news/data/news_repository.dart';
import 'package:news_app/network/network_client.dart';
import '../../domain/news_model.dart';

class NewsController extends GetxController with StateMixin {
  NewsModel newsModel = NewsModel();

  NewsRepository newsRepository = NewsRepository(NetworkClient());

  getNewsApi() async {
    DateTime currentDate = DateTime.now();
    DateTime previousMonth = currentDate.subtract(const Duration(days: 30));
    String formattedDate = DateFormat('yyyy-MM-dd').format(previousMonth);

    change(null, status: RxStatus.loading());
    await newsRepository
        .newsGetRepository(formattedDate)
        .then((NewsModel value) {
      newsModel = value;
    });
    change(null, status: RxStatus.success());
  }
}
