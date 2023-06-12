import 'dart:async';
import 'package:flutter/material.dart';
import 'package:umrahcar/utils/colors.dart';
import 'package:umrahcar/widgets/button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umrahcar/screens/reset_password_screen.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';

class VerifyOTPPage extends StatefulWidget {
  final String? email, verifyOTP;
  const VerifyOTPPage({super.key, this.email, this.verifyOTP});

  @override
  State<VerifyOTPPage> createState() => _VerifyOTPPageState();
}

class _VerifyOTPPageState extends State<VerifyOTPPage> {
  int seconds = 60;
  Timer? timer;
  FocusNode focusNode = FocusNode();
  TextEditingController otpController = TextEditingController();
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          stopTimer();
        }
      });
    });
  }

  void stopTimer() {
    timer?.cancel();
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    // print("email: ${widget.email}");
    // print("verifyOTP: ${widget.verifyOTP}");
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            stopTimer();
            Navigator.pop(context);
          },
          child: SvgPicture.asset(
            'assets/images/back-icon.svg',
            width: 22,
            height: 22,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      backgroundColor: mainColor,
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: otpFormKey,
            child: Column(
              children: [
                SizedBox(height: size.height * 0.06),
                const Center(
                  child: Text(
                    "Verify it’s you",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Montserrat-Regular',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                const Center(
                  child: Text(
                    'We send a code to ( *****@mail.com ).\nEnter it here to verify your identity',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF6B7280),
                      fontFamily: 'Montserrat-Regular',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Center(
                  child: RichText(
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "$seconds",
                      style: const TextStyle(
                        color: Color(0xFF6B7280),
                        fontFamily: 'Montserrat-Regular',
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                      ),
                      children: const [
                        TextSpan(
                          text: '  sec',
                          style: TextStyle(
                            color: Color(0xFF6B7280),
                            fontFamily: 'Montserrat-Regular',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.015),
                seconds == 0
                    ? GestureDetector(
                        onTap: () async {
                          seconds = 60;
                          await startTimer();
                          // forgotPassword();
                          // if (forgotPasswordModel.status == 'success') {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //       const SnackBar(
                          //           backgroundColor: Color(0xFF4276EE),
                          //           content: Text(
                          //               "OTP has been sent to your email")));
                          // }
                          // if (forgotPasswordModel.status != 'success') {
                          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //       backgroundColor: const Color(0xFF4276EE),
                          //       content:
                          //           Text("${forgotPasswordModel.message}")));
                          // }
                          setState(() {});
                        },
                        child: Center(
                          child: Text(
                            "Send again",
                            style: TextStyle(
                              color: secondaryColor,
                              fontSize: 12,
                              fontFamily: 'Montserrat-Regular',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: Text(
                          "Send again",
                          style: TextStyle(
                            color: Colors.grey.withOpacity(0.5),
                            fontSize: 12,
                            fontFamily: 'Montserrat-Regular',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                SizedBox(height: size.height * 0.05),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: PinCodeFields(
                    controller: otpController,
                    length: 4,
                    fieldBorderStyle: FieldBorderStyle.square,
                    responsive: false,
                    animation: Animations.rotateRight,
                    animationDuration: const Duration(milliseconds: 250),
                    animationCurve: Curves.bounceInOut,
                    switchInAnimationCurve: Curves.bounceIn,
                    switchOutAnimationCurve: Curves.bounceOut,
                    fieldHeight: 48,
                    fieldWidth: 48,
                    borderWidth: 1,
                    activeBorderColor: secondaryColor,
                    activeBackgroundColor: mainColor,
                    borderRadius: BorderRadius.circular(10.0),
                    keyboardType: TextInputType.number,
                    autoHideKeyboard: false,
                    fieldBackgroundColor: mainColor,
                    borderColor: const Color(0xFF6B7280),
                    textStyle: const TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Montserrat-Regular',
                    ),
                    onComplete: (output) {
                      // Your logic with pin code
                      // print(output);
                    },
                  ),
                ),
                SizedBox(height: size.height * 0.08),
                GestureDetector(
                  onTap: () {
                    // if (otpController.text == widget.verifyOTP) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const ResetPasswordPage()));
                  },
                  //   else {
                  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  //         backgroundColor: Color(0xFF4276EE),
                  //         content: Text("Invalid OTP")));
                  //   }
                  // },
                  child: button('Confirm', context),
                ),
                SizedBox(height: size.height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
