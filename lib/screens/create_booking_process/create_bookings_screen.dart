import 'package:flutter/material.dart';
import 'package:umrahcar/utils/colors.dart';
import 'package:umrahcar/widgets/tabbar_create_bookings.dart';

class CreateBookingsPage extends StatefulWidget {
  const CreateBookingsPage({super.key});

  @override
  State<CreateBookingsPage> createState() => _CreateBookingsPageState();
}

class _CreateBookingsPageState extends State<CreateBookingsPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: mainColor,
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          // leading: GestureDetector(
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          //   child: SvgPicture.asset(
          //     'assets/images/back-icon.svg',
          //     width: 22,
          //     height: 22,
          //     fit: BoxFit.scaleDown,
          //   ),
          // ),
          title: const Text(
            'Create Booking',
            style: TextStyle(
              color: Colors.black,
              fontSize: 26,
              fontFamily: 'Montserrat-Regular',
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.02),
              const TabbarCreateBookings(),
            ],
          ),
        ),
      ),
    );
  }
}
