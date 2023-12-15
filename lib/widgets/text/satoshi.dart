import 'package:flutter/material.dart';

class Satoshi500 extends StatelessWidget {
  late String text;
  late Color color;
  late double percentage;
  late FontWeight fontWeight;
  Satoshi500({required this.text,required this.color,required this.percentage,required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          fontFamily: 'Satoshi',
          fontWeight: fontWeight,
          fontSize: MediaQuery.of(context).size.width * percentage,
          color: color
      ),
    );
  }
}
class Satoshi700 extends StatelessWidget {
  late String text;
  late Color color;
  late double percentage;
  Satoshi700({required this.text,required this.color,required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
          fontSize: MediaQuery.of(context).size.width * percentage,
          color:color
      ),
    );
  }
}
class Satoshi400 extends StatelessWidget {
  late String text;
  late Color color;
  late double percentage;
  Satoshi400({required this.text,required this.color,required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w400,
          fontSize: MediaQuery.of(context).size.width * percentage,
          color:color
      ),
    );
  }
}