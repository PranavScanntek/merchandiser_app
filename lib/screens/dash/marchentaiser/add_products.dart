import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:merchandiser_app/screens/dash/marchentaiser/cartpage.dart';
import 'package:merchandiser_app/screens/dash/marchentaiser/noteTheQuantity.dart';
import 'package:merchandiser_app/utils/images.dart';
import 'package:merchandiser_app/widgets/buttons/primaryButton.dart';
import 'package:merchandiser_app/widgets/buttons/secondary%20button.dart';
import '../../../utils/colors.dart';
import '../../../utils/responsive.dart';
import '../../../widgets/buttons/back_button.dart';
import '../../../widgets/text/appbar_title.dart';
import '../../../widgets/text/satoshi.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  String name='Shampoo';
  int number= 246287;
  String image= shampoo;
  String? result;
  Screen ? size;

  Future<void> _scanBarcode() async {
    String result;
    try {
      result = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666',
          'Cancel',
          true,
          ScanMode.BARCODE
      );
    } on PlatformException {
      result = 'Failed to get platform version.';
    }
    if(!mounted) return;
    setState((){this.result=result;
    });
  }

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    String currentDate = _getCurrentDate();
    return SafeArea(
        child: Scaffold(
          backgroundColor: white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: blue,
            leading:  PopButton(color: white,),
            title: AppBarTitle(text: 'Add product', color: white,),
            actions: [
              Satoshi500(text: 'Date ',color: Color.fromRGBO(255, 255, 255,.50),percentage: 0.035,fontWeight: FontWeight.w500,),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Satoshi700(text: currentDate,color: white,percentage: 0.035,),
              )
            ],
          ),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                width:double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [blue,darkBlue],end: Alignment.bottomCenter,begin: Alignment.topCenter)
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
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
                    ),
                    SizedBox(width: size?.wp(3),),
                    InkWell(
                      onTap: () {
                        _scanBarcode();
                      },
                      child: SvgPicture.asset(scanner,height: size?.hp(5),),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: size?.hp(12),
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                color: lightBlue,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius:size?.hp(3.5),
                          backgroundImage: AssetImage(food),
                        ),
                        Satoshi400(text: 'Food', color: textBlack, percentage: 0.035)
                      ],
                    ),
                    SizedBox(width: size?.wp(8),),
                    Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius:size?.hp(3.5),
                          backgroundImage: AssetImage(meat),
                        ),
                        Satoshi400(text: 'Meat', color: textBlack, percentage: 0.035)
                      ],
                    ),
                    SizedBox(width: size?.wp(8),),
                    Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius:size?.hp(3.5),
                          backgroundImage: AssetImage(liquid),
                        ),
                        Satoshi400(text: 'Liquid', color: textBlack, percentage: 0.035)
                      ],
                    ),
                    SizedBox(width: size?.wp(8),),
                    Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius:size?.hp(3.5),
                          backgroundImage: AssetImage(homePack),
                        ),
                        Satoshi400(text: 'Home', color: textBlack, percentage: 0.035)
                      ],
                    ),
                    SizedBox(width: size?.wp(8),),
                    Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius:size?.hp(3.5),
                          backgroundImage: AssetImage(health),
                        ),
                        Satoshi400(text: 'Health', color: textBlack, percentage: 0.035)
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Column(
                  children: [
                    Align(
                      alignment:Alignment.centerLeft,
                        child: Satoshi500(text: 'Top sellers', color: greyBlack, percentage: 0.035, fontWeight: FontWeight.w500)),
                    Container(
                      height: size?.hp(50),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 4,
                          itemBuilder: (context,index){
                          switch (index) {
                            case 0:
                            // Item with both image and quantity
                            return _buildItemWithImageAndQuantity();
                            case 1:
                            // Item with only image
                            return _buildItemWithoutImageAndQuantity();
                            case 2:
                            // Item with only quantity
                            return _buildItemWithOnlyQuantity();
                            case 3:
                            // Item without image and quantity
                            return _buildItemWithOnlyImage();
                            default:
                            return SizedBox.shrink();
                            }
                          }),
                    )
                  ],
                ),
              )
            ],
          ),
          bottomSheet: Container(
            height: size?.hp(10),
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: productTile,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                  color: shadow,
                  offset: Offset(0, -0.2)
                )
              ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SecondaryButton(onTap: (){
                  Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>CartPage()));
                }, width: size!.wp(40), height: size!.hp(7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(colors: [darkBlue,blue],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                              ).createShader(bounds);
                            },
                            child: Satoshi700(text:'View cart',color: Colors.white,percentage: 0.035,)),
                        SizedBox(width: size?.wp(2),),
                        Icon(Icons.shopping_cart,color: darkBlue,)
                      ],
                    )),
                PrimaryButton(child: Align(alignment:Alignment.center,child: Satoshi700(text: 'Send request', color: productTile, percentage: 0.035)), width: size!.wp(40), onTap: (){}, padding: 0,)
              ],
            ),
          ),
        )
    );
  }
  Widget _buildItemWithImageAndQuantity() {
    return Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            margin: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: productTile,
                boxShadow: [
                  BoxShadow(
                    color: shadow,
                    blurRadius: 1,
                  )
                ]
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Satoshi500(text: name, color: itemText, percentage: 0.045, fontWeight: FontWeight.w500),
                    Satoshi500(text: '${number}', color: textGrey, percentage: 0.035, fontWeight: FontWeight.w500),
                    SizedBox(height: size?.hp(5),),
                    SecondaryButton(child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(colors: [darkBlue,blue],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft
                          ).createShader(bounds);
                        },
                        child: Satoshi700(text:'Add details',color: Colors.white,percentage: 0.035,)), onTap: (){
                      Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>QuantityNote()));
                    }, width: size!.wp(30), height: size!.hp(6)),
                  ],
                ),
                Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset(image,width: size?.wp(30),height: size?.hp(20),),
                        Positioned(
                          bottom: size?.hp(3),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            width: size?.wp(25),
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(4)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SvgPicture.asset(minus),
                                Satoshi500(text: '1', color: blue, percentage: 0.035, fontWeight: FontWeight.w500),
                                SvgPicture.asset(add)
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          );
  }

  Widget _buildItemWithOnlyImage() {
    return Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            margin: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: productTile,
                boxShadow: [
                  BoxShadow(
                    color: shadow,
                    blurRadius: 1,
                  )
                ]
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Satoshi500(text: name, color: itemText, percentage: 0.045, fontWeight: FontWeight.w500),
                    Satoshi500(text: '${number}', color: textGrey, percentage: 0.035, fontWeight: FontWeight.w500),
                    SizedBox(height: size?.hp(5),),
                    SecondaryButton(child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(colors: [darkBlue,blue],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft
                          ).createShader(bounds);
                        },
                        child: Satoshi700(text:'Add details',color: Colors.white,percentage: 0.035,)), onTap: (){
                      Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>QuantityNote()));
                    }, width: size!.wp(30), height: size!.hp(6)),                  ],
                ),
                Column(
                  children: [
                    image!=null?
                    Image.asset(image,width: size?.wp(30),height: size?.hp(20),):Satoshi500(text: 'Quantity selector is not available for\nproduct with multiple options', color: tileHint, percentage: 0.025, fontWeight: FontWeight.w500)
                  ],
                )
              ],
            ),
          );
  }

  Widget _buildItemWithOnlyQuantity() {
    return Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            margin: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: productTile,
                boxShadow: [
                  BoxShadow(
                    color: shadow,
                    blurRadius: 1,
                  )
                ]
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Satoshi500(text: name, color: itemText, percentage: 0.045, fontWeight: FontWeight.w500),
                    Satoshi500(text: '${number}', color: textGrey, percentage: 0.035, fontWeight: FontWeight.w500),
                    SizedBox(height: size?.hp(2),),
                    SecondaryButton(child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(colors: [darkBlue,blue],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft
                          ).createShader(bounds);
                        },
                        child: Satoshi700(text:'Add details',color: Colors.white,percentage: 0.035,)), onTap: (){
                      Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>QuantityNote()));
                    }, width: size!.wp(30), height: size!.hp(6)),                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: size?.wp(25),
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SvgPicture.asset(minus),
                          Satoshi500(text: '1', color: blue, percentage: 0.035, fontWeight: FontWeight.w500),
                          SvgPicture.asset(add)
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          );
  }

  Widget _buildItemWithoutImageAndQuantity() {
    return Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            margin: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: productTile,
                boxShadow: [
                  BoxShadow(
                    color: shadow,
                    blurRadius: 1,
                  )
                ]
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Satoshi500(text: name, color: itemText, percentage: 0.045, fontWeight: FontWeight.w500),
                    Satoshi500(text: '${number}', color: textGrey, percentage: 0.035, fontWeight: FontWeight.w500),
                    SizedBox(height: size?.hp(1),),
                    SecondaryButton(child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(colors: [darkBlue,blue],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft
                          ).createShader(bounds);
                        },
                        child: Satoshi700(text:'Add details',color: Colors.white,percentage: 0.035,)), onTap: (){
                      Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>QuantityNote()));
                    }, width: size!.wp(30), height: size!.hp(6)),                  ],
                ),
                Column(
                  children: [
                    Satoshi500(text: 'Quantity selector is not available for\nproduct with multiple options', color: tileHint, percentage: 0.025, fontWeight: FontWeight.w500)
                  ],
                )
              ],
            ),
          );
  }
  String _getCurrentDate() {
    DateTime now = DateTime.now();
    String formattedDate = "${now.day} ${_getMonthName(now.month)} ${now.year}";
    return formattedDate;
  }

  String _getMonthName(int month) {
    // Convert month number to month name
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }
}
