import 'package:flutter/material.dart';
import 'package:merchandiser_app/utils/colors.dart';
import 'package:merchandiser_app/widgets/text/satoshi.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pop(context);
      },
        child: Satoshi500(text: 'Cancel', color: butonTextblue, percentage: 0.035, fontWeight: FontWeight.w500));
  }
}
