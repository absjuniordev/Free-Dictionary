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
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: TextButton(
                  onPressed: () {},
                  child: const Text("Words list",
                      style: TextStyle(fontSize: 20, color: Colors.black))),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: TextButton(
                  onPressed: () {},
                  child: const Text("History",
                      style: TextStyle(fontSize: 20, color: Colors.black))),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: TextButton(
                  onPressed: () {},
                  child: const Text("Favorites",
                      style: TextStyle(fontSize: 20, color: Colors.black))),
            ),
          ),
        ],
      ),
    );
  }
}
