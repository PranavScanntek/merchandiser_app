import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:merchandiser_app/utils/colors.dart';
import 'package:merchandiser_app/utils/responsive.dart';
import 'package:merchandiser_app/widgets/text/satoshi.dart';

class DecisionCard extends StatelessWidget {
  late String text;
  late String image;
  late Function() onTap;
  DecisionCard({required this.text,required this.image,required this.onTap});

  Screen ? size;

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        width: size?.wp(28),
        height: size?.hp(6),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: blue),
          borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(image),
            SizedBox(width: size?.wp(1),),
            Satoshi500(text: text, color: blue, percentage: 0.035, fontWeight: FontWeight.w500)
          ],
        ),
      ),
    );
  }
}
