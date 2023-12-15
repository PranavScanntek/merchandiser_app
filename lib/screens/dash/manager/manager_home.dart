import 'package:flutter/material.dart';
import 'package:merchandiser_app/screens/dash/manager/tabview/banding.dart';
import 'package:merchandiser_app/screens/dash/manager/tabview/discount.dart';
import 'package:merchandiser_app/screens/dash/manager/tabview/return.dart';
import 'package:merchandiser_app/utils/responsive.dart';

import '../../../utils/colors.dart';
import '../../../utils/images.dart';
import '../../../widgets/container/navigationbutton.dart';
import '../../../widgets/text/appbar_title.dart';
import '../../../widgets/text/satoshi.dart';
import '../report/manager_report.dart';

class ManagerHome extends StatefulWidget {
  const ManagerHome({super.key});

  @override
  State<ManagerHome> createState() => _ManagerHomeState();
}

class _ManagerHomeState extends State<ManagerHome> {
  Screen ? size;

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: size?.hp(20),
            automaticallyImplyLeading: false,
            elevation: 0,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [blue,blue,lightBlue,lightBlue],begin: Alignment.topCenter,end: Alignment.bottomCenter)
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBarTitle(text: 'Logo', color: white,),
                Container(
                    height: size?.hp(12),
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: salesManTile,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: .50,
                          color: shadow
                        )
                      ]
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius:size?.hp(6),
                          backgroundImage: AssetImage(propic),
                        ),
                        Satoshi500(text: 'Vaughn', color: white, percentage: 0.065, fontWeight: FontWeight.w500)
                      ],
                    )
                ),
              ],
            ),
            bottom: TabBar(
              indicatorWeight: 1,
              dividerColor: lightBlue,
              indicatorColor: salesManTile,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: salesManTile,
              unselectedLabelColor: unselectedTab,
              tabs: [
                Tab(text: 'Banding'),
                Tab(text: 'Discount'),
                Tab(text: 'Return'),
              ],
            ),
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
                      colors: [lightBlue,lightWhite,lightWhite,lightWhite,lightWhite,lightWhite,lightWhite,lightBlue,lightBlue],
                    )
                ),
              ),
              const TabBarView(
                children: [
                  Banding(),
                  Discount(),
                  Return(),
                ],
              ),
            ],
          ),
            bottomNavigationBar: MyBottomNavigation(hasHome: true, hasReport: false, hasProfile: false, homeWidget: ManagerHome(),reportWidget: ManagerReport())
        ),
      ),
    );
  }
}
