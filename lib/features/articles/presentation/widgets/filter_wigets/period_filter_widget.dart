import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_articles/features/articles/presentation/bloc/articles_bloc.dart';

class PeriodFilterWidget extends StatelessWidget {
  const PeriodFilterWidget({Key? key}) : super(key: key);

  static final Map<String, String> periods = {
    '1': 'past day',
    '7': 'past 7 days',
    '30': 'past 30 days'
  };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesBloc, ArticlesState>(
      builder: (context, state) {
        state as ArticlesSuccess;
        return PopupMenuButton(
          icon: Icon(Icons.calendar_month_outlined,
            color: Theme.of(context).colorScheme.primary,
          ),
            shape: const RoundedRectangleBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(10.0))),
            position: PopupMenuPosition.under,
            itemBuilder: (context) {
              return periods.entries.map((period) {
                return PopupMenuItem(child: Row(
                  children: [
                    Text(period.value),
                    const SizedBox(width: 4),
                    if (period.key == state.period)
                      CircleAvatar(radius: 3, backgroundColor: Theme.of(context).colorScheme.primary)
                  ],
                ), onTap: () {
                    BlocProvider.of<ArticlesBloc>(context).add(GetArticlesEvent(period: period.key));
                  },
                );
              }).toList();
            });
      },
    );
  }
}


