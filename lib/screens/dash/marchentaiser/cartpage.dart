import 'package:flutter/material.dart';
import 'package:merchandiser_app/utils/colors.dart';
import 'package:merchandiser_app/utils/responsive.dart';
import 'package:merchandiser_app/widgets/buttons/back_button.dart';
import 'package:merchandiser_app/widgets/buttons/deleteIcon.dart';
import 'package:merchandiser_app/widgets/text/appbar_title.dart';

import '../../../utils/images.dart';
import '../../../widgets/text/satoshi.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  String name='Shampoo';
  int number= 246287;
  String image= shampoo;
  String pcsnddate='8 pcs  09/08/23';
  Screen ? size;

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return Scaffold(
      backgroundColor: lightWhite,
      appBar: AppBar(
        backgroundColor: lightWhite,
        leading: PopButton(color: black,),
        title: AppBarTitle(text: 'Cart', color: greyBlack,),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: ListView.builder(
          itemCount: 4,
            itemBuilder: (context,index){
              switch (index) {
                case 0:
                  return _withImageAndDoublePcs();
                case 1:
                  return _withImageAndOnePcs();
                case 2:
                  return _withDoublePcs();
                case 3:
                  return _withOnePcs();
                default:
                  return SizedBox.shrink();
              }
            }),
      ),
    );
  }
  Widget _withImageAndDoublePcs() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
          color: productTile,
          boxShadow: [
            BoxShadow(
              color: shadow,
              blurRadius: 1,
            )
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin:EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: Image.asset(image,width:size?.wp(35),height:size?.hp(15),fit: BoxFit.fill,)),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Satoshi500(text: name, color: itemText, percentage: 0.045, fontWeight: FontWeight.w500),
                  Satoshi500(text: '${number}', color: textGrey, percentage: 0.035, fontWeight: FontWeight.w500),
                  Satoshi500(text: pcsnddate, color: itemText, percentage: 0.035, fontWeight: FontWeight.w500),
                  Satoshi500(text: pcsnddate, color: itemText, percentage: 0.035, fontWeight: FontWeight.w500),
                ],
              ),
            ],
          ),
          DeleteIcon()
        ],
      ),
    );
  }

  Widget _withDoublePcs() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.only(right: 20,top: 5,bottom: 5,left: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: productTile,
          boxShadow: [
            BoxShadow(
              color: shadow,
              blurRadius: 1,
            )
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Satoshi500(text: name, color: itemText, percentage: 0.045, fontWeight: FontWeight.w500),
              Satoshi500(text: '${number}', color: textGrey, percentage: 0.035, fontWeight: FontWeight.w500),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Satoshi500(text: pcsnddate, color: itemText, percentage: 0.035, fontWeight: FontWeight.w500),
              Satoshi500(text: pcsnddate, color: itemText, percentage: 0.035, fontWeight: FontWeight.w500),
            ],
          ),
          DeleteIcon()
        ],
      ),
    );
  }

  Widget _withImageAndOnePcs() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: productTile,
          boxShadow: [
            BoxShadow(
              color: shadow,
              blurRadius: 1,
            )
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  margin:EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: Image.asset(image,width:size?.wp(35),height:size?.hp(12),fit: BoxFit.fill,)),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Satoshi500(text: name, color: itemText, percentage: 0.045, fontWeight: FontWeight.w500),
                  Satoshi500(text: '${number}', color: textGrey, percentage: 0.035, fontWeight: FontWeight.w500),
                  Satoshi500(text: '8 pcs', color: itemText, percentage: 0.035, fontWeight: FontWeight.w500),
                ],
              ),
            ],
          ),
          DeleteIcon()
        ],
      ),
    );
  }

  Widget _withOnePcs() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.only(right: 20,top: 5,bottom: 5,left: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: productTile,
          boxShadow: [
            BoxShadow(
              color: shadow,
              blurRadius: 1,
            )
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Satoshi500(text: name, color: itemText, percentage: 0.045, fontWeight: FontWeight.w500),
              Satoshi500(text: '${number}', color: textGrey, percentage: 0.035, fontWeight: FontWeight.w500),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Satoshi500(text: '8 pcs', color: itemText, percentage: 0.035, fontWeight: FontWeight.w500),
            ],
          ),
          DeleteIcon()
        ],
      ),
    );
  }
}
