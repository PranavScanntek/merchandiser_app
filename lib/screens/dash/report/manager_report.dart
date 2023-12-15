import 'package:flutter/material.dart';
import 'package:merchandiser_app/screens/dash/manager/manager_home.dart';
import 'package:merchandiser_app/utils/images.dart';
import 'package:merchandiser_app/utils/responsive.dart';
import 'package:merchandiser_app/widgets/container/report_card.dart';
import 'package:merchandiser_app/widgets/container/statusBox.dart';
import 'package:merchandiser_app/widgets/text/appbar_title.dart';
import 'package:merchandiser_app/widgets/text/reportTableHeader.dart';
import 'package:merchandiser_app/widgets/text/satoshi.dart';
import '../../../utils/colors.dart';
import '../../../widgets/container/navigationbutton.dart';

class ManagerReport extends StatefulWidget {
  const ManagerReport({super.key});

  @override
  State<ManagerReport> createState() => _ManagerReport();
}

class _ManagerReport extends State<ManagerReport> {
  Screen ? size;

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return SafeArea(
        child: Scaffold(
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
                      colors: [blue,lightBlue,lightBlue,lightWhite,lightWhite,lightWhite,lightWhite,lightWhite,lightBlue,lightBlue],
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: AppBarTitle(text: 'Report', color: white),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ReportCard(text: 'Approved', count: '32'),
                          SizedBox(width: size?.wp(3),),
                          ReportCard(text: 'Rejected', count: '4')
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        height: size?.hp(64),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            headingRowColor: MaterialStateProperty.all(reportDarkBlue),
                            columns: [
                              DataColumn(label: ReportTableText(text: 'Req No', color: reportGrey,)),
                              DataColumn(label: ReportTableText(text: 'Date', color: reportGrey,)),
                              DataColumn(label: ReportTableText(text: 'Name',color: reportGrey,)),
                              DataColumn(label: ReportTableText(text: 'Sales man',color: reportGrey,)),
                              DataColumn(label: ReportTableText(text: 'Product code',color: reportGrey,)),
                              DataColumn(label: ReportTableText(text: 'Status',color: reportGrey,)),
                            ],
                            rows: [
                              DataRow(cells: [
                                DataCell(ReportTableText( text: '5276',color: textBlack,)),
                                DataCell(ReportTableText(text:'09/08/2023',color: textBlack)),
                                DataCell(Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration:BoxDecoration(
                                          shape: BoxShape.circle,),
                                      child: CircleAvatar(
                                        radius:12,
                                        backgroundImage: AssetImage(propic),
                                      ),
                                    ),
                                    SizedBox(width: size?.wp(2),),
                                    Satoshi500(text: 'NESTO',color:black,percentage: 0.035,fontWeight:FontWeight.w500,),
                                  ],
                                ),
                                ),
                                DataCell(Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration:BoxDecoration(
                                          shape: BoxShape.circle,
                                      ),
                                      child: CircleAvatar(
                                        radius:12,
                                        backgroundImage: AssetImage(propic),
                                      ),
                                    ),
                                    SizedBox(width: size?.wp(2),),
                                    Satoshi500(text: 'Vaughn',color:black,percentage: 0.035,fontWeight:FontWeight.w500,),
                                  ],
                                ),),
                                DataCell(ReportTableText(text:'857984',color: textBlack)),
                                DataCell(StatusBox(color: Colors.green, text: 'Approved')),
                              ]),
                              DataRow(cells: [
                                DataCell(ReportTableText( text: '5276',color: textBlack)),
                                DataCell(ReportTableText(text:'09/08/2023',color: textBlack)),
                                DataCell(Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration:BoxDecoration(
                                        shape: BoxShape.circle,),
                                      child: CircleAvatar(
                                        radius:12,
                                        backgroundImage: AssetImage(propic),
                                      ),
                                    ),
                                    SizedBox(width: size?.wp(2),),
                                    Satoshi500(text: 'NESTO',color:black,percentage: 0.035,fontWeight:FontWeight.w500,),
                                  ],
                                ),
                                ),
                                DataCell(Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration:BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: CircleAvatar(
                                        radius:12,
                                        backgroundImage: AssetImage(propic),
                                      ),
                                    ),
                                    SizedBox(width: size?.wp(2),),
                                    Satoshi500(text: 'Vaughn',color:black,percentage: 0.035,fontWeight:FontWeight.w500,),
                                  ],
                                ),),
                                DataCell(ReportTableText(text:'857984',color: textBlack)),
                                DataCell(StatusBox(color: Colors.red, text: 'Rejected')),                                ]),
                              DataRow(cells: [
                                DataCell(ReportTableText( text: '5276',color: textBlack)),
                                DataCell(ReportTableText(text:'09/08/2023',color: textBlack)),
                                DataCell(Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration:BoxDecoration(
                                        shape: BoxShape.circle,),
                                      child: CircleAvatar(
                                        radius:12,
                                        backgroundImage: AssetImage(propic),
                                      ),
                                    ),
                                    SizedBox(width: size?.wp(2),),
                                    Satoshi500(text: 'NESTO',color:black,percentage: 0.035,fontWeight:FontWeight.w500,),
                                  ],
                                ),
                                ),
                                DataCell(Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration:BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: CircleAvatar(
                                        radius:12,
                                        backgroundImage: AssetImage(propic),
                                      ),
                                    ),
                                    SizedBox(width: size?.wp(2),),
                                    Satoshi500(text: 'Vaughn',color:black,percentage: 0.035,fontWeight:FontWeight.w500,),
                                  ],
                                ),),
                                DataCell(ReportTableText(text:'857984',color: textBlack)),
                                DataCell(StatusBox(color: Colors.green, text: 'Approved')),                                ]),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
            bottomNavigationBar: MyBottomNavigation(hasHome: false, hasReport: true, hasProfile: false, homeWidget: ManagerHome(),reportWidget: ManagerReport())
        )
    );
  }
}
