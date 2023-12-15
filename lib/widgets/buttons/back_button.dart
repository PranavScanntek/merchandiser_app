import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:merchandiser_app/utils/colors.dart';
import 'package:merchandiser_app/utils/responsive.dart';
import '../../utils/images.dart';

class PopButton extends StatelessWidget {
  late Color color;
  PopButton({required this.color});
  Screen ? size;

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return IconButton(
      onPressed: (){
        Navigator.pop(context);
      },
      icon: Container(
        child: SvgPicture.asset(back,
          height: size?.hp(2),
          width: size?.wp(4),
          color: color
        ),
      ),
    );
  }
}
