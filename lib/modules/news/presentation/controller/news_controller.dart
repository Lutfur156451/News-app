import 'package:get/get.dart';
import 'package:news_app/modules/news/data/news_repository.dart';
import 'package:news_app/network/network_client.dart';

import '../../domain/news_model.dart';

class NewsController extends GetxController with StateMixin{
  NewsModel newsModel=NewsModel();


  NewsRepository newsRepository=NewsRepository(NetworkClient());

  getNewsApi()async{

    change(null, status: RxStatus.loading());
    await newsRepository.newsGetRepository().then((value){
      newsModel=value;
    });
    change(null, status: RxStatus.success());

  }
  // etBankInfo() async {
  //   change(null, status: RxStatus.loading());
  //   await moreDataRepository.bankInfoRepo().then((value) {
  //     bankInfoModel = value;
  //     print(bankInfoModel.data?.accountTitle);
  //     print("Bank info called ::: $value");
  //     _bankInfo(value);
  //   }, onError: (error) {
  //     print("Bank info called:::$error");
  //     errorAlertPopup(getBankInfo);
  //   });
  //   change(null, status: RxStatus.success());
  // }


}
