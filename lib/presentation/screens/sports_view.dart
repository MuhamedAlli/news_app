import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bsuiness_logic/cubit/news_cubit/news_cubit.dart';
import '../Widgets/widgets.dart';

class SportsView extends StatefulWidget {
  const SportsView({super.key});

  @override
  State<SportsView> createState() => _SportsViewState();
}

class _SportsViewState extends State<SportsView> {
  @override
  void initState() {
    BlocProvider.of<NewsCubit>(context).getSportsNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: ((context, state) {}),
      builder: (context, state) {
        if (state is SportsNewsLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.deepOrange,
            ),
          );
        } else if (state is SportsNewsFailure) {
          return Center(
            child: Text(state.errorSports),
          );
        } else if (state is SportsNewsLoaded) {
          return buildNewsItem(state.sports);
        } else {
          return Container();
        }
      },
    );
  }
}
