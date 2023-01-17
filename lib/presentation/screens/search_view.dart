import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bsuiness_logic/cubit/news_cubit/news_cubit.dart';

import '../Widgets/widgets.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});
  final TextEditingController searchController = TextEditingController();
  String isChanged = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(top: 15, right: 150),
            child: Text("Search",
                style: TextStyle(color: Colors.black, fontSize: 22)),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: searchController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              textAlign: TextAlign.start,
              decoration: const InputDecoration(
                hintText: "Search",
                prefix: Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Icon(
                    Icons.search_outlined,
                    size: 20,
                  ),
                ),
              ),
              onChanged: (value) {
                if (value.isNotEmpty && value != isChanged) {
                  isChanged = value;
                  BlocProvider.of<NewsCubit>(context).getSearchedNews(value);
                }
              },
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'search must not be empty';
                } else {
                  return null;
                }
              },
            ),
          ),
          BlocBuilder<NewsCubit, NewsState>(
            builder: (context, state) {
              if (state is SearchNewsLoaded) {
                return Flexible(
                  child: buildNewsItem(state.search),
                );
              } else if (state is SearchNewsLoading) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.deepOrange,
                    ),
                  ),
                );
              } else if (state is SearchNewsFailure) {
                return Expanded(
                  child: Center(
                    child: Text(state.errorSearch),
                  ),
                );
              } else {
                return const Expanded(
                    child: Center(
                  child: Text("No Result"),
                ));
              }
            },
          ),
        ],
      ),
    );
  }
}
