import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingPageView extends StatelessWidget {
  const LoadingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctxTh = Theme.of(context);
    return Scaffold(
      backgroundColor: ctxTh.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lottie/loading.json',
              width: 200,
              height: 200,
            ),
            const Text(
              "Loading...",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
