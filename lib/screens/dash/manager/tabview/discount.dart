import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../../utils/responsive.dart';
import '../../../../widgets/buttons/salesmanButton.dart';
import '../../../../widgets/text/satoshi.dart';
import '../banding_details.dart';

class Discount extends StatefulWidget {
  const Discount({super.key});

  @override
  State<Discount> createState() => _DiscountState();
}

class _DiscountState extends State<Discount> {
  Screen ? size;

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return
      Scaffold(
        body: Stack(
            children: [
              Container(
                  width: double.infinity,
                  height: size?.hp(100),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [lightBlue,lightWhite,lightWhite,lightWhite,lightWhite,lightWhite,lightWhite,lightBlue,lightBlue],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,)
                  )
              ),
              SingleChildScrollView(
                child: Container(
                  height: size?.hp(61),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: ListView.builder(
                        itemCount: 2,
                        itemBuilder: (context,index){
                          return Container(
                            height: size?.hp(35),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: shadow)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                                  color: lightBlueShade,
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                          radius:15,
                                          backgroundImage: AssetImage(propic)),
                                      SizedBox(width: size?.wp(2),),
                                      Satoshi500(text: 'Vaughn', color: textBlack, percentage: 0.035, fontWeight: FontWeight.w500)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius:10,
                                        backgroundImage:  AssetImage(propic),
                                      ),
                                      SizedBox(width: size?.wp(3),),
                                      Satoshi500(text: 'NESTO', color: deepGrey, percentage: 0.035, fontWeight: FontWeight.w500)
                                    ],
                                  ),
                                ),
                                Padding(padding: EdgeInsets.symmetric(horizontal: 54),
                                  child: Satoshi500(text: '456543', color: deepGrey, percentage: 0.035, fontWeight: FontWeight.w500),
                                ),
                                Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    children: [
                                      Container(
                                        width:size?.wp(18),
                                        height:size?.hp(8),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(4)
                                        ),
                                        child: Image.asset(shampoo,fit: BoxFit.fill,),
                                      ),
                                      SizedBox(width: size?.wp(2),),
                                      Column(
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        children: [
                                          Satoshi500(text: 'Shampoo', color: itemText, percentage: 0.040, fontWeight: FontWeight.w500),
                                          Satoshi500(text: '234319', color: textGrey, percentage: 0.035, fontWeight: FontWeight.w500)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                                  child:Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SalesManButton(onTap: (){
                                        // Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>BandingDetails()));
                                      }, width: size!.wp(35), height: size!.hp(6),
                                          child: Satoshi500(text: 'Details', color: salesManTile, percentage: 0.035, fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ),
              ),
            ]
        ),
      );
  }
}
