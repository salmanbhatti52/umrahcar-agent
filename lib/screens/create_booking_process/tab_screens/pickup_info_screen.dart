// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:umrahcar/models/get_all_system_data_model.dart';
import 'package:umrahcar/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umrahcar/widgets/button.dart';

import '../../../models/get_drop_off_location_model.dart';
import '../../../service/rest_api_serivice.dart';

class TouristInfoPage extends StatefulWidget {
  final TabController? tabController;
  final Function(
      {String visaType,
      String serviceType,
      String pickupLocation,
      String? pickupHotel,
      String dropOffLocation,
      String? dropOffHotel,
      String pickUpData,
      int? routesDropOffId,
      int? routesPickUpId,
      int? tabbarIndex,
      String pickUpTime}) onDataReceived;
  TouristInfoPage(
      {super.key,
      this.tabController,
      required this.onDataReceived});

  @override
  State<TouristInfoPage> createState() => _TouristInfoPageState();
}

class _TouristInfoPageState extends State<TouristInfoPage> {
  TextEditingController pickUpController = TextEditingController();
  TextEditingController dropOffController = TextEditingController();
  final GlobalKey<FormState> pickUpInfoFormKey = GlobalKey<FormState>();
  String? pickupDate;
  String? pickupTime;
  String? selectedVisa;
  String? selectedPickupLocation;
  String? selectedPickUp;
  String? selectedDropOff;
  String? serviceType;
  String? currentDate;
  String? currentTime;
  String? selectedHotel;
  List<String>? getHotelsData = [];
  String? selectedDropOffLocation;
  List<String>? getDropOffLocation = [];
  String? selectedDropOffHotel;
  List<String>? getDropOffHotel = [];
  int routesPickupId = 0;
  int routesDropOffId = 0;
  String hintValue="Drop off Location";
  late List<String> visaTypeItems = [];
  late List<String> pickupLocationData = [];
  late List<String> pickVehicleData = [];
  late List<String> serviceTypeData = [];
  getHotelsDataList({String? area}) async {
    final result = area!.split(' ').take(1).join(' ');
    print(result);


    var mapData = {"data_type": "get_pickup_hotels", "hotel_name": result};
    var response = await DioClient().getHotelsData(mapData, context);
    print("data of hotels: $response");
    if (response != null) {
      for (int i = 0; i < response.data!.length; i++) {
        getHotelsData!.add(response.data![i].name!);
        print("getHotelData: $getHotelsData");
        setState(() {

        });
      }
    }
  }

  getDropOffHotelsDataList({String? area}) async {
    print("area: ${area}");
    print("list: $getDropOffHotel");
    final result = area!.split(' ').take(1).join(' ');
    print(result);
    if(result== "Madinah" || result =="Makkah"){
      var mapData = {"data_type": "get_dropoff_hotels", "hotel_name": result};
      var response = await DioClient().getDropOffHotelData(mapData, context);
      print("data of dropoff hotels: $response");
      if (response != null) {
        for (int i = 0; i < response.data!.length; i++) {
          hintValue="Drop off Location";
          getDropOffHotel!.add(response.data![i].name!);
          print("getDropOffHotel: $getDropOffHotel");
          setState(() {});
        }
      }
    }
    else{
      hintValue="No need to select DropOff Location";
      getDropOffHotel=[];
      selectedDropOffHotel=null;
      setState(() {

      });
    }

  }

  GetDropOffLocation _getDropOffLocation = GetDropOffLocation();
  getDropOffDataList({int? routeId}) async {
    print("route: $routeId");

    var mapData = {
      "data_type": "get_dropoff_locations",
      "routes_pickup_id": "$routeId"
    };
    _getDropOffLocation = await DioClient().getDropOffData(mapData, context);
    print("data of dropoff hotels: $_getDropOffLocation");
    if (_getDropOffLocation != null) {
      for (int i = 0; i < _getDropOffLocation.data!.length; i++) {
        getDropOffLocation!.add(_getDropOffLocation.data![i].name!);

        print("getDropOffLocation: $getDropOffLocation");
        setState(() {

        });
      }
    }
  }

  GetAllSystemData getAllSystemData = GetAllSystemData();
  getSystemAllData() async {
    getAllSystemData = await DioClient().getSystemAllData(context);
    if (getAllSystemData != null) {
      getVisaTypeListData();
      getPickUpLocationData();
      getServiceTypeData();

      print("GETSystemAllData: ${getAllSystemData.data}");
      setState(() {});
    }
  }

