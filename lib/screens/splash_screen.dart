import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:umrahcar/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umrahcar/screens/login_screen.dart';
import 'package:umrahcar/widgets/navbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() async{
    final _sharedPref = await SharedPreferences.getInstance();
    var uid=_sharedPref.getString('userId');
    print("uiduid: ${uid}");
    uid !=null? Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const NavBar())):
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LogInPage()));
  }

  initScreen(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
          backgroundColor: mainColor,
          body: Center(
            child: SvgPicture.asset("assets/images/splash-icon.svg"),
          )),
    );
  }
}
