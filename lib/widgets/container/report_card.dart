import 'package:flutter/material.dart';
import 'package:merchandiser_app/utils/responsive.dart';
import 'package:merchandiser_app/widgets/text/satoshi.dart';
import '../../utils/colors.dart';

class ReportCard extends StatelessWidget {

  late String text;
  late String count;
  ReportCard({required this.text,required this.count});

  Screen ? size;

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: size?.hp(10),
      width: size?.wp(43),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: white,
          boxShadow: [
            BoxShadow(
                spreadRadius: .25,
                color: shadow
            )
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Satoshi400(text: text, color: reportBlue, percentage: 0.035),
          Satoshi500(text: count, color: reportBlue, percentage: 0.065, fontWeight: FontWeight.w500)
        ],
      ),
    );
  }
}
