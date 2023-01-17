part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class BusinessNewsLoading extends NewsState {}

//class AppChangeModeState extends NewsState {}

class BusinessNewsLoaded extends NewsState {
  final List<Articles> articles;
  BusinessNewsLoaded({required this.articles});
}

class BusinessNewsFailure extends NewsState {
  final String error;
  BusinessNewsFailure({required this.error});
}

class ScienceNewsLoading extends NewsState {}

class ScienceNewsLoaded extends NewsState {
  final List<Articles> scince;
  ScienceNewsLoaded({required this.scince});
}

class ScienceNewsFailure extends NewsState {
  final String errorScince;
  ScienceNewsFailure({required this.errorScince});
}

class SportsNewsLoading extends NewsState {}

class SportsNewsLoaded extends NewsState {
  final List<Articles> sports;
  SportsNewsLoaded({required this.sports});
}

class SportsNewsFailure extends NewsState {
  final String errorSports;
  SportsNewsFailure({required this.errorSports});
}

class SearchNewsLoading extends NewsState {}

class SearchNewsLoaded extends NewsState {
  final List<Articles> search;
  SearchNewsLoaded({required this.search});
}

class SearchNewsFailure extends NewsState {
  final String errorSearch;
  SearchNewsFailure({required this.errorSearch});
}
