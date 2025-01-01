import 'package:flutter/material.dart';

class TicketStatusIcon extends StatelessWidget {
  const TicketStatusIcon({super.key, required this.resolved, this.small});

  final bool resolved;
  final bool? small;

  @override
  Widget build(BuildContext context) {
    if (small == true) {
      if (!resolved) {
        return Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 1.25),
                borderRadius: BorderRadius.circular(8)),
            child: const Icon(
              Icons.circle,
              color: Colors.green,
              size: 4,
            ));
      }

      return Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.purple, width: 1.25),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          Icons.check,
          color: Colors.purple,
          size: 9,
        ),
      );
    }

    if (!resolved) {
      return Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 2.5),
              borderRadius: BorderRadius.circular(16)),
          child: const Icon(
            Icons.circle,
            color: Colors.green,
            size: 8,
          ));
    }

    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.purple, width: 2.5),
          borderRadius: BorderRadius.circular(16)),
      child: const Icon(
        Icons.check,
        color: Colors.purple,
        size: 18,
      ),
    );
  }
}
