import 'package:flutter/material.dart';
import 'package:umrahcar/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umrahcar/screens/wallet_screen.dart';
import 'package:umrahcar/screens/profile_screen.dart';
import 'package:umrahcar/screens/homepage_screen.dart';
import 'package:umrahcar/screens/booking_process/bookings_screen.dart';
import 'package:umrahcar/screens/create_booking_process/create_bookings_screen.dart';

class NavBar extends StatefulWidget {
  int? indexNmbr;
  bool? updateBooking=false;
  String? bookingId="0";
   NavBar({super.key,this.indexNmbr,this.updateBooking,this.bookingId});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  int index = 0;




  @override
  void initState() {
    if(widget.indexNmbr !=null)
    index=widget.indexNmbr!;
    print("update allow; ${widget.updateBooking}");
    print("booking Id; ${widget.bookingId}");
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    final screens =  [
      const HomePage(),
      const BookingsPage(),
      CreateBookingsPage(updateBooking: widget.updateBooking,bookingId: widget.bookingId),
      const WalletPage(),
      const ProfilePage(),
    ];
    widget.bookingId=null;
      return Scaffold(
        backgroundColor: mainColor,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.15),
            border: Border.all(
              color: const Color(0xFFFFFFFF).withOpacity(0.15),
              width: 1,
            ),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: NavigationBarTheme(
              data: NavigationBarThemeData(
                indicatorShape: const CircleBorder(),
                indicatorColor: Colors.transparent,
                labelTextStyle: MaterialStateProperty.all(
                  const TextStyle(
                    color: Color(0xFF79BF42),
                    fontSize: 8,
                    fontFamily: 'Montserrat-Regular',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              child: NavigationBar(
                backgroundColor: mainColor,
                selectedIndex: index,
                labelBehavior:
                NavigationDestinationLabelBehavior.onlyShowSelected,
                onDestinationSelected: (index) =>
                    setState(() {
                      this.index = index;
                    }),
                destinations: [
                  NavigationDestination(
                    icon: SvgPicture.asset('assets/images/home-icon.svg'),
                    selectedIcon:
                    SvgPicture.asset('assets/images/active-home-icon.svg'),
                    label: 'Home',
                  ),
                  NavigationDestination(
                    icon: SvgPicture.asset('assets/images/bookings-icon.svg'),
                    selectedIcon: SvgPicture.asset(
                        'assets/images/active-bookings-icon.svg'),
                    label: 'Bookings',
                  ),
                  NavigationDestination(
                    icon: SvgPicture.asset(
                        'assets/images/create-bookings-icon.svg'),
                    selectedIcon: SvgPicture.asset(
                        'assets/images/create-bookings-icon.svg'),
                    label: '',
                  ),
                  NavigationDestination(
                    icon: SvgPicture.asset('assets/images/wallet-icon.svg'),
                    selectedIcon:
                    SvgPicture.asset('assets/images/active-wallet-icon.svg'),
                    label: 'Wallet',
                  ),
                  NavigationDestination(
                    icon: SvgPicture.asset('assets/images/profile-icon.svg'),
                    selectedIcon:
                    SvgPicture.asset('assets/images/active-profile-icon.svg'),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        ),
        body: screens[index],
      );
  }
}
