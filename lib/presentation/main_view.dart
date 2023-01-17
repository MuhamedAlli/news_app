import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bsuiness_logic/cubit/theme_mode/theme_mode_cubit.dart';
import 'package:news_app/presentation/screens/business_view.dart';
import 'package:news_app/presentation/screens/science_view.dart';
import 'package:news_app/presentation/screens/search_view.dart';
import 'package:news_app/presentation/screens/sports_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> pages = [
    const BusinessView(),
    const SportsView(),
    const ScienceView(),
  ];
  List<String> titles = ["Business", "Sports", "Science", "Settings"];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "News App",
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => SearchView()),
                  ),
                );
              },
              iconSize: 30,
              icon: const Icon(Icons.search_outlined),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: GestureDetector(
              onTap: () {
                BlocProvider.of<ThemeModeCubit>(context).changeThemeMode();
              },
              child: const Icon(
                size: 30,
                Icons.brightness_4_outlined,
              ),
            ),
          ),
        ],
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: ((newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.business_outlined),
            label: "Business",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_bar_outlined),
            label: "Sports",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.science_outlined),
            label: "Science",
          ),
        ],
      ),
    );
  }
}
