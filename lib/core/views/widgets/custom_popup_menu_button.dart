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
          onTap: () {
            showDialog(
                context: context,
                builder: (ctx) {
                  return AlertDialog(
                    title: const Text(
                      'Clear Data',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    content: const Text(
                      'Are you sure?',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                          onTap();
                        },
                        child: const Text(
                          'OK',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  );
                });
          },
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
