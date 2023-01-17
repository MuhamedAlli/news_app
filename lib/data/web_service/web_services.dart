import 'package:dio/dio.dart';

class NewsWebServices {
  late Dio dio;
  NewsWebServices() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: "https://newsapi.org/",
      receiveDataWhenStatusError: true,
    );
    dio = Dio(baseOptions);
  }

  Future<List<dynamic>> getBusinessNews() async {
    Map<String, dynamic> query = {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'c8910a8634c2415fb9f77c273ece5866'
    };
    try {
      final response =
          await dio.get("v2/top-headlines", queryParameters: query);
      //print(response.data['articles']);
      return response.data['articles'];
    } catch (error) {
      //print(error.toString());
      return [];
    }
  }

  Future<List<dynamic>> getSportsNews() async {
    Map<String, dynamic> query = {
      'country': 'eg',
      'category': 'sports',
      'apiKey': 'c8910a8634c2415fb9f77c273ece5866'
    };
    try {
      Response response =
          await dio.get("v2/top-headlines", queryParameters: query);
      //print(response.data['articles']);

      return response.data['articles'];
    } catch (error) {
      //print(error.toString());
      return [];
    }
  }

  Future<List<dynamic>> getScienceNews() async {
    Map<String, dynamic> query = {
      'country': 'eg',
      'category': 'science',
      'apiKey': 'c8910a8634c2415fb9f77c273ece5866'
    };
    try {
      Response response =
          await dio.get("v2/top-headlines", queryParameters: query);
      //print(response.data['articles']);

      return response.data['articles'];
    } catch (error) {
      //print(error.toString());
      return [];
    }
  }

  Future<List<dynamic>> getSearchedNews(String value) async {
    Map<String, dynamic> query = {
      'q': value,
      'apiKey': 'c8910a8634c2415fb9f77c273ece5866'
    };
    try {
      Response response =
          await dio.get("v2/everything", queryParameters: query);
      //print(response.data['articles']);

      return response.data['articles'];
    } catch (error) {
      //print(error.toString());
      return [];
    }
  }
}
