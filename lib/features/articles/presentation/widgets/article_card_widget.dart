import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ny_articles/features/articles/domain/entities/article.dart';
import 'package:ny_articles/features/articles/presentation/widgets/article_image_widget.dart';

class ArticleCardWidget extends StatelessWidget {
  final Article article;
  const ArticleCardWidget({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 3.8,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            ArticleImageWidget(
              imageUrl: article.image,
              width: double.infinity,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  child: Text(article.section, style: const TextStyle(fontSize: 12, color: Colors.white),),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 8, right: 8, top: 15, bottom: 8),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      tileMode: TileMode.mirror,
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black54,
                        Colors.black54,
                        Colors.black45,
                        Colors.black38,
                        Colors.transparent
                      ]),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(article.title,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.white,
                          size: 14,
                        ),
                        Text(
                            DateFormat('dd-MM-yyy')
                                .format(article.publishedDate)
                                .toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
