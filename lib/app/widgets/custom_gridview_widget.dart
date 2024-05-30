import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  final List<String> items;
  final Function(String) onTap;

  const CustomGridView({super.key, required this.items, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          String key = items[index];
          return InkWell(
            onTap: () => onTap(key),
            child: Card(
              elevation: 3,
              child: Center(
                child: Text(
                  key,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
