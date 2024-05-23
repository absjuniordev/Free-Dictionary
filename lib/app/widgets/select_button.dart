import 'package:flutter/material.dart';

class SelectButton extends StatelessWidget {
  const SelectButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Card(
              elevation: 3,
              child: TextButton(
                  onPressed: () {},
                  child: const Text("Words list",
                      style: TextStyle(fontSize: 15, color: Colors.black))),
            ),
          ),
          Expanded(
            child: Card(
              elevation: 3,
              child: TextButton(
                  onPressed: () {},
                  child: const Text("History",
                      style: TextStyle(fontSize: 15, color: Colors.black))),
            ),
          ),
          Expanded(
            child: Card(
              elevation: 3,
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
