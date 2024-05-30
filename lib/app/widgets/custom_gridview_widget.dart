import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  final List<String> items;
  final Function(String) onTap;
  final Function(String) onFavoriteToggle;
  final List<String> favoriteItems;

  const CustomGridView({
    super.key,
    required this.items,
    required this.onTap,
    required this.onFavoriteToggle,
    required this.favoriteItems,
  });

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
          bool isFavorite = favoriteItems.contains(key);
          return InkWell(
            onTap: () => onTap(key),
            child: items.isEmpty
                ? const Center(
                    child: Text("Empty"),
                  )
                : Card(
                    elevation: 3,
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            key,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: GestureDetector(
                            onTap: () => onFavoriteToggle(key),
                            child: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isFavorite ? Colors.red : Colors.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
