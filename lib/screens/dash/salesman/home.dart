import 'package:flutter/material.dart';
import 'package:merchandiser_app/screens/dash/salesman/details.dart';
import 'package:merchandiser_app/utils/images.dart';
import 'package:merchandiser_app/utils/responsive.dart';
import 'package:merchandiser_app/widgets/buttons/salesmanButton.dart';
import 'package:merchandiser_app/widgets/text/satoshi.dart';
import '../../../utils/colors.dart';
import '../../../widgets/container/navigationbutton.dart';
import '../../../widgets/text/appbar_title.dart';
import '../report/salesman_report.dart';

class SalesmanHome extends StatefulWidget {
  const SalesmanHome({super.key});

  @override
  State<SalesmanHome> createState() => _SalesmanHomeState();
}

class _SalesmanHomeState extends State<SalesmanHome> {

  Screen ? size;

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: blue,
            title: AppBarTitle(text: 'Logo', color: white,),
          ),
          body: Stack(
            children:[
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Column(
                  children: [
                    Container(
                      height: size?.hp(12),
                      width: size?.wp(90),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: salesManTile,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius:size?.hp(6),
                            backgroundImage: AssetImage(propic),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Satoshi500(text: 'Vaughn', color: white, percentage: 0.065, fontWeight: FontWeight.w500),
                              Satoshi500(text: 'Grocery', color: salesManSubTitle, percentage: 0.035, fontWeight: FontWeight.w500)
                            ],
                          )
                        ],
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                          child: Satoshi500(text: 'Requests', color: textBlack, percentage: 0.035, fontWeight: FontWeight.w500)),
                    ),
                    Container(
                      height: size?.hp(57),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 4,
                          itemBuilder: (context,index){
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                height: size?.hp(16.5),
                                width: size?.wp(90),
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: borderColor)
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius:size?.hp(2),
                                          backgroundImage: AssetImage(propic),
                                        ),
                                        SizedBox(width: size?.wp(2),),
                                        Satoshi500(text: 'NESTO', color: deepGrey, percentage: 0.035, fontWeight: FontWeight.w500),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal:35),
                                      child: Satoshi500(text: '3433', color: deepGrey, percentage: 0.035, fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 35),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Satoshi500(text: '5', color: butonTextblue, percentage: 0.065, fontWeight: FontWeight.w500),
                                              SizedBox(width: size?.wp(2),),
                                              Satoshi500(text: 'Products', color: textGrey, percentage: 0.030, fontWeight: FontWeight.w500),
                                            ],
                                          ),
                                          SalesManButton(onTap: (){
                                            Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>Details()));
                                          }, width: size!.wp(36), height: size!.hp(5), child: Satoshi500(text: 'Details', color: salesManTile, percentage: 0.035, fontWeight: FontWeight.w500))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                      }),
                    )
                  ],
                ),
              )
      ]
          ),
            bottomNavigationBar: MyBottomNavigation(hasHome: true, hasReport: false, hasProfile: false, homeWidget: SalesmanHome(),reportWidget: SalesmanReport())
        )
    );
  }
}
