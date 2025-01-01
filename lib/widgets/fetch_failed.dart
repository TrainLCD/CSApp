import 'package:flutter/material.dart';

class FetchFailedWidget extends StatelessWidget {
  const FetchFailedWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            size: 128,
            color: Colors.black12,
          ),
          Container(
              margin: const EdgeInsets.only(top: 8),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45),
              ))
        ],
      ),
    );
  }
}
