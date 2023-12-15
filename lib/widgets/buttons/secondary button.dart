import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:merchandiser_app/utils/responsive.dart';
import '../../utils/colors.dart';
import '../text/satoshi.dart';

class SecondaryButton extends StatelessWidget {

  late Function() onTap;
  late double width;
  late double height;
  late Widget child;
  late Color? color;
  SecondaryButton({required this.onTap,required this.width,required this.height,required this.child,this.color});

  Screen ? size;

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return InkWell(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color:color,
              border: GradientBoxBorder(
                  gradient: LinearGradient(colors: [darkBlue,blue],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                width: 1.5
              )
          ),
          child: child
      ),
    );
  }
}