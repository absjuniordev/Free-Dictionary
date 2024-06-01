import 'package:flutter/material.dart';
import 'package:free_dicionary/app/widgets/custom_lottie_widget.dart';

class LoadingPageView extends StatelessWidget {
  const LoadingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctxTh = Theme.of(context);
    return Scaffold(
      backgroundColor: ctxTh.primaryColor,
      body: const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomLottieWidget(
              urlLottie:
                  'https://lottie.host/fb606eb5-d4d7-4c44-a603-95cc13afd2a6/lcCE4tP0zx.json'),
          Text(
            "Loading...",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          )
        ],
      )),
    );
  }
}
