import 'package:flutter/material.dart';
import 'package:umrahcar/screens/create_booking_process/tab_screens/guest_info_screen.dart';
import 'package:umrahcar/screens/create_booking_process/tab_screens/other_info_screen.dart';
import 'package:umrahcar/screens/create_booking_process/tab_screens/pickup_info_screen.dart';

class TabbarCreateBookings extends StatefulWidget {
  const TabbarCreateBookings({super.key});

  @override
  State<TabbarCreateBookings> createState() => _TabbarCreateBookingsState();
}

abstract class TickerProvider {}

class _TabbarCreateBookingsState extends State<TabbarCreateBookings>
    with TickerProviderStateMixin {
  List<String> tabs = ["Guest Info", "Pickup Info", "Other Info"];

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.055,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  width: 1,
                  color: const Color(0xFF000000).withOpacity(0.15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: TabBar(
                  controller: tabController,
                  indicator: BoxDecoration(
                    color: const Color(0xFF79BF42),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  indicatorColor: const Color(0xFF79BF42),
                  isScrollable: true,
                  labelColor: Colors.white,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 20),
                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Montserrat-Regular',
                    fontWeight: FontWeight.w500,
                  ),
                  unselectedLabelColor: const Color(0xFF929292),
                  unselectedLabelStyle: const TextStyle(
                    color: Color(0xFF929292),
                    fontSize: 12,
                    fontFamily: 'Montserrat-Regular',
                    fontWeight: FontWeight.w500,
                  ),
                  tabs: const [
                    Tab(text: "Guest Info"),
                    Tab(text: "Pickup Info"),
                    Tab(text: "Other Info"),
                  ],
                ),
              )),
        ),
        SizedBox(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height * 0.72,
          child: TabBarView(
            controller: tabController,
            children: [
              GuestInfoPage(
                tabController: tabController,
              ),
              PickUpInfoPage(
                tabController: tabController,
              ),
              const OtherInfoPage(),
            ],
          ),
        ),
      ],
    );
  }
}
