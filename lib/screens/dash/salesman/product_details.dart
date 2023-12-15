import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:merchandiser_app/screens/dash/report/salesman_report.dart';
import 'package:merchandiser_app/screens/dash/salesman/home.dart';
import 'package:merchandiser_app/utils/images.dart';
import 'package:merchandiser_app/utils/responsive.dart';
import 'package:merchandiser_app/widgets/buttons/cancelButton.dart';
import 'package:merchandiser_app/widgets/buttons/primaryButton.dart';
import 'package:merchandiser_app/widgets/container/decision%20card.dart';
import '../../../utils/colors.dart';
import '../../../widgets/buttons/back_button.dart';
import '../../../widgets/container/navigationbutton.dart';
import '../../../widgets/text/appbar_title.dart';
import '../../../widgets/text/satoshi.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  Screen ? size;
  bool hasPress=false;
  bool hasPress2=false;
  String? _recordingFilePath;

  void _playRecording() async {
    // final player = AudioPlayer();
    // await player.play();
  }

  void _pauseRecording() async {
    // final player = AudioPlayer();
    // await player.stop();
  }

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return SafeArea(
        child: Scaffold(
        appBar: AppBar(
        elevation: 0,
        backgroundColor: blue,
        leading: PopButton(color: white),
    title: AppBarTitle(text: 'Product details', color: white,),
    ),
          body: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(right: 20,left: 20),
                width: double.infinity,
                height: size?.hp(100),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [blue,lightBlue,lightWhite,lightWhite,lightWhite,lightWhite,lightWhite,lightWhite,lightBlue,lightBlue],
                    )
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: size?.hp(23),
                        width: size?.wp(101),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: Image.asset(shampoo,fit: BoxFit.fill,),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4)
                              ),
                              child: Image.asset(item1),
                            ),
                            SizedBox(width: size?.wp(2),),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4)
                              ),
                              child: Image.asset(item2),
                            ),
                            SizedBox(width: size?.wp(2),),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4)
                              ),
                              child: Image.asset(item3),
                            ),
                          ],
                        ),
                      ),
                      Satoshi500(text: 'Shampoo', color: itemText, percentage: 0.040, fontWeight: FontWeight.w500),
                      Satoshi500(text: '2341234', color: textGrey, percentage: 0.035, fontWeight: FontWeight.w500),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Satoshi500(text: 'Quantity and expiry date', color: textBlack, percentage: 0.0375, fontWeight: FontWeight.w500),
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: blueShade),
                          color: white
                        ),
                        child: Satoshi500(text: '8/  09-08-2023', color: black, percentage: 0.035, fontWeight: FontWeight.w500),
                      ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:10),
                  child: Container(
                    width: size?.wp(40),
                    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: white,
                        boxShadow: [BoxShadow(
                            blurRadius: .5,color: shadow
                        )]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        hasPress==false?
                        GestureDetector(
                            onTap: (){
                              setState(() {
                                hasPress=true;
                                hasPress2=false;
                                _playRecording();
                              });
                            },
                            child: SvgPicture.asset(play,color: blue,height: size?.hp(3),width: size?.wp(3)))
                            :GestureDetector(
                            onTap: (){
                              setState(() {
                                hasPress=false;
                                _pauseRecording();
                              });
                            },
                            child: SvgPicture.asset(pause,color: blue,height: size?.hp(3),width: size?.wp(3),)),
                        SvgPicture.asset(mic,color: blue,height: size?.hp(3),),
                        if(hasPress==true)
                          Image.asset(waveGif,height: size?.hp(2.7)),
                        if(hasPress==false)
                          SvgPicture.asset(wave,height: size?.hp(2.5),color: blue,)
                      ],
                    ),
                  ),
                ),
                Container(
                  width: size?.wp(40),
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: white,
                      boxShadow: [BoxShadow(
                          blurRadius: .5,color: shadow
                      )]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      hasPress2==false?
                      GestureDetector(
                          onTap: (){
                            setState(() {
                              hasPress2=true;
                              hasPress=false;
                              _playRecording();
                            });
                          },
                          child: SvgPicture.asset(play,color: blue,height: size?.hp(3),))
                          :GestureDetector(
                          onTap: (){
                            setState(() {
                              hasPress2=false;
                              _pauseRecording();
                            });
                          },
                          child: SvgPicture.asset(pause,color: blue,height: size?.hp(3),)),
                      SvgPicture.asset(mic,color: blue,height: size?.hp(3),),
                      if(hasPress2==true)
                        Image.asset(waveGif,height: size?.hp(2.7),),
                      if(hasPress2==false)
                        SvgPicture.asset(wave,height: size?.hp(2.5),color: blue,)
                    ],
                  ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Satoshi500(text: 'Notes', color: textBlack, percentage: 0.0375, fontWeight: FontWeight.w500),
                      ),
                      Satoshi500(text: 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum\ndolore eu fugiat nulla pariatu', color: textGrey, percentage: 0.030, fontWeight: FontWeight.w500),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DecisionCard(text: 'Banding',image: discount,onTap: (){
                            _showBandingDialog(context);
                          },),
                          DecisionCard(text: 'Discount',image: discount,onTap: (){
                            _showDiscountDialog(context);
                          },),
                          DecisionCard(text: 'Return',image: returnItem,onTap: (){
                            _showReturnigDialog(context);
                          },)
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),

            bottomNavigationBar: MyBottomNavigation(hasHome: false, hasReport: false, hasProfile: false, homeWidget: SalesmanHome(), reportWidget: SalesmanReport(),)
        )
    );
  }
  void _showBandingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: productTile,
          title: Satoshi500(text: 'Banding', color: textBlack, percentage: 0.035, fontWeight: FontWeight.w500),
          content:Satoshi500(text: 'Do you want to band the product you\nselected', color: textBlack, percentage: 0.035, fontWeight: FontWeight.w500),
          actions:[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CancelButton(),
                SizedBox(width:size?.wp(10),),
                PrimaryButton(child: Satoshi500(text: 'Proceed', color: white, percentage: 0.035, fontWeight: FontWeight.w500), width: size!.hp(18), onTap: (){}, padding: 0)

              ],
            ),],
        );
      },
    );
  }

  void _showReturnigDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: productTile,
          title: Satoshi500(text: 'Return', color: textBlack, percentage: 0.035, fontWeight: FontWeight.w500),
          content:Satoshi500(text: 'Do you want to add the product to\nreurn list', color: textBlack, percentage: 0.035, fontWeight: FontWeight.w500),
          actions:[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CancelButton(),
                SizedBox(width:size?.wp(10),),
                PrimaryButton(child: Satoshi500(text: 'Proceed', color: white, percentage: 0.035, fontWeight: FontWeight.w500), width: size!.hp(18), onTap: (){}, padding: 0)

              ],
            ),],
        );
      },
    );
  }

  void _showDiscountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: productTile,
          title: Satoshi500(text: 'Discount', color: textBlack, percentage: 0.035, fontWeight: FontWeight.w500),
          content:Container(
            height: size?.hp(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Satoshi500(text: 'Do you want to add discount to the\nproduct you selected', color: textBlack, percentage: 0.035, fontWeight: FontWeight.w500),
                Row(
                  children: [
                    Satoshi500(text: 'Percentage', color: textBlack, percentage: 0.0375, fontWeight: FontWeight.w500),
                    SizedBox(width: size?.wp(2),),
                    Container(
                      alignment: Alignment.center,
                      width: size?.wp(40),
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: borderColor)
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          actions:[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CancelButton(),
                SizedBox(width:size?.wp(10),),
                PrimaryButton(child: Satoshi500(text: 'Proceed', color: white, percentage: 0.035, fontWeight: FontWeight.w500), width: size!.hp(18), onTap: (){}, padding: 0)
              ],
            ),],
        );
      },
    );
  }
}
