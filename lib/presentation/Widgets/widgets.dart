import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/presentation/screens/web_view.dart';

import '../../data/models/models.dart';

Widget buildNewsItem(List<Articles> articles) {
  return ListView.separated(
    separatorBuilder: (context, index) {
      return const Divider();
    },
    physics: const BouncingScrollPhysics(),
    itemCount: articles.length,
    itemBuilder: ((context, index) {
      return ListTile(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => WebViewScreen(articles[index].url ?? ""),
          ),
        ),
        leading: Container(
          width: 120,
          height: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage(
                  articles[index].urlToImage ??
                      "https://img.youm7.com/large/201702151148554855.jpg",
                ),
                fit: BoxFit.cover,
              )),
        ),
        title: Text(
          articles[index].title ?? "Title",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          articles[index].publishedAt ?? "00:00",
        ),
      );
    }),
  );
}

ThemeData lightThemeMode() {
  return ThemeData(
    primaryColor: Colors.black,
    primaryColorBrightness: Brightness.light,
    brightness: Brightness.light,
    primaryColorDark: Colors.black,
    canvasColor: Colors.white,
    //Input Decoration Theme
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.all(8),
      hintStyle: TextStyle(
        color: Colors.grey,
        fontSize: 20,
      ),
      labelStyle: TextStyle(color: Colors.grey, fontSize: 18),
      errorStyle: TextStyle(color: Colors.red),
      //Enabled Border
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1.5),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      //Focused Border
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.deepOrange, width: 1.5),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      //Error Border
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1.5),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      //Disabled Border
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1.5),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      //Focused Error Border//////////
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.deepOrange, width: 1.5),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
    ),
    primarySwatch: Colors.deepOrange,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.black45,
        statusBarBrightness: Brightness.light,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.grey,
    ),
  );
}

ThemeData darkThemeMode() {
  return ThemeData(
    primaryColor: Colors.black,
    primaryColorLight: Colors.black,
    brightness: Brightness.dark,
    primaryColorDark: Colors.black,
    indicatorColor: Colors.white,
    canvasColor: Colors.black,
    //
    dividerColor: Colors.white54,
    primarySwatch: Colors.deepOrange,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.black,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.grey,
    ),
  );
}
