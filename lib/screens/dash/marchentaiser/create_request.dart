import 'package:flutter/material.dart';
import 'package:merchandiser_app/screens/dash/marchentaiser/request%20detials.dart';
import 'package:merchandiser_app/utils/responsive.dart';

import '../../../utils/colors.dart';
import '../../../utils/images.dart';
import '../../../widgets/buttons/back_button.dart';
import '../../../widgets/buttons/primaryButton.dart';
import '../../../widgets/buttons/secondary button.dart';
import '../../../widgets/container/navigationbutton.dart';
import '../../../widgets/text/appbar_title.dart';
import '../../../widgets/text/satoshi.dart';
import '../report/mechantaiser_report.dart';

class CreateRequest extends StatefulWidget {
  const CreateRequest({super.key});

  @override
  State<CreateRequest> createState() => _CreateRequestState();
}

class _CreateRequestState extends State<CreateRequest> {

  List<int>code=[2213,8531,4325,7642];
  String image=propic;
  List<String>name= ['NESTO','LULU','HI-LITE','OBRON'];
  Screen ? size;
  int? selectedTileIndex;
  bool hasSelect=false;

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: blue,
          leading:  PopButton(color: white,),
          title: AppBarTitle(text: 'Create request', color: white,),
          actions: [
            Satoshi500(text: 'Date ',color: Color.fromRGBO(255, 255, 255,.50),percentage: 0.035,fontWeight: FontWeight.w500,),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Satoshi700(text: ': 09 aug 23',color: white,percentage: 0.035,),
            )
          ],
        ),
          body: Container(
            padding: EdgeInsets.only(right: 20,left: 20),
            width: double.infinity,
            height: size?.hp(100),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [blue,blue,lightBlue,lightWhite,lightWhite,lightWhite,lightWhite,lightWhite,lightWhite,lightBlue,],
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: size?.hp(7),
                  alignment: Alignment.center,
                  child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none
                        ),
                        hintText: 'code,name',
                        hintStyle: TextStyle(
                          color: textGrey,
                          fontSize: MediaQuery.of(context).size.width * 0.035,
                          fontFamily: 'Satoshi',
                          fontWeight: FontWeight.w500
                        ),
                        suffixIcon: Icon(Icons.search,color: butonTextblue,)
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 5),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Satoshi500(text: 'Customers', color: textBlack,percentage: 0.040,fontWeight: FontWeight.w500,)),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: lightBlue,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(8),topLeft: Radius.circular(8))
                  ),
                  child: ListTile(
                    leading: Container(
                        alignment: Alignment.centerLeft,
                        width: size?.wp(20),
                        child: Satoshi500(text: 'Code',color: textBlack,percentage: 0.035,fontWeight: FontWeight.w500,)),
                    title: Satoshi500(text: 'Name',color: textBlack,percentage: 0.035,fontWeight: FontWeight.w500,),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 15,top: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                          padding: EdgeInsets.all(0),
                          itemCount: 4,
                          itemBuilder: (context,index){
                            return Container(
                              color: selectedTileIndex == index&&hasSelect
                                  ? selectedTileColor
                                  : null,
                              child: ListTile(
                                onTap: (){
                                  setState(() {
                                    selectedTileIndex = index;
                                    hasSelect=!hasSelect;
                                    hasSelect=true;
                                  });
                                },
                                leading: Container(
                                    width: size?.wp(20),
                                    alignment: Alignment.centerLeft,
                                    child: Satoshi500(text: '${code[index]}',color:selectedTileIndex==index&&hasSelect?blue:deepGrey,percentage: 0.035,fontWeight: selectedTileIndex==index&&hasSelect?FontWeight.w700:FontWeight.w500,)),
                                title: Container(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration:BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(color: selectedTileIndex==index&&hasSelect?blue:Colors.transparent,width: 2)
                                        ),
                                        child: CircleAvatar(
                                          radius:12,
                                          backgroundImage: AssetImage(image),
                                        ),
                                      ),
                                      SizedBox(width: size?.wp(2),),
                                      Satoshi500(text: '${name[index]}',color:selectedTileIndex==index&&hasSelect?blue:deepGrey,percentage: 0.035,fontWeight: selectedTileIndex==index&&hasSelect?FontWeight.w700:FontWeight.w500,),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          bottomSheet:hasSelect==true&&hasSelect!=false?
      Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [lightBlue,lightWhite],begin: Alignment.bottomCenter,end: Alignment.topCenter)
        ),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SecondaryButton(onTap: (){
            setState(() {
              hasSelect=false;
            });
          },
            width: size!.wp(40),
            height: size!.hp(7),
            child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(colors: [darkBlue,blue],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft
                  ).createShader(bounds);
                },
                child: Satoshi700(text:'Cancel',color: Colors.white,percentage: 0.035,)),
          ),
          PrimaryButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Satoshi700(text: 'Next', color: white, percentage: 0.035),
                SizedBox(width: size?.wp(7),),
                Icon(Icons.arrow_forward_ios_rounded,color: white,)
              ],
            ),
            width: size!.wp(43),
            onTap: () {
              Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>RequestDetails()));
            }, padding: 20,)
        ],
            ),
      ):SizedBox(height:.5),
          bottomNavigationBar: MyBottomNavigation(hasHome: true, hasReport: false, hasProfile: false, homeWidget: CreateRequest(),reportWidget: Merchandiser_report())
      ),
    );
  }
}