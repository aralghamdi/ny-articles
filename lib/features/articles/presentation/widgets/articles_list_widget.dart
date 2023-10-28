import 'package:flutter/material.dart';
import 'package:ny_articles/features/articles/domain/entities/article.dart';
import 'package:ny_articles/features/articles/presentation/widgets/filter_wigets/articles_filter_bar_widget.dart';

import 'article_card_widget.dart';

class ArticlesListWidget extends StatelessWidget {
  final List<Article> articlesList;
  const ArticlesListWidget({Key? key, required this.articlesList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: ArticlesFilterBarWidget(),
        ),
        SliverList.separated(
            itemCount: articlesList.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (itemBuilder, index) {
              return ArticleCardWidget(
                  key: ValueKey("${articlesList[index].id}"),
                  article: articlesList[index]);
            }),
      ],
    );
  }
}
