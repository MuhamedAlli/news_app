import 'package:news_app/data/models/models.dart';
import 'package:news_app/data/web_service/web_services.dart';

class NewsRepository {
  final NewsWebServices newsWebServices;
  NewsRepository({required this.newsWebServices});
  Future<List<Articles>> getBusinessNews() async {
    try {
      final businessNews = await newsWebServices.getBusinessNews();
      return businessNews.map((article) => Articles.fromJson(article)).toList();
    } catch (error) {
      //print("error form Repo : ${error.toString()}");
      return [];
    }
  }

  Future<List<Articles>> getSportsNews() async {
    try {
      final sportsNews = await newsWebServices.getSportsNews();
      return sportsNews.map((article) => Articles.fromJson(article)).toList();
    } catch (error) {
      //print("error form Repo : ${error.toString()}");
      return [];
    }
  }

  Future<List<Articles>> getScienceNews() async {
    try {
      final scienceNews = await newsWebServices.getScienceNews();
      return scienceNews.map((article) => Articles.fromJson(article)).toList();
    } catch (error) {
      ///print("error form Repo : ${error.toString()}");
      return [];
    }
  }

  Future<List<Articles>> getSearchedNews(String value) async {
    try {
      final scienceNews = await newsWebServices.getSearchedNews(value);
      return scienceNews.map((article) => Articles.fromJson(article)).toList();
    } catch (error) {
      ///print("error form Repo : ${error.toString()}");
      return [];
    }
  }
}
