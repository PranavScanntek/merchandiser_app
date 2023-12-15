import 'package:flutter/material.dart';

class TableHeader extends StatelessWidget {
  late String text;
  TableHeader({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w600,
      ),
    );
  }
}