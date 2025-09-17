

import 'package:flutter/material.dart';

class AvailableSize extends StatelessWidget {
  final String size;
  final bool isSelected;
  final bool isDisabled;

  const AvailableSize({
    super.key,
    required this.size,
    required this.isSelected,
    required this.isDisabled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16.0, bottom: 8.0),
      width: 40,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isDisabled
            ? Colors.grey.shade400
            : (isSelected ? Colors.deepPurple : Colors.transparent),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.deepPurple),
      ),
      child: Text(
        size,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isDisabled ? Colors.white70 : Colors.black,
        ),
      ),
    );
  }
}
