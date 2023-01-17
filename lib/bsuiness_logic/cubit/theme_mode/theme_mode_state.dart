// ignore_for_file: must_be_immutable

part of 'theme_mode_cubit.dart';

@immutable
abstract class ThemeModeState {}

class ThemeModeInitial extends ThemeModeState {}

class AppChangeModeState extends ThemeModeState {}
