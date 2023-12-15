import 'package:flutter/material.dart';
import 'package:merchandiser_app/utils/colors.dart';
import 'package:merchandiser_app/widgets/text/satoshi.dart';

class HeaderText extends StatelessWidget {
  late String text;
  HeaderText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Satoshi500(text: text, color: textBlack, percentage: 0.0375, fontWeight: FontWeight.w500),
    );
  }
}
