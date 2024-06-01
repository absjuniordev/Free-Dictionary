import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLottieWidget extends StatelessWidget {
  final String urlLottie;
  const CustomLottieWidget({super.key, required this.urlLottie});

  Future<String> _loadLottieUrl() async {
    return urlLottie;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _loadLottieUrl(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final lottieUrl = snapshot.data!;
          return Lottie.network(
            lottieUrl,
            width: 200,
            height: 200,
          );
        }
      },
    );
  }
}
