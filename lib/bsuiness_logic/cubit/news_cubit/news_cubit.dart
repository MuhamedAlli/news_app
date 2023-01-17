import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/models/models.dart';
import 'package:news_app/data/repository/repository.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this.newsRepository) : super(NewsInitial());

  final NewsRepository newsRepository;
  void getBusinessNews() async {
    emit(BusinessNewsLoading());
    List<Articles> articels = await newsRepository.getBusinessNews();
    if (articels.isNotEmpty) {
      emit(BusinessNewsLoaded(articles: articels));
    } else {
      emit(BusinessNewsFailure(error: "No Data"));
    }
  }

  void getSportsNews() async {
    emit(SportsNewsLoading());
    List<Articles> articels = await newsRepository.getSportsNews();
    if (articels.isNotEmpty) {
      emit(SportsNewsLoaded(sports: articels));
    } else {
      emit(SportsNewsFailure(errorSports: "No Data"));
    }
  }

  void getScienceNews() async {
    emit(ScienceNewsLoading());
    List<Articles> articels = await newsRepository.getScienceNews();
    if (articels.isNotEmpty) {
      emit(ScienceNewsLoaded(scince: articels));
    } else {
      emit(ScienceNewsFailure(errorScince: "No Data"));
    }
  }

  void getSearchedNews(String value) async {
    emit(SearchNewsLoading());
    List<Articles> articels = await newsRepository.getSearchedNews(value);
    if (articels.isNotEmpty) {
      emit(SearchNewsLoaded(search: articels));
    } else {
      emit(SearchNewsFailure(errorSearch: "No Data"));
    }
  }
}
