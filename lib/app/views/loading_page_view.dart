import 'package:flutter/material.dart';

class LoadingPageView extends StatelessWidget {
  const LoadingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctxTh = Theme.of(context);
    return Scaffold(
      backgroundColor: ctxTh.primaryColor,
      body: Center(
        child: Column(
          children: [
            CircularProgressIndicator(
              backgroundColor: ctxTh.primaryTextTheme.headlineSmall?.color,
              valueColor: AlwaysStoppedAnimation<Color>(
                ctxTh.primaryColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Loading...',
              style: TextStyle(
                color: ctxTh.primaryTextTheme.titleLarge?.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
