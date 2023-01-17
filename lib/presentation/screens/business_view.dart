import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bsuiness_logic/cubit/news_cubit/news_cubit.dart';

import '../Widgets/widgets.dart';

class BusinessView extends StatefulWidget {
  const BusinessView({super.key});

  @override
  State<BusinessView> createState() => _BusinessViewState();
}

class _BusinessViewState extends State<BusinessView> {
  @override
  void initState() {
    BlocProvider.of<NewsCubit>(context).getBusinessNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: ((context, state) {}),
      builder: (context, state) {
        if (state is BusinessNewsLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.deepOrange,
            ),
          );
        } else if (state is BusinessNewsFailure) {
          return Center(
            child: Text(state.error),
          );
        } else if (state is BusinessNewsLoaded) {
          return buildNewsItem(state.articles);
        } else {
          return Container();
        }
      },
    );
  }
}
