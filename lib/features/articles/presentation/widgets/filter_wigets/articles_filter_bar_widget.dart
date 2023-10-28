import 'package:flutter/material.dart';
import 'package:ny_articles/features/articles/presentation/widgets/filter_wigets/period_filter_widget.dart';
import 'package:ny_articles/features/articles/presentation/widgets/filter_wigets/section_filter_widget.dart';

class ArticlesFilterBarWidget extends StatelessWidget {
  const ArticlesFilterBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        PeriodFilterWidget(),
        SectionFilterWidget()
      ],
    );
  }
}
