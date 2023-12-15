import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class TextContainer extends StatelessWidget {
  late Widget widget;
  late double height;
  double? width;
  TextContainer({required this.widget,required this.height,this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      width: width,
      height: height,
      padding: EdgeInsets.only(left: 12,right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: white,
          border: Border.all(color: borderColor)
      ),
      child: widget,
    );
  }
}
