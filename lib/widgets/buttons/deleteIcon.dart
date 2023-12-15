import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:merchandiser_app/utils/colors.dart';
import 'package:merchandiser_app/utils/images.dart';
import 'package:merchandiser_app/utils/responsive.dart';

class DeleteIcon extends StatefulWidget {
  const DeleteIcon({super.key});

  @override
  State<DeleteIcon> createState() => _DeleteIconState();
}

class _DeleteIconState extends State<DeleteIcon> {
  Screen ? size;
  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return GestureDetector(
      onTap: (){},
      child: SvgPicture.asset(delete,color: darkGrey,height: size?.hp(3),),
    );
  }
}
