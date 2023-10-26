import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ny_articles/core/di.dart';
import 'package:ny_articles/features/articles/domain/use_cases/get_articles_list_use_case.dart';
import 'package:ny_articles/features/articles/presentation/bloc/articles_bloc.dart';
import 'package:ny_articles/features/articles/presentation/screens/articles_screen.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await initDI();

  runApp(BlocProvider(
      create: (context) => ArticlesBloc(di<GetArticlesListUseCase>()),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New York Articles',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff10312B)),
        useMaterial3: true,
      ),
      home: const ArticlesScreen(),
    );
  }
}
