import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_articles/features/articles/presentation/bloc/articles_bloc.dart';
import 'package:ny_articles/features/articles/presentation/widgets/articles_list_widget.dart';
import 'package:ny_articles/features/articles/presentation/widgets/empty_articles_state_widget.dart';
import 'package:ny_articles/features/articles/presentation/widgets/error_articles_state_widget.dart';
import 'package:ny_articles/features/articles/presentation/widgets/loading_articles_sate_widget.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  void initState() {
    BlocProvider.of<ArticlesBloc>(context)
        .add(const GetArticlesEvent(period: "1"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
              child: Text("New York Times Articles",
                  style: TextStyle(fontWeight: FontWeight.bold)))),
      body: BlocBuilder<ArticlesBloc, ArticlesState>(
        builder: (context, state) {
          if (state is ArticlesSuccess) {
            return state.articlesList.isNotEmpty
                ? ArticlesListWidget(articlesList: state.articlesList)
                : const EmptyArticlesState();
          } else if (state is ArticlesError) {
            return ErrorArticlesStateWidget(errorMessage: state.errorMessage);
          }

          return const LoadingArticlesStateWidget();
        },
      ),
    );
  }
}
