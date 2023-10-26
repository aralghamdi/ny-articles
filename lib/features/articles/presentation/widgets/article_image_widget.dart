import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArticleImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  const ArticleImageWidget({Key? key, required this.imageUrl, this.height, this.width}) : super(key: key);

  Widget placeholderImage(){
    return Image.asset(
      'assets/images/ny_place_holder.png',
      fit: BoxFit.cover,
      width: width,
      height: height,
    );
  }

  @override
  Widget build(BuildContext context) {
    return imageUrl.isNotEmpty ? CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      width: width,
      height: height,
      errorWidget: (context,url,err){
        return placeholderImage();
      },
    ): placeholderImage();
  }
}
