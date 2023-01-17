import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_mode_state.dart';

class ThemeModeCubit extends Cubit<ThemeModeState> {
  ThemeModeCubit() : super(ThemeModeInitial());
  String isDark = "light";
  void changeThemeMode([String? fromShared]) async {
    if (isDark == "dark") {
      isDark = "light";
      emit(AppChangeModeState());
    } else {
      isDark = "dark";
      emit(AppChangeModeState());
    }
  }
}
