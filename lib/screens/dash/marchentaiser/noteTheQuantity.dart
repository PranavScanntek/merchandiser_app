import 'dart:async';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:merchandiser_app/utils/colors.dart';
import 'package:merchandiser_app/utils/images.dart';
import 'package:merchandiser_app/utils/responsive.dart';
import 'package:merchandiser_app/widgets/buttons/back_button.dart';
import 'package:merchandiser_app/widgets/buttons/primaryButton.dart';
import 'package:merchandiser_app/widgets/container/textContainer.dart';
import 'package:merchandiser_app/widgets/text/headerText.dart';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../../widgets/text/satoshi.dart';

class QuantityNote extends StatefulWidget {
  const QuantityNote({super.key});

  @override
  State<QuantityNote> createState() => _QuantityNoteState();
}

class _QuantityNoteState extends State<QuantityNote> {

  String? reasonValue;
  String? expiryValue;
  List<String> reasons=['Example1','Example2','Example3','Example4'];
  List<String>expiry=['09/10/23','11/10/23','23/10/23'];
  bool hasPress=false;
  bool hasMic=true;
  bool hasRecorded=false;
  Screen ? size;
  File? _imageFile;
  bool _isRecording = false;
  String? _recordingFilePath;
  int _recordingDuration = 00;
  Timer? timer;
  Duration _recordingDurationFormatted = Duration(seconds: 00);

  late Record audioRecord;
  late AudioPlayer audioPlayer;

 @override
 void initState(){
   audioPlayer= AudioPlayer();
   audioRecord=Record();
   super.initState();
 }

 @override
  void dispose() {
   audioPlayer.dispose();
   audioRecord.dispose();
   super.dispose();
  }


