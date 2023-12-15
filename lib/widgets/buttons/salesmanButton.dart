import 'package:flutter/material.dart';
import 'package:merchandiser_app/utils/responsive.dart';
import '../../utils/colors.dart';
import '../text/satoshi.dart';

class SalesManButton extends StatelessWidget {

  late Function() onTap;
  late double width;
  late double height;
  late Widget child;
  SalesManButton({required this.onTap,required this.width,required this.height,required this.child});

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
              border: Border.all(color: salesManTile,width: 1.5)
          ),
          child: child
      ),
    );
  }
}