
import 'package:flutter/material.dart';


@immutable
class DxImage extends StatelessWidget {

  const DxImage({
    super.key,
    required this.url,
    this.fit = BoxFit.cover,
  });
  final String url;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {

    return
      url.contains('http') ?

      Image.network(
      url,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) {
        return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.error_outline), Text('Invalid image format!')],
        );
      },
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        return child;
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ): Image.asset(  url,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.error_outline), Text('Invalid image format!')],
          );
        },
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          return child;
        },
       );



  }
}
