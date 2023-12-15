import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:merchandiser_app/screens/dash/manager/manager_home.dart';
import 'package:merchandiser_app/utils/responsive.dart';
import '../../../utils/colors.dart';
import '../../../utils/images.dart';
import '../../../widgets/buttons/back_button.dart';
import '../../../widgets/buttons/salesmanButton.dart';
import '../../../widgets/container/navigationbutton.dart';
import '../../../widgets/text/appbar_title.dart';
import '../../../widgets/text/satoshi.dart';
import '../report/manager_report.dart';

class BandingDetails extends StatefulWidget {
  const BandingDetails({super.key});

  @override
  State<BandingDetails> createState() => _BandingDetailsState();
}

class _BandingDetailsState extends State<BandingDetails> {

  void _playRecording() async {
    // final player = AudioPlayer();
    // await player.play();
  }

  void _pauseRecording() async {
    // final player = AudioPlayer();
    // await player.stop();
  }

  bool hasPress=false;
  bool hasPress2=false;
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
              title: AppBarTitle(text: 'Banding details', color: white,),
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
                          width: size?.wp(90),
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
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Satoshi500(text: 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum\ndolore eu fugiat nulla pariatu', color: textGrey, percentage: 0.030, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SalesManButton(onTap: (){}, width: size!.wp(42), height: size!.hp(6),
                                child: Satoshi500(text: 'Reject', color: salesManTile, percentage: 0.035, fontWeight: FontWeight.w500)),
                            Container(
                              width: size!.wp(42),
                              height: size!.hp(6),
                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: salesManTile,
                              ),
                              child: Center(child: Satoshi500(text: 'Approve', color: white, percentage: 0.035, fontWeight: FontWeight.w500)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),

            bottomNavigationBar: MyBottomNavigation(hasHome: false, hasReport: false, hasProfile: false, homeWidget: ManagerHome(),reportWidget: ManagerReport())
        )
    );
  }
}
