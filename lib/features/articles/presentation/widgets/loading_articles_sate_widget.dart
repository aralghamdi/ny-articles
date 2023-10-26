import 'package:flutter/material.dart';

class LoadingArticlesStateWidget extends StatelessWidget {
  const LoadingArticlesStateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RepaintBoundary(child: CircularProgressIndicator()),
          SizedBox(height: 30),
          Text(
            "Getting you new articles! wait a moment...",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
