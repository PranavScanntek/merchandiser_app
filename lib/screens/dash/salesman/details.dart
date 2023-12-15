import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:merchandiser_app/screens/dash/salesman/home.dart';
import 'package:merchandiser_app/screens/dash/salesman/product_details.dart';
import 'package:merchandiser_app/utils/images.dart';
import 'package:merchandiser_app/utils/responsive.dart';
import 'package:merchandiser_app/widgets/buttons/back_button.dart';

import '../../../utils/colors.dart';
import '../../../widgets/container/navigationbutton.dart';
import '../../../widgets/text/appbar_title.dart';
import '../../../widgets/text/satoshi.dart';
import '../report/salesman_report.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  List<String> name=['Shampoo','Shampoo','Shampoo'];
  List<String> image=[shampoo,demo,demo];
  Screen ? size;

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: blue,
          leading: PopButton(color: white),
          title: AppBarTitle(text: 'Details', color: white,),
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: size?.hp(2),
                                backgroundImage: AssetImage(propic),
                              ),
                              SizedBox(width: size?.wp(2),),
                              Satoshi500(text: 'NESTO', color: white, percentage: 0.035, fontWeight: FontWeight.w500),
                            ],
                          )),
                    ),
                    Container(
                      height: size?.hp(8.5),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: borderColor)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Satoshi500(text: 'Shampoo', color: itemText, percentage: 0.040, fontWeight: FontWeight.w500),
                              Satoshi500(text: '2341234', color: textGrey, percentage: 0.035, fontWeight: FontWeight.w500)
                            ],
                          ),
                          Row(
                            children: [
                              Satoshi500(text: '2 Photo , 2', color: salesManTile, percentage: 0.035, fontWeight: FontWeight.w500),
                              SvgPicture.asset(mic,color: salesManTile,height: size?.hp(2.5),)
                            ],
                          )
                        ],
                      ),
                    ),
      Container(
        height: size?.hp(60),
        margin: EdgeInsets.only(bottom: 10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            childAspectRatio: .69,
          ),
          itemCount: name.length,
          itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: (){
                  Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>ProductDetails()));
                },
                child: Container(
                  width: size?.wp(20),
                  padding: EdgeInsets.all(10),
                  decoration:  BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: borderColor),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height:size?.hp(15),
                        width: double.infinity,
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(4)
                        ),
                          child:
                          Image.asset(image[index],fit: BoxFit.fill,)
                        ),
                      Satoshi500(text: name[index], color: itemText, percentage: 0.040, fontWeight: FontWeight.w500),
                      Satoshi500(text: '2341234', color: textGrey, percentage: 0.035, fontWeight: FontWeight.w500),
                      Row(
                        children: [
                          Satoshi500(text: '2 Photo , 2', color: salesManTile, percentage: 0.035, fontWeight: FontWeight.w500),
                          SvgPicture.asset(mic,color: salesManTile,height: size?.hp(2.5),)
                        ],
                      )
                    ],
                  ),
                  ),
              );
          },
        ),
      ),
                  ],
                ),
              ),
            ),
          ],
        ),
          bottomNavigationBar: MyBottomNavigation(hasHome: false, hasReport: false, hasProfile: false, homeWidget: SalesmanHome(), reportWidget: SalesmanReport())
      ),
    );
  }
}
