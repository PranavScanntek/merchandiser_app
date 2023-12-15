import 'package:flutter/material.dart';
import 'package:merchandiser_app/utils/responsive.dart';

import '../../utils/colors.dart';

class PrimaryButton extends StatelessWidget {
  late Widget child;
  late double width;
  late Function() onTap;
  late double padding;
  PrimaryButton({required this.child,required this.width,required this.onTap,required this.padding});

  Screen ? size;

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(right: padding),
        alignment: Alignment.center,
        height: size?.hp(7),
        width: width,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [blue,darkBlue]),
            borderRadius: BorderRadius.circular(8)
        ),
        child: child,
      ),
    );
  }
}