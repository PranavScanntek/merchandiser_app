import 'package:flutter/material.dart';
import 'package:merchandiser_app/utils/responsive.dart';
import 'package:merchandiser_app/widgets/text/satoshi.dart';
import '../../utils/colors.dart';

class ReportCard2 extends StatelessWidget {

  late String text;
  late String count;
  late Color color;
  late Color textColor;
  ReportCard2({required this.text,required this.count,required this.color,required this.textColor});

  Screen ? size;

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: size?.hp(20),
      width: size?.wp(27),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color,
          boxShadow: [
            BoxShadow(
                spreadRadius: .25,
                color: shadow
            )
          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Satoshi400(text: text, color: textColor, percentage: 0.040),
          Satoshi500(text: count, color: textColor, percentage: 0.065, fontWeight: FontWeight.w500)
        ],
      ),
    );
  }
}
