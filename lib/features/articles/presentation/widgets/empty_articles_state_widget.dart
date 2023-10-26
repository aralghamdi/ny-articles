import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_articles/features/articles/presentation/bloc/articles_bloc.dart';

class EmptyArticlesState extends StatelessWidget {
  const EmptyArticlesState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 80,
            child: Image(image: AssetImage('assets/images/inbox.png')),
          ),
          const SizedBox(height: 30),
          const Text(
            "No Articles found! Check Again later",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ElevatedButton(onPressed: () {
            BlocProvider.of<ArticlesBloc>(context).add(const GetArticlesEvent());
          }, child: const Text('Refresh'))
        ],
      ),
    );
  }
}
