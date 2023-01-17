import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bsuiness_logic/cubit/news_cubit/news_cubit.dart';
import 'package:news_app/bsuiness_logic/cubit/theme_mode/theme_mode_cubit.dart';
import 'package:news_app/data/repository/repository.dart';
import 'package:news_app/data/web_service/local_network.dart';
import 'package:news_app/data/web_service/web_services.dart';
import 'presentation/Widgets/widgets.dart';
import 'presentation/main_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit(
            NewsRepository(
              newsWebServices: NewsWebServices(),
            ),
          ),
        ),
        BlocProvider(
          create: ((context) {
            return ThemeModeCubit();
          }),
        ),
      ],
      child: BlocConsumer<ThemeModeCubit, ThemeModeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (BlocProvider.of<ThemeModeCubit>(context).isDark == "dark") {
            Theme.of(context).textTheme.apply(bodyColor: Colors.white);
          } else {
            Theme.of(context).textTheme.apply(bodyColor: Colors.black);
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightThemeMode(),
            darkTheme: darkThemeMode(),
            themeMode: BlocProvider.of<ThemeModeCubit>(context).isDark == "dark"
                ? ThemeMode.dark
                : ThemeMode.light,
            home: const MainView(),
          );
        },
      ),
    );
  }
}
