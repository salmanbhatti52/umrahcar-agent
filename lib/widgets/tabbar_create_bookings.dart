import 'package:flutter/material.dart';
import 'package:umrahcar/models/get_all_system_data_model.dart';
import 'package:umrahcar/screens/create_booking_process/tab_screens/guest_info_screen.dart';
import 'package:umrahcar/screens/create_booking_process/tab_screens/other_info_screen.dart';
import 'package:umrahcar/screens/create_booking_process/tab_screens/pickup_info_screen.dart';
import 'package:umrahcar/service/rest_api_serivice.dart';

class TabbarCreateBookings extends StatefulWidget {
  const TabbarCreateBookings({super.key});

  @override
  State<TabbarCreateBookings> createState() => _TabbarCreateBookingsState();
}

abstract class TickerProvider {}

class _TabbarCreateBookingsState extends State<TabbarCreateBookings>
    with TickerProviderStateMixin {
  late  List<String> visaTypeItems = [];
  late  List<String> pickupLocationData = [];
  late  List<String> pickVehicleData = [];
  late  List<String> airLineComapny = [];
  GetAllSystemData getAllSystemData=GetAllSystemData();
  getSystemAllData()async{
    getAllSystemData= await DioClient().getSystemAllData(context);
    if(getAllSystemData !=null){
      getVisaTypeListData();
      getPickUpLocationData();
      getVehicleData();
      getAirLineDataa();

      print("GETSystemAllData: ${getAllSystemData.data}");
      setState(() {

      });
    }
  }

  getVisaTypeListData(){
    if(getAllSystemData!.data!=null) {
      for (int i = 0; i < getAllSystemData!.data!.visaTypes!.length; i++) {
        visaTypeItems.add(getAllSystemData!.data!.visaTypes![i].name!);
        print("visa items= $visaTypeItems");
      }
    }
  }
  getPickUpLocationData(){
    if(getAllSystemData!.data!!=null){
      for(int i=0 ;i<getAllSystemData!.data!.routesPickup!.length; i++){
        pickupLocationData.add(getAllSystemData!.data!.routesPickup![i].name!);
        print("route items= $pickupLocationData");
      }

    }
  }
  getVehicleData(){
    if(getAllSystemData!.data!!=null){
      for(int i=0 ;i<getAllSystemData!.data!.vehicles!.length; i++){
        pickVehicleData.add(getAllSystemData!.data!.vehicles![i].name!);
        print("vehicle items= $pickVehicleData");
      }

    }
  }
  getAirLineDataa(){
    if(getAllSystemData!.data!!=null){
      for(int i=0 ;i<getAllSystemData!.data!.flightCompanies!.length; i++){
        airLineComapny.add(getAllSystemData!.data!.flightCompanies![i].name!);
        print("Airline items= $airLineComapny");
      }

    }
  }
  @override
  void initState() {
    getSystemAllData();// TODO: implement initState
    super.initState();
  }

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
                    Tab(text: "Tourist Info"),
                    Tab(text: "Other Info"),
                    Tab(text: "Guest Info"),
                  ],
                ),
              )),
        ),
        SizedBox(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height * 0.72,
          child: TabBarView(
            controller: tabController,
            physics: NeverScrollableScrollPhysics(),

            children: [
              TouristInfoPage(
                tabController: tabController,
                getAllSystemData: getAllSystemData,
                visaTypeItems: visaTypeItems,
                pickupLocationData: pickupLocationData,
              ),
               OtherInfoPage(tabController: tabController,pickVehicleData: pickVehicleData,airLineComapny: airLineComapny),
              GuestInfoPage(
                tabController: tabController,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
