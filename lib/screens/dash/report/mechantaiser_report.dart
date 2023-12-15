import 'package:flutter/material.dart';
import 'package:merchandiser_app/screens/dash/marchentaiser/create_request.dart';

import '../../../utils/colors.dart';
import '../../../utils/images.dart';
import '../../../utils/responsive.dart';
import '../../../widgets/container/navigationbutton.dart';
import '../../../widgets/container/reportCard2.dart';
import '../../../widgets/container/report_card.dart';
import '../../../widgets/container/statusBox.dart';
import '../../../widgets/text/appbar_title.dart';
import '../../../widgets/text/reportTableHeader.dart';
import '../../../widgets/text/satoshi.dart';
import '../manager/manager_home.dart';

class Merchandiser_report extends StatefulWidget {
  const Merchandiser_report({super.key});

  @override
  State<Merchandiser_report> createState() => _Merchandiser_reportState();
}

class _Merchandiser_reportState extends State<Merchandiser_report> {
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
                            ReportCard2(text: 'Request', count: '32', color: reportDarkBlue, textColor: white,),
                            SizedBox(width: size?.wp(3),),
                            ReportCard2(text: 'Pending', count: '36', color: white, textColor: reportDarkBlue,),
                            SizedBox(width: size?.wp(3),),
                            ReportCard2(text: 'Rejected', count: '4', color: white, textColor: reportDarkBlue,)
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          height: size?.hp(54),
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
            bottomNavigationBar: MyBottomNavigation(hasHome: false, hasReport: true, hasProfile: false, homeWidget: CreateRequest(),reportWidget: Merchandiser_report())
        )
    );
  }
}
