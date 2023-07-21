import 'package:flutter/material.dart';
import 'package:umrahcar/utils/colors.dart';
import 'package:umrahcar/widgets/navbar.dart';
import 'package:umrahcar/widgets/tabbar_create_bookings.dart';

class CreateBookingsPage extends StatefulWidget {
  const CreateBookingsPage({super.key});

  @override
  State<CreateBookingsPage> createState() => _CreateBookingsPageState();
}




class _CreateBookingsPageState extends State<CreateBookingsPage> {
  back(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> NavBar()));
    setState(() {
      
    });

  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        return back();
      },
      child: Scaffold(
        backgroundColor: mainColor,
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0,
          automaticallyImplyLeading: false,
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
