import 'package:flutter/material.dart';
import 'package:merchandiser_app/screens/dash/marchentaiser/add_products.dart';
import 'package:merchandiser_app/screens/dash/marchentaiser/create_request.dart';
import 'package:merchandiser_app/utils/images.dart';
import 'package:merchandiser_app/widgets/buttons/primaryButton.dart';
import 'package:merchandiser_app/widgets/container/navigationbutton.dart';
import 'package:merchandiser_app/widgets/text/satoshi.dart';

import '../../../utils/colors.dart';
import '../../../utils/responsive.dart';
import '../../../widgets/buttons/back_button.dart';
import '../../../widgets/text/appbar_title.dart';
import '../report/mechantaiser_report.dart';

class RequestDetails extends StatefulWidget {
  const RequestDetails({super.key});

  @override
  State<RequestDetails> createState() => _RequestDetailsState();
}

class _RequestDetailsState extends State<RequestDetails> {

  String image=propic;
  String name= 'Vaughn';
  String category='Grocery';

  bool showFullList = false;
  bool showOne=true;
  Screen ? size;

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: blue,
          leading: PopButton(color: white,),
          title:  AppBarTitle(text: 'Request details', color: white,),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(right: 20,left: 5,),
            width: double.infinity,
            height: size?.hp(100),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [blue,lightBlue,lightWhite,lightWhite,lightWhite,lightWhite,lightWhite,lightWhite,lightBlue,],
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,top: 15),
                    child: Satoshi700(text: 'Choose salesman', color: white, percentage: 0.040),
                  ),
                ),
                if(showFullList)
                Container(
                    height: size?.hp(35),
                    margin: EdgeInsets.only(left: 15,top:5,),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context,index){
                          return ListTile(
                            onTap: (){
                              setState(() {
                                showFullList=false;
                                showOne=true;
                              });
                            },
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(image),
                            ),
                            title: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Satoshi500(text: name,color: black,percentage: 0.045,fontWeight: FontWeight.w500,),
                            ),
                            subtitle:  Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Satoshi500(text: category,color: textBlackGrey,percentage: 0.035,fontWeight: FontWeight.w500,),
                            ),
                          );
                        })
                ),
                if(showOne)
                Container(
                  height: size?.hp(12),
                  margin: EdgeInsets.only(left: 15,top:5,),
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: ListView.builder(
                    itemCount: 1,
                      itemBuilder: (context,index){
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(image),
                          ),
                          title: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Satoshi500(text: name,color: black,percentage: 0.045,fontWeight: FontWeight.w500,),
                          ),
                          subtitle:  Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Satoshi500(text: category,color: textBlackGrey,percentage: 0.035,fontWeight: FontWeight.w500,),
                          ),
                        );
                      })
                ),
                SizedBox(height: size?.hp(2),),
                GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Satoshi500(text: 'Change', color: blue, percentage: 0.035, fontWeight: FontWeight.w500),
                      Icon(Icons.keyboard_arrow_down_outlined,color: blue,)
                  ],
                  ),
                  onTap: (){
                    setState(() {
                      showFullList=true;
                      showOne=false;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,top: 15),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Satoshi500(text: 'Description', color: textBlack,percentage: 0.040,fontWeight: FontWeight.w500,)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15,top: 5),
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  height: size?.hp(21),
                  decoration: BoxDecoration(
                    color: white,
                    border: Border.all(color: borderColor),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextFormField(
                    maxLines: 10,
                    decoration: InputDecoration(
                      border: InputBorder.none
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomSheet: PrimaryButton(
        child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Satoshi700(text: 'Next', color: white, percentage: 0.035),
          SizedBox(width: size?.wp(2),),
          Icon(Icons.arrow_forward_ios_rounded,color: white,)
        ],
        ),
        width: size!.wp(90),
        onTap: (){
          Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>AddProduct()));
        }, padding: 20,
        ),
        bottomNavigationBar: MyBottomNavigation(hasHome: false, hasReport: false, hasProfile: false, homeWidget: CreateRequest(),reportWidget: Merchandiser_report()),
      ),
    );
  }
}
