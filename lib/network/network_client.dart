import 'package:get/get.dart';
import 'package:news_app/utils/api_end_point.dart';

class NetworkClient extends GetConnect{
  String _getRequestUrl() => API.BASE_URL;


  Future getRequest({query})async{
    return await get(_getRequestUrl(),query: query,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json; charset=UTF-8",
          "Authorization":""
        }

    ).timeout(const Duration(seconds: 20));

  }
  
}

