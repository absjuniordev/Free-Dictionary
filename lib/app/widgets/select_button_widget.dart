import 'package:flutter/material.dart';

class SelectButtonWidget extends StatelessWidget {
  const SelectButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Card(
              elevation: 5,
              child: TextButton(
                  onPressed: () {},
                  child: const Text("Words list",
                      style: TextStyle(fontSize: 15, color: Colors.black))),
            ),
          ),
          Expanded(
            child: Card(
              elevation: 5,
              child: TextButton(
                  onPressed: () {},
                  child: const Text("History",
                      style: TextStyle(fontSize: 15, color: Colors.black))),
            ),
          ),
          Expanded(
            child: Card(
              elevation: 5,
              child: TextButton(
                  onPressed: () {},
                  child: const Text("Favorites",
                      style: TextStyle(fontSize: 15, color: Colors.black))),
            ),
          ),
        ],
      ),
    );
  }
}
