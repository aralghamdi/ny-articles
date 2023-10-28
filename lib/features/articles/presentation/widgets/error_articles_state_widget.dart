import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_articles/features/articles/presentation/bloc/articles_bloc.dart';

class ErrorArticlesStateWidget extends StatelessWidget {
  final String? errorMessage;
  const ErrorArticlesStateWidget({Key? key, this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 80,
            child: Image(image: AssetImage('assets/images/cloud.png')),
          ),
          const SizedBox(height: 30),
          Text(errorMessage != null ? "Error: $errorMessage" : "Something went wrong!",
            style: const TextStyle(fontWeight: FontWeight.bold),
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
