import 'package:flutter/material.dart';
import 'package:merchandiser_app/utils/responsive.dart';
import 'package:merchandiser_app/widgets/text/satoshi.dart';

class StatusBox extends StatelessWidget {
  late Color color;
  late String text;
  StatusBox({required this.color,required this.text});
  Screen ? size;
  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color)
      ),
      child: Satoshi500(text: text, color:color, percentage: 0.025, fontWeight: FontWeight.w500),
    );
  }
}
