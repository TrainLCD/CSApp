import 'package:flutter/material.dart';

class AllDoneWidget extends StatelessWidget {
  const AllDoneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.local_activity,
            size: 128,
            color: Colors.black12,
          ),
          Text("やりました！未解決チケットは0件です！",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45))
        ],
      ),
    );
  }
}