  Future<void> _startRecording() async {

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _recordingDuration += 1;
        _recordingDurationFormatted = Duration(seconds: _recordingDuration);
      });
    });

    try {
      if(await audioRecord.hasPermission()){
        await audioRecord.start();
        setState(() {
          _isRecording = true;
          _recordingDuration = 0;
        });
      }
    } catch (e) {
      print('Error recording audio: ${e.toString()}');
    }
  }

  Future<void> _stopRecording() async {
   try{
     String? path = await audioRecord.stop();
     setState(() {
       _isRecording=false;
       _recordingFilePath=path!;
     });
   }
   catch (e) {
     print('Error recording audio: ${e.toString()}');
   }
  }

  Future<void> _playRecording() async {
   try{
     Source urlSource= UrlSource(_recordingFilePath!);
     await audioPlayer.play(urlSource);
   }
   catch(e) {
     print('Error recording audio: ${e.toString()}');
   }
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }


  void _cancelRecording() async {
    await audioRecord.stop();

    setState(() {
      _isRecording = false;
      _recordingFilePath;
    });
  }


  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return Scaffold(
      backgroundColor: productTile,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: productTile,
        leading: PopButton(color:black),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right:20,top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                        margin:EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
                        child: Image.asset(shampoo,width:size?.wp(34),height:size?.hp(15),fit: BoxFit.fill,)),
                    Stack(
                      children: [
                        Container(
                          width:size?.wp(48),
                          height: size?.hp(15)),
                          Positioned(
                            top: size?.hp(0.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Satoshi500(text: 'Shampoo', color: itemText, percentage: 0.045, fontWeight: FontWeight.w500),
                                Satoshi500(text: '565688', color: textGrey, percentage: 0.035, fontWeight: FontWeight.w500),
                              ],
                            ),
                          ),
                        Positioned(
                          bottom: size?.hp(2),
                            left: size?.wp(20),
                            child: GestureDetector(
                          onTap: (){
                            _pickImage();
                          },
                          child: Satoshi500(text: 'Add photo', color: butonTextblue, percentage: 0.0375, fontWeight: FontWeight.w500),
                        ))
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: size?.hp(2),),
              Row(
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
                  _imageFile!=null?
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4)
                    ),
                    child: Image.file(
                      _imageFile!,
                    ),
                  ):SizedBox()
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeaderText(text: 'Quantity '),
                            TextContainer(
                                width: size!.wp(38),
                                widget: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                                height: size!.hp(6))
                          ],
                        )),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeaderText(text: 'Expiry date '),
                          Row(
                            children: [
                              TextContainer(
                                  width: size!.wp(38),
                                  widget: DropdownButton(
                                      icon: Icon(Icons.keyboard_arrow_down_outlined,color: black,),
                                      hint: Satoshi500(text: '10/11/23', color: black, percentage: 0.035, fontWeight: FontWeight.w500),
                                      iconDisabledColor: Color.fromRGBO(175, 175, 175, 1),
                                      iconEnabledColor: Color.fromRGBO(175, 175, 175, 1),
                                      underline: SizedBox(),
                                      isExpanded: true,
                                      elevation: 0,
                                      value: expiryValue,
                                      items: expiry.map((String item){
                                        return DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(item,
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue){
                                        setState(() {
                                          expiryValue = newValue;
                                        });
                                      }
                                  ),
                                  height: size!.hp(6)),
                              SizedBox(width: size?.wp(2),),
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: black
                                ),
                                child: SvgPicture.asset(add,color: white,height: size?.hp(4),),
                              )
                            ],
                          ),
                        ],
                      )),
                ],
              ),
              TextContainer(
                widget: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Satoshi500(text: '08/09/23', color: black, percentage: 0.035, fontWeight: FontWeight.w500),
                  Icon(Icons.close,color: black,size: size?.wp(3),)
                ],
              ), height: size!.hp(6),width: size!.wp(36),),
              Align(
                alignment: Alignment.centerLeft,
                  child: HeaderText(text: 'Reason ')),
              TextContainer(
                height: size!.hp(6),
                widget: DropdownButton(
                  icon: Icon(Icons.keyboard_arrow_down_outlined,color: black,),
                  hint: Satoshi500(text: 'Reason here...', color: black, percentage: 0.035, fontWeight: FontWeight.w500),
                    iconDisabledColor: Color.fromRGBO(175, 175, 175, 1),
                    iconEnabledColor: Color.fromRGBO(175, 175, 175, 1),
                    isExpanded: true,
                    underline: SizedBox(),
                    elevation: 0,
                    value: reasonValue,
                    items: reasons.map((String item){
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item,
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue){
                      setState(() {
                        reasonValue = newValue;
                      });
                    }
                ),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: HeaderText(text: 'Note')),
              Align(
                alignment: Alignment.centerLeft,
                  child: Satoshi500(text: 'write some notes for the sales man about\nthe product', color: textGrey, percentage: 0.030, fontWeight: FontWeight.w500)),
              Padding(
                padding: const EdgeInsets.only(bottom: 75),
                child: TextContainer(
                    widget: Column(
                      children: [
                        if(hasMic==true&&_recordingFilePath!=null)
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 12),
                                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: white,
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          color: shadow
                                      )
                                    ]
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: _playRecording,
                                        child: SvgPicture.asset(mic,color: blue,height: size?.hp(3),)),
                                    SvgPicture.asset(wave,color: blue,),
                                    Satoshi500(text: '${_recordingDurationFormatted.inMinutes}.${_recordingDurationFormatted.inSeconds % 60}', color: blue, percentage: 0.035, fontWeight: FontWeight.w500),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        Expanded(
                          child: TextFormField(
                            maxLines: 10,
                            decoration: InputDecoration(
                              border: InputBorder.none
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if(hasPress)
                              Container(
                                padding: EdgeInsets.only(bottom: 4),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          hasMic=true;
                                          hasPress=false;
                                          _recordingFilePath==null;
                                          _cancelRecording();
                                          timer?.cancel();
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: white,
                                          boxShadow: [
                                            BoxShadow(
                                              spreadRadius: 2,
                                              blurRadius: 10,
                                              color: shadow
                                            )
                                          ]
                                        ),
                                        child: Icon(Icons.close,color: blue,size: size?.hp(3.5),),
                                      ),
                                    ),
                                    SizedBox(width: size?.wp(2),),
                                    Container(
                                      width: size?.wp(32),
                                      padding: EdgeInsets.only(left: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(4),bottomLeft: Radius.circular(4),bottomRight: Radius.circular(15)),
                                        color: white,
                                        boxShadow: [
                                          BoxShadow(
                                            spreadRadius: 2,
                                            blurRadius: 10,
                                            color: shadow
                                          )
                                        ]
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SvgPicture.asset(mic,color: blue,height: size?.hp(3),),
                                          Satoshi500(text: '${_recordingDurationFormatted.inMinutes}.${_recordingDurationFormatted.inSeconds % 60}', color: blue, percentage: 0.035, fontWeight: FontWeight.w500),
                                          GestureDetector(
                                            onTap: (){
                                              setState(() {
                                                hasMic=true;
                                                hasPress=false;
                                                hasRecorded=true;
                                                _stopRecording();
                                                timer?.cancel();
                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: butonTextblue,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(Icons.check,color: white,),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            if(hasMic)
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  hasPress=true;
                                  hasMic=false;
                                  _startRecording();
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom:3),
                                padding: EdgeInsets.all(11),
                                decoration: BoxDecoration(
                                  color: butonTextblue,
                                  shape: BoxShape.circle,
                                ),
                                child: SvgPicture.asset(mic),
                              ),
                            )
                          ],
                        )
                      ],
                    ), height: size!.hp(22)),
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        margin: EdgeInsets.only(bottom: 5),
        color: lightWhite,
        child: PrimaryButton(
            child: Satoshi700(text: 'Add to cart', color: white, percentage: 0.035),
            width: size!.wp(90), onTap: (){}, padding: 20),
      ),
    );
  }
}
