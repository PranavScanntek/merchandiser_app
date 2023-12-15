import 'package:flutter/material.dart';
import 'package:merchandiser_app/utils/colors.dart';
import 'package:merchandiser_app/widgets/text/satoshi.dart';

class ReportTableText extends StatelessWidget {
  late String text;
  late Color color;
  ReportTableText({required this.text,required this.color});

  @override
  Widget build(BuildContext context) {
    return Satoshi400(text: text, color: color, percentage: 0.035);
  }
}
