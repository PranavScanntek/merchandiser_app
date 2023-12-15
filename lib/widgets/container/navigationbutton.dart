import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:merchandiser_app/screens/dash/report/manager_report.dart';
import 'package:merchandiser_app/utils/responsive.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../text/satoshi.dart';

class MyBottomNavigation extends StatefulWidget {

  bool hasHome;
  bool hasReport;
  bool hasProfile;
  Widget homeWidget;
  Widget reportWidget;
  MyBottomNavigation({required this.hasHome,required this.hasReport,required this.hasProfile,required this.homeWidget,required this.reportWidget});

  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {

  Screen ? size;

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: size?.hp(10),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [blue,lightBlue],begin: Alignment.bottomCenter,end: Alignment.topCenter)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>widget.homeWidget));
                setState(() {
                  widget.hasHome=!widget.hasHome;
                  widget.hasReport=false;
                  widget.hasProfile=false;
                });
              },
              child:
              widget.hasHome==true?
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: lightBlue,
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(home,color: textBlack,),
                    Satoshi400(text: 'Home', color: textBlack, percentage: 0.035)
                  ],
                ),
              )
                  :SvgPicture.asset(home),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>widget.reportWidget));
                setState(() {
                  widget.hasReport=!widget.hasReport;
                  widget.hasHome=false;
                  widget.hasProfile=false;
                });
              },
              child:
              widget.hasReport==true?
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: lightBlue,
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(report,color: textBlack,),
                    Satoshi400(text: 'Report', color: textBlack, percentage: 0.035)
                  ],
                ),
              )
                  :SvgPicture.asset(report),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  widget.hasProfile=!widget.hasProfile;
                  widget.hasHome=false;
                  widget.hasReport=false;
                });
              },
              child:
              widget.hasProfile==true?
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: lightBlue,
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(profile,color: textBlack,),
                    Satoshi400(text: 'Profile', color: textBlack, percentage: 0.035)
                  ],
                ),
              )
                  :SvgPicture.asset(profile),
            ),
          ],
        )
    );
  }
}