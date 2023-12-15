import 'package:flutter/material.dart';
import 'package:merchandiser_app/utils/colors.dart';

class AppBarTitle extends StatelessWidget {
  late String text;
  late Color color;
  AppBarTitle({required this.text,required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
        color: color,
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w500,
        fontSize: MediaQuery.of(context).size.width * 0.035,
      ),
    );
  }
}