  getVisaTypeListData() {
    visaTypeItems.clear();

    if (getAllSystemData!.data != null) {
      for (int i = 0; i < getAllSystemData!.data!.visaTypes!.length; i++) {
        visaTypeItems.add(getAllSystemData!.data!.visaTypes![i].name!);
        print("visa items= $visaTypeItems");
      }
    }
  }

  getPickUpLocationData() {
    pickupLocationData.clear();


    if (getAllSystemData!.data! != null) {
      for (int i = 0; i < getAllSystemData!.data!.routesPickup!.length; i++) {
        pickupLocationData.add(getAllSystemData!.data!.routesPickup![i].name!);
        print("route items= $pickupLocationData");
        setState(() {

        });

      }
    }

  }

  getServiceTypeData() {
    serviceTypeData.clear();
    if (getAllSystemData!.data! != null) {
      for (int i = 0; i < getAllSystemData!.data!.serviceType!.length; i++) {
        serviceTypeData.add(getAllSystemData!.data!.serviceType![i]);
        print("Service Type items= $serviceTypeData");
      }
    }
  }

  @override
  void initState() {
    getSystemAllData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    currentDate = DateFormat('MM/dd/yyyy').format(DateTime.now());
    currentTime = TimeOfDay.now().format(context);
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: mainColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            color: Colors.transparent,
            height: size.height * 0.94,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.04),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    color: Colors.transparent,
                    width: size.width,
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                          icon: SvgPicture.asset(
                            'assets/images/dropdown-icon.svg',
                            width: 10,
                            height: 10,
                            fit: BoxFit.scaleDown,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                color:
                                    const Color(0xFF000000).withOpacity(0.15),
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                color:
                                    const Color(0xFF000000).withOpacity(0.15),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                color:
                                    const Color(0xFF000000).withOpacity(0.15),
                                width: 1,
                              ),
                            ),
                            prefixIcon: SvgPicture.asset(
                              'assets/images/service-icon.svg',
                              width: 10,
                              height: 8,
                              fit: BoxFit.scaleDown,
                            ),
                            hintText: 'Service Type',
                            hintStyle: const TextStyle(
                              color: Color(0xFF929292),
                              fontSize: 12,
                              fontFamily: 'Montserrat-Regular',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(16),
                          items: serviceTypeData!
                              .map(
                                (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      color: Color(0xFF929292),
                                      fontSize: 12,
                                      fontFamily: 'Montserrat-Regular',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          value: serviceType,
                          onChanged: (value) {
                            setState(() {
                              serviceType = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    color: Colors.transparent,
                    width: size.width,
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                          icon: SvgPicture.asset(
                            'assets/images/dropdown-icon.svg',
                            width: 10,
                            height: 10,
                            fit: BoxFit.scaleDown,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                color:
                                    const Color(0xFF000000).withOpacity(0.15),
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                color:
                                    const Color(0xFF000000).withOpacity(0.15),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                color:
                                    const Color(0xFF000000).withOpacity(0.15),
                                width: 1,
                              ),
                            ),
                            prefixIcon: SvgPicture.asset(
                              'assets/images/visa-icon.svg',
                              width: 10,
                              height: 10,
                              fit: BoxFit.scaleDown,
                            ),
                            hintText: 'Visa Type',
                            hintStyle: const TextStyle(
                              color: Color(0xFF929292),
                              fontSize: 12,
                              fontFamily: 'Montserrat-Regular',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(16),
                          items: visaTypeItems!
                              .map(
                                (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      color: Color(0xFF929292),
                                      fontSize: 12,
                                      fontFamily: 'Montserrat-Regular',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          value: selectedVisa,
                          onChanged: (value) {
                            setState(() {
                              selectedVisa = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    color: Colors.transparent,
                    width: size.width,
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                          icon: SvgPicture.asset(
                            'assets/images/dropdown-icon.svg',
                            width: 10,
                            height: 10,
                            fit: BoxFit.scaleDown,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                color:
                                    const Color(0xFF000000).withOpacity(0.15),
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                color:
                                    const Color(0xFF000000).withOpacity(0.15),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                color:
                                    const Color(0xFF000000).withOpacity(0.15),
                                width: 1,
                              ),
                            ),
                            prefixIcon: SvgPicture.asset(
                              'assets/images/address-icon.svg',
                              width: 10,
                              height: 10,
                              fit: BoxFit.scaleDown,
                            ),
                            hintText: 'Pickup Location',
                            hintStyle: const TextStyle(
                              color: Color(0xFF929292),
                              fontSize: 12,
                              fontFamily: 'Montserrat-Regular',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(16),
                          items: pickupLocationData!
                              .map(
                                (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      color: Color(0xFF929292),
                                      fontSize: 12,
                                      fontFamily: 'Montserrat-Regular',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          value: selectedPickupLocation,
                          onChanged: (value) {
                            selectedPickupLocation = value;
                            print("Location: $selectedPickupLocation");
                            getDropOffLocation=[];
                            selectedDropOff=null;
                            selectedHotel= null ;
                            getHotelsData =[];
                             if(value !=null){
                               for (int i = 0;
                               i < getAllSystemData.data!.routesPickup!.length;
                               i++) {
                                 if (selectedPickupLocation ==
                                     getAllSystemData
                                         .data!.routesPickup![i].name) {
                                   routesPickupId = int.parse(getAllSystemData
                                       .data!.routesPickup![i].routesPickupId!);
                                   print("location length: $routesPickupId");



                                   getDropOffDataList(routeId: routesPickupId);

                                   getHotelsDataList(area: selectedPickupLocation);


                                 }
                               }
                             }


                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    color: Colors.transparent,
                    width: size.width,
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                          icon: SvgPicture.asset(
                            'assets/images/dropdown-icon.svg',
                            width: 10,
                            height: 10,
                            fit: BoxFit.scaleDown,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                color:
                                    const Color(0xFF000000).withOpacity(0.15),
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                color:
                                    const Color(0xFF000000).withOpacity(0.15),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                color:
                                    const Color(0xFF000000).withOpacity(0.15),
                                width: 1,
                              ),
                            ),
                            prefixIcon: SvgPicture.asset(
                              'assets/images/hotel-icon.svg',
                              width: 10,
                              height: 10,
                              fit: BoxFit.scaleDown,
                            ),
                            hintText: selectedPickupLocation != null &&
                                        selectedPickupLocation ==
                                            "Jeddah Airport" ||
                                    selectedPickupLocation ==
                                        "Madinah Airport" ||
                                    selectedPickupLocation ==
                                        "Makkah Train Station" ||
                                    selectedPickupLocation ==
                                        "Madinah Train Station"
                                ? "No need to select Hotel"
                                : 'Pickup Hotel',
                            hintStyle: const TextStyle(
                              color: Color(0xFF929292),
                              fontSize: 12,
                              fontFamily: 'Montserrat-Regular',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(16),
                          items: getHotelsData!
                              .map(
                                (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Container(
                                    width: 230,
                                    child: Text(
                                      item,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Color(0xFF929292),
                                        fontSize: 12,
                                        fontFamily: 'Montserrat-Regular',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          value: selectedHotel,
                          onChanged: selectedPickupLocation != null &&
                                      selectedPickupLocation ==
                                          "Jeddah Airport" ||
                                  selectedPickupLocation == "Madinah Airport" ||
                                  selectedPickupLocation ==
                                      "Makkah Train Station" ||
                                  selectedPickupLocation ==
                                      "Madinah Train Station"
                              ? null
                              : (String? value) {
                                  setState(() {
                                    selectedHotel = value;
                                    print("Hotel: $selectedHotel");
                                  });
                                },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    color: Colors.transparent,
                    width: size.width,
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                          icon: SvgPicture.asset(
                            'assets/images/dropdown-icon.svg',
                            width: 10,
                            height: 10,
                            fit: BoxFit.scaleDown,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                color:
                                    const Color(0xFF000000).withOpacity(0.15),
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                color:
                                    const Color(0xFF000000).withOpacity(0.15),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                color:
                                    const Color(0xFF000000).withOpacity(0.15),
                                width: 1,
                              ),
                            ),
                            prefixIcon: SvgPicture.asset(
                              'assets/images/address-icon.svg',
                              width: 10,
                              height: 10,
                              fit: BoxFit.scaleDown,
                            ),
                            hintText: 'Drop off Location',
                            hintStyle: const TextStyle(
                              color: Color(0xFF929292),
                              fontSize: 12,
                              fontFamily: 'Montserrat-Regular',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(16),
                          items: getDropOffLocation!
                              .map(
                                (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      color: Color(0xFF929292),
                                      fontSize: 12,
                                      fontFamily: 'Montserrat-Regular',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          value: selectedDropOff,
                          onChanged: (value) {
                            selectedDropOff = value;
                            print("DropOFF: $selectedDropOff");
                            getDropOffHotel=[];
                            selectedDropOffHotel=null;
                            if(value !=null){
                              getDropOffHotelsDataList(area: selectedDropOff);
                              if (_getDropOffLocation.data != null) {
                                for (int i = 0;
                                i < _getDropOffLocation.data!.length;
                                i++) {
                                  if (selectedDropOff ==
                                      _getDropOffLocation.data![i].name) {
                                    routesDropOffId = int.parse(
                                        _getDropOffLocation
                                            .data![i].routesDropoffId!);
                                    print("routes DropOffId: $routesDropOffId");


                                  }
                                }

                              }
                              setState(() {

                              });
                            }

                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    color: Colors.transparent,
                    width: size.width,
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                          icon: SvgPicture.asset(
                            'assets/images/dropdown-icon.svg',
                            width: 10,
                            height: 10,
                            fit: BoxFit.scaleDown,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                color:
                                    const Color(0xFF000000).withOpacity(0.15),
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                color:
                                    const Color(0xFF000000).withOpacity(0.15),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                color:
                                    const Color(0xFF000000).withOpacity(0.15),
                                width: 1,
                              ),
                            ),
                            prefixIcon: SvgPicture.asset(
                              'assets/images/hotel-icon.svg',
                              width: 10,
                              height: 10,
                              fit: BoxFit.scaleDown,
                            ),
                            hintText: hintValue,
                            hintStyle: const TextStyle(
                              color: Color(0xFF929292),
                              fontSize: 12,
                              fontFamily: 'Montserrat-Regular',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(16),
                          items: getDropOffHotel!
                              .map(
                                (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Container(
                                    width: 230,
                                    child: Text(
                                      item,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Color(0xFF929292),
                                        fontSize: 12,
                                        fontFamily: 'Montserrat-Regular',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          value: selectedDropOffHotel,
                          onChanged: (String? value) {
                            print("hiii");
                            setState(() {
                              selectedDropOffHotel = value;
                            });
                          }
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Pickup Date',
                    style: TextStyle(
                      color: Color(0xFF1E1E1E),
                      fontSize: 16,
                      fontFamily: 'Montserrat-Regular',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                InkWell(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(), //get today's date
                        firstDate: DateTime
                            .now(), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2050));
                    if (pickedDate != null) {
                      print(
                          pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                      pickupDate = DateFormat('MM/dd/yyyy').format(
                          pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                      print(pickupDate);
                    }
                    setState(() {});
                  },
                  child: Center(
                    child: Text(
                      pickupDate != null ? '$pickupDate' : "$currentDate",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF79BF42),
                        fontSize: 16,
                        fontFamily: 'Montserrat-Regular',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Pickup Time',
                    style: TextStyle(
                      color: Color(0xFF1E1E1E),
                      fontSize: 16,
                      fontFamily: 'Montserrat-Regular',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                InkWell(
                  onTap: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      print(" Time: ${pickedTime.format(context)}");
                      pickupTime = pickedTime.format(context);
                      setState(() {}); //output 10:51 PM
                    } else {
                      print("Time is not selected");
                    }
                  },
                  child: Center(
                    child: Text(
                      pickupTime != null ? pickupTime! : currentTime!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF79BF42),
                        fontSize: 16,
                        fontFamily: 'Montserrat-Regular',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                GestureDetector(
                    onTap: () {

                      // print("get service type: $serviceType");
                      // print("get visa type: $selectedVisa");
                      // print("get pickup location: $selectedPickupLocation");
                      // print("get  pickup hotel: $selectedHotel");
                      // print("get dropoff location:: $selectedDropOff");
                      // print("get dropoff hotel:: $selectedDropOffHotel");
                      // print("pick up date:: $pickupDate");
                      // print("pick up time:: $pickupTime");
                      //  print("get routes Pick Id:: $routesPickupId");
                      //  print("get Drop Off Pick Id:: $routesDropOffId");
                      // print("pick up time:: $pickupTime");
                      if (selectedVisa != null &&
                          serviceType != null &&
                          selectedDropOff != null &&
                          // selectedDropOffHotel != null &&
                          pickupTime != null &&
                          pickupDate != null &&
                          selectedPickupLocation != null &&
                          // selectedHotel != null &&
                          routesDropOffId != null &&
                          routesDropOffId != null) {
                        final newIndex = widget.tabController!.index + 1;
                        // widget.tabController!.animateTo(newIndex);
                        print('newIndex $newIndex');

                        widget.onDataReceived(
                            visaType: selectedVisa!,
                            serviceType: serviceType!,
                            dropOffHotel: selectedDropOffHotel,
                            dropOffLocation: selectedDropOff!,
                            pickUpData: pickupDate!,
                            pickupHotel: selectedHotel,
                            pickupLocation: selectedPickupLocation!,
                            pickUpTime: pickupTime!,
                            routesDropOffId: routesDropOffId,
                            tabbarIndex: newIndex,
                            routesPickUpId: routesPickupId);

                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("SomeThing is Missing")));
                      }

                    },
                    child: button('Next', context)),
                SizedBox(height: size.height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
