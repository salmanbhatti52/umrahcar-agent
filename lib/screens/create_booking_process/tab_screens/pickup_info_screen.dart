// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:umrahcar/models/get_all_system_data_model.dart';
import 'package:umrahcar/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umrahcar/widgets/button.dart';

class TouristInfoPage extends StatefulWidget {
    List<String>? visaTypeItems = [];
    List<String>? pickupLocationData = [];
  GetAllSystemData? getAllSystemData;
  final TabController? tabController;
   TouristInfoPage({super.key, this.tabController,this.getAllSystemData,this.visaTypeItems,this.pickupLocationData});

  @override
  State<TouristInfoPage> createState() => _TouristInfoPageState();
}

class _TouristInfoPageState extends State<TouristInfoPage> {
  TextEditingController pickUpController = TextEditingController();
  TextEditingController dropOffController = TextEditingController();
  final GlobalKey<FormState> pickUpInfoFormKey = GlobalKey<FormState>();
  String? pickupDate;
  String? pickupTime;
  List<Widget> addDropdowns = [];
  String? selectedVisa;
  String? selectedLocation;
  String? selectedPickUp;
  String? selectedDropOff;
  String? currentDate;
  String? currentTime;



  @override
  Widget build(BuildContext context) {
    currentDate = DateFormat('MM/dd/yyyy').format(DateTime.now());
    currentTime=TimeOfDay.now().format(context);
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
            height: size.height * 0.84,
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
                                color: const Color(0xFF000000).withOpacity(0.15),
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                color: const Color(0xFF000000).withOpacity(0.15),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                color: const Color(0xFF000000).withOpacity(0.15),
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
                          items: widget.visaTypeItems!
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
                              selectedVisa = value ;
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
                                color: const Color(0xFF000000).withOpacity(0.15),
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                color: const Color(0xFF000000).withOpacity(0.15),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                color: const Color(0xFF000000).withOpacity(0.15),
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
                          items:
                          widget.pickupLocationData!.map(
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
                          value: selectedLocation,
                          onChanged: (value) {
                            setState(() {
                              selectedLocation = value ;
                              print("Location: ${selectedLocation}");
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
                                color: const Color(0xFF000000).withOpacity(0.15),
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                color: const Color(0xFF000000).withOpacity(0.15),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                color: const Color(0xFF000000).withOpacity(0.15),
                                width: 1,
                              ),
                            ),
                            prefixIcon: SvgPicture.asset(
                              'assets/images/hotel-icon.svg',
                              width: 10,
                              height: 10,
                              fit: BoxFit.scaleDown,
                            ),
                            hintText: 'Pickup Hotel',
                            hintStyle: const TextStyle(
                              color: Color(0xFF929292),
                              fontSize: 12,
                              fontFamily: 'Montserrat-Regular',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(16),
                          items: widget.visaTypeItems!
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
                          value: selectedPickUp,
                          onChanged: (value) {
                            setState(() {
                              selectedPickUp = value as String;
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
                                color: const Color(0xFF000000).withOpacity(0.15),
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                color: const Color(0xFF000000).withOpacity(0.15),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                color: const Color(0xFF000000).withOpacity(0.15),
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
                          items:
                          widget.pickupLocationData!.map(
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
                          value: selectedLocation,
                          onChanged: (value) {
                            setState(() {
                              selectedLocation = value ;
                              print("Location: ${selectedLocation}");
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
                                color: const Color(0xFF000000).withOpacity(0.15),
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                color: const Color(0xFF000000).withOpacity(0.15),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                color: const Color(0xFF000000).withOpacity(0.15),
                                width: 1,
                              ),
                            ),
                            prefixIcon: SvgPicture.asset(
                              'assets/images/hotel-icon.svg',
                              width: 10,
                              height: 10,
                              fit: BoxFit.scaleDown,
                            ),
                            hintText: 'Drop off Hotel',
                            hintStyle: const TextStyle(
                              color: Color(0xFF929292),
                              fontSize: 12,
                              fontFamily: 'Montserrat-Regular',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(16),
                          items: widget.visaTypeItems!
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
                            setState(() {
                              selectedDropOff = value as String;
                            });
                          },
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
                        firstDate:DateTime.now(), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2050)
                    );
                    if(pickedDate !=null){
                      print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
                      pickupDate = DateFormat('MM/dd/yyyy').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                      print(pickupDate);
                    }
                    setState(() {

                    });
                  },
                  child:  Center(
                    child: Text(
                      pickupDate !=null? '$pickupDate':"${currentDate}",
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
                   onTap: () async{
                      TimeOfDay? pickedTime = await showTimePicker(
                       context: context,
                       initialTime: TimeOfDay.now(),
                     );
                      if(pickedTime != null ){
                        print(" Time: ${pickedTime.format(context)}");
                        pickupTime=pickedTime.format(context);
                        setState(() {

                        });//output 10:51 PM
                      }else{
                        print("Time is not selected");
                      }
                   },
                   child: Center(
                    child: Text(
                      pickupTime!=null? pickupTime! : currentTime!,
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
                SizedBox(height: size.height * 0.04),
                GestureDetector(
                    onTap: () {
                      final newIndex = widget.tabController!.index + 1;
                      widget.tabController!.animateTo(newIndex);
                      print('newIndex $newIndex');
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
