import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bsuiness_logic/cubit/news_cubit/news_cubit.dart';
import '../Widgets/widgets.dart';

class ScienceView extends StatefulWidget {
  const ScienceView({super.key});

  @override
  State<ScienceView> createState() => _ScienceViewState();
}

class _ScienceViewState extends State<ScienceView> {
  @override
  void initState() {
    BlocProvider.of<NewsCubit>(context).getScienceNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: ((context, state) {}),
      builder: (context, state) {
        if (state is ScienceNewsLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.deepOrange,
            ),
          );
        } else if (state is ScienceNewsFailure) {
          return Center(
            child: Text(state.errorScince),
          );
        } else if (state is ScienceNewsLoaded) {
          return buildNewsItem(state.scince);
        } else {
          return Container();
        }
      },
    );
  }
}
