import 'package:colorful_background/colorful_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local_auth/local_auth.dart';
import 'package:merchandiser_app/screens/dash/manager/manager_home.dart';
import 'package:merchandiser_app/screens/dash/marchentaiser/create_request.dart';
import 'package:merchandiser_app/screens/dash/salesman/home.dart';
import 'package:merchandiser_app/utils/colors.dart';
import 'package:merchandiser_app/utils/images.dart';
import 'package:merchandiser_app/utils/responsive.dart';
import 'package:merchandiser_app/widgets/text/satoshi.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  bool hasPin=false;
  bool hasFinger= true;
  String _correctPin = "1234";
  String _correctPinSales='2341';
  String _correctPinManager='3412';
  FocusNode? _focusNode;
  String? errorMessage;
  List<TextEditingController> _otpControllers = List.generate(
    4,
        (index) => TextEditingController(),
  );
  List<bool> _boxSelected = [false, false, false, false];
  Screen ? size;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    Future.delayed(Duration.zero, () => FocusScope.of(context).requestFocus(_focusNode));
    for (int i = 0; i < _otpControllers.length; i++) {
      _otpControllers[i].addListener(_onOTPChanged(i));
    }
  }

  void Function() _onOTPChanged(int index) {
    return () {
      setState(() {
        _boxSelected[index] = _otpControllers[index].text.isNotEmpty;
      });
      if (_otpControllers[index].text.isNotEmpty && index < _otpControllers.length - 1) {
        FocusScope.of(context).nextFocus();
      }
    };
  }

  bool allBoxesFilled() {
    return _otpControllers.every((controller) => controller.text.isNotEmpty);
  }

  void _checkPinAndNavigate(String enteredPin) {
    if (enteredPin == _correctPin) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CreateRequest()),
      );
    } else if(enteredPin==_correctPinSales){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SalesmanHome()),
      );
    } else if(enteredPin==_correctPinManager){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ManagerHome()),
      );
    } else {
          errorMessage =enteredPin==_correctPin? '':"Incorrect PIN.Please try again";
    }
  }

  final LocalAuthentication localAuth = LocalAuthentication();

  Future<void> _authenticate() async {
    bool canCheckBiometrics = await localAuth.canCheckBiometrics;
    List<BiometricType> availableBiometrics = await localAuth.getAvailableBiometrics();

    print(canCheckBiometrics); //Returns true
    print(availableBiometrics.toString());
    try {
      bool authenticated = await localAuth.authenticate(
        localizedReason: 'Authenticate to access the app',
        options: AuthenticationOptions(
        useErrorDialogs: true,
        stickyAuth: true,
          biometricOnly: true,
        )
      );
      if (authenticated) {
        Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>ManagerHome()));
        print('User authenticated');
      } else {
        // Authentication failed
        print('Authentication failed');
      }
    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    String enteredPin = _otpControllers.map((controller) => controller.text).join();
    return
      Scaffold(
        body: ColorfulBackground(
            duration: const Duration(milliseconds: 3500),
            backgroundColors: [
              authDarkBlue,authLightBlue,authBlue,white
            ],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(hasPin)
              Container(
                child: Column(
                  children: [
                    Satoshi500(text: 'Enter Passcode', color: white, percentage: 0.065, fontWeight: FontWeight.w500),
                    Satoshi500(text: 'Please enter your passcode', color: authGrey, percentage: 0.035, fontWeight: FontWeight.w500),
                    SizedBox(height: size?.hp(5),),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        List.generate(
                          4,
                              (index) => Container(
                            alignment: Alignment.center,
                            width: size?.wp(13),
                            height: size?.hp(8),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color:_boxSelected[index]?enteredPin==_correctPin||enteredPin==_correctPinSales||enteredPin==_correctPinManager?butonTextblue:Colors.red:pinBoxGrey)
                            ),
                            child: TextField(
                              obscureText: true,
                              obscuringCharacter: '*',
                              controller: _otpControllers[index],
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              maxLength: 1,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  String enteredPin = _otpControllers.map((controller) => controller.text).join();
                                  _checkPinAndNavigate(enteredPin);
                                }
                              },
                              decoration: InputDecoration(
                                counterText: "",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                              ),
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: MediaQuery.of(context).size.width * 0.05,
                                fontWeight: FontWeight.w600,
                                color: enteredPin==_correctPin||enteredPin==_correctPinSales||enteredPin==_correctPinManager?butonTextblue:Colors.red
                              ),
                            ),
                          ),
                        )
                    ),
                    SizedBox(height: size?.hp(5),),
                    if(enteredPin.length==4)
                      Text(
                        enteredPin==_correctPin||enteredPin==_correctPinSales||enteredPin==_correctPinManager?'':errorMessage!,
                        style: TextStyle(color: Colors.red),
                      ),
                  ],
                ),
              ),
              if(hasFinger)
              Container(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap:(){
                          _authenticate();
                        },
                          child: SvgPicture.asset(finger)),
                      SizedBox(height: size?.hp(3),),
                      Satoshi500(text: 'Or', color: authGrey, percentage: 0.035, fontWeight: FontWeight.w500),
                      TextButton(
                          onPressed: (){
                            setState(() {
                              hasPin=true;
                              hasFinger=false;
                            });
                          },
                          child: Satoshi700(text: 'Use pin', color: white, percentage: 0.045))

                    ],
                  )),
              ],
          ),
        ),
      );
  }
}
