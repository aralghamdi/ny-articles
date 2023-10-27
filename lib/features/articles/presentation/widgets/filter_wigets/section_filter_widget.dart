import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_articles/features/articles/presentation/bloc/articles_bloc.dart';

class SectionFilterWidget extends StatelessWidget {
  const SectionFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesBloc, ArticlesState>(
      builder: (context, state) {
        state as ArticlesSuccess;
        return PopupMenuButton(
            icon: Icon(Icons.filter_list,
              color: Theme.of(context).colorScheme.primary,
            ),
            shape: const RoundedRectangleBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(10.0))),
            position: PopupMenuPosition.under,
            itemBuilder: (context) {
              return state.articlesSections.map((section) {
                return PopupMenuItem(child: Row(
                  children: [
                    Text(section),
                    const SizedBox(width: 4),
                    if (section == state.selectedSection)
                      CircleAvatar(radius: 3, backgroundColor: Theme.of(context).colorScheme.primary)
                  ],
                ), onTap: () {
                  BlocProvider.of<ArticlesBloc>(context).add(FilterArticlesEvent(section));
                },
                );
              }).toList();
            });
      },
    );
  }
}
