import 'package:flutter/material.dart';

class CustomPopupMenuButton extends StatelessWidget {
  final Future<void> Function() onTap;
  const CustomPopupMenuButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(itemBuilder: (ctx) {
      return [
        PopupMenuItem(
          value: 0,
          onTap: onTap,
          child: const Text(
            'Clear Data',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ];
    });
  }
}
