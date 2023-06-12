import 'package:flutter/material.dart';
import 'package:umrahcar/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umrahcar/widgets/button.dart';

class OtherInfoPage extends StatefulWidget {
  const OtherInfoPage({super.key});

  @override
  State<OtherInfoPage> createState() => _OtherInfoPageState();
}

class _OtherInfoPageState extends State<OtherInfoPage> {
  TextEditingController flightnumberController = TextEditingController();
  TextEditingController instructionsController = TextEditingController();
  final GlobalKey<FormState> guestInfoFormKey = GlobalKey<FormState>();

  List<Widget> addDropdowns = [];
  String? selectedVehicle;
  String? selectedChildren;
  String? selectedAdult;
  String? selectedLuggage;

  final List<String> items = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
  ];

  @override
  Widget build(BuildContext context) {
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
            height: size.height * 0.91,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.04),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField(
                              icon: SvgPicture.asset(
                                'assets/images/dropdown-icon.svg',
                              ),
                              iconSize: 5,
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
                                  'assets/images/big-black-car-icon.svg',
                                  width: 35,
                                  height: 35,
                                  fit: BoxFit.scaleDown,
                                ),
                                // suffixIcon: SvgPicture.asset(
                                //   'assets/images/dropdown-icon.svg',
                                //   width: 10,
                                //   height: 10,
                                //   fit: BoxFit.scaleDown,
                                // ),
                                hintText: 'Select Vehicle',
                                hintStyle: const TextStyle(
                                  color: Color(0xFF929292),
                                  fontSize: 12,
                                  fontFamily: 'Montserrat-Regular',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              borderRadius: BorderRadius.circular(16),
                              items: items
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
                              value: selectedVehicle,
                              onChanged: (value) {
                                setState(() {
                                  selectedVehicle = value as String;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            addDropdowns.add(additem());
                          });
                        },
                        child: Container(
                          width: size.width * 0.18,
                          height: size.height * 0.08,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              width: 1,
                              color: const Color(0xFF000000).withOpacity(0.15),
                            ),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/images/plus-icon.svg',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: addDropdowns,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.transparent,
                          width: size.width * 0.43,
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButtonFormField(
                                icon: SvgPicture.asset(
                                  'assets/images/dropdown-icon.svg',
                                ),
                                iconSize: 5,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16)),
                                    borderSide: BorderSide(
                                      color: const Color(0xFF000000)
                                          .withOpacity(0.15),
                                      width: 1,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16)),
                                    borderSide: BorderSide(
                                      color: const Color(0xFF000000)
                                          .withOpacity(0.15),
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16)),
                                    borderSide: BorderSide(
                                      color: const Color(0xFF000000)
                                          .withOpacity(0.15),
                                      width: 1,
                                    ),
                                  ),
                                  prefixIcon: SvgPicture.asset(
                                    'assets/images/children-icon.svg',
                                    width: 10,
                                    height: 10,
                                    fit: BoxFit.scaleDown,
                                  ),
                                  // suffixIcon: SvgPicture.asset(
                                  //   'assets/images/dropdown-icon.svg',
                                  //   width: 10,
                                  //   height: 10,
                                  //   fit: BoxFit.scaleDown,
                                  // ),
                                  hintText: 'No of Childs',
                                  hintStyle: const TextStyle(
                                    color: Color(0xFF929292),
                                    fontSize: 10,
                                    fontFamily: 'Montserrat-Regular',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(16),
                                items: items
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
                                value: selectedChildren,
                                onChanged: (value) {
                                  setState(() {
                                    selectedChildren = value as String;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),
                      Expanded(
                        child: Container(
                          color: Colors.transparent,
                          width: size.width * 0.43,
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButtonFormField(
                                icon: SvgPicture.asset(
                                  'assets/images/dropdown-icon.svg',
                                ),
                                iconSize: 5,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16)),
                                    borderSide: BorderSide(
                                      color: const Color(0xFF000000)
                                          .withOpacity(0.15),
                                      width: 1,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16)),
                                    borderSide: BorderSide(
                                      color: const Color(0xFF000000)
                                          .withOpacity(0.15),
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16)),
                                    borderSide: BorderSide(
                                      color: const Color(0xFF000000)
                                          .withOpacity(0.15),
                                      width: 1,
                                    ),
                                  ),
                                  prefixIcon: SvgPicture.asset(
                                    'assets/images/adult-icon.svg',
                                    width: 10,
                                    height: 10,
                                    fit: BoxFit.scaleDown,
                                  ),
                                  // suffixIcon: SvgPicture.asset(
                                  //   'assets/images/dropdown-icon.svg',
                                  //   width: 10,
                                  //   height: 10,
                                  //   fit: BoxFit.scaleDown,
                                  // ),
                                  hintText: 'No of Adults',
                                  hintStyle: const TextStyle(
                                    color: Color(0xFF929292),
                                    fontSize: 10,
                                    fontFamily: 'Montserrat-Regular',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(16),
                                items: items
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
                                value: selectedAdult,
                                onChanged: (value) {
                                  setState(() {
                                    selectedAdult = value as String;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
                              'assets/images/luggage-icon.svg',
                              width: 10,
                              height: 10,
                              fit: BoxFit.scaleDown,
                            ),
                            hintText: 'No. of Luggage',
                            hintStyle: const TextStyle(
                              color: Color(0xFF929292),
                              fontSize: 12,
                              fontFamily: 'Montserrat-Regular',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(16),
                          items: items
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
                          value: selectedLuggage,
                          onChanged: (value) {
                            setState(() {
                              selectedLuggage = value as String;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Total Passengers',
                    style: TextStyle(
                      color: Color(0xFF1E1E1E),
                      fontSize: 16,
                      fontFamily: 'Montserrat-Regular',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                const Center(
                  child: Text(
                    '8',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF79BF42),
                      fontSize: 16,
                      fontFamily: 'Montserrat-Regular',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: flightnumberController,
                    keyboardType: TextInputType.text,
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Flight Number field is required!';
                    //   }
                    //   return null;
                    // },
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Montserrat-Regular',
                      fontSize: 16,
                      color: Color(0xFF6B7280),
                    ),
                    decoration: InputDecoration(
                      filled: false,
                      errorStyle: const TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        wordSpacing: 2,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(
                          color: const Color(0xFF000000).withOpacity(0.15),
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(
                          color: const Color(0xFF000000).withOpacity(0.15),
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(
                          color: const Color(0xFF000000).withOpacity(0.15),
                          width: 1,
                        ),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      hintText: "Flight Number",
                      hintStyle: const TextStyle(
                        color: Color(0xFF929292),
                        fontSize: 12,
                        fontFamily: 'Montserrat-Regular',
                        fontWeight: FontWeight.w500,
                      ),
                      prefixIcon: SvgPicture.asset(
                        'assets/images/flight-icon.svg',
                        width: 25,
                        height: 25,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: instructionsController,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 4,
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Instructions for Driver field is required!';
                    //   }
                    //   return null;
                    // },
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Montserrat-Regular',
                      fontSize: 16,
                      color: Color(0xFF6B7280),
                    ),
                    decoration: InputDecoration(
                      filled: false,
                      errorStyle: const TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        wordSpacing: 2,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(
                          color: const Color(0xFF000000).withOpacity(0.15),
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(
                          color: const Color(0xFF000000).withOpacity(0.15),
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(
                          color: const Color(0xFF000000).withOpacity(0.15),
                          width: 1,
                        ),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      hintText: "Instructions for Driver",
                      hintStyle: const TextStyle(
                        color: Color(0xFF929292),
                        fontSize: 12,
                        fontFamily: 'Montserrat-Regular',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                const Center(
                  child: Text(
                    'Total Fare',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF1E1E1E),
                      fontSize: 16,
                      fontFamily: 'Montserrat-Regular',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                const Center(
                  child: Text(
                    '500',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF79BF42),
                      fontSize: 50,
                      fontFamily: 'Montserrat-Regular',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => bookingConfirmation(),
                    );
                  },
                  child: button('Submit', context),
                ),
                SizedBox(height: size.height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget additem() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButtonHideUnderline(
                  child: DropdownButtonFormField(
                    icon: SvgPicture.asset(
                      'assets/images/dropdown-icon.svg',
                    ),
                    iconSize: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(
                          color: const Color(0xFF000000).withOpacity(0.15),
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(
                          color: const Color(0xFF000000).withOpacity(0.15),
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(
                          color: const Color(0xFF000000).withOpacity(0.15),
                          width: 1,
                        ),
                      ),
                      prefixIcon: SvgPicture.asset(
                        'assets/images/big-black-car-icon.svg',
                        width: 35,
                        height: 35,
                        fit: BoxFit.scaleDown,
                      ),
                      // suffixIcon: SvgPicture.asset(
                      //   'assets/images/dropdown-icon.svg',
                      //   width: 10,
                      //   height: 10,
                      //   fit: BoxFit.scaleDown,
                      // ),
                      hintText: 'Select Vehicle',
                      hintStyle: const TextStyle(
                        color: Color(0xFF929292),
                        fontSize: 12,
                        fontFamily: 'Montserrat-Regular',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(16),
                    items: items
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
                    value: selectedVehicle,
                    onChanged: (value) {
                      setState(() {
                        selectedVehicle = value as String;
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(width: size.width * 0.02),
            GestureDetector(
              onTap: () {
                setState(() {
                  addDropdowns.removeAt(0);
                });
              },
              child: Container(
                width: size.width * 0.18,
                height: size.height * 0.08,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    width: 1,
                    color: const Color(0xFF000000).withOpacity(0.15),
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/minus-icon.svg',
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: size.height * 0.02),
      ],
    );
  }

  Widget bookingConfirmation() {
    var size = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      insetPadding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        height: size.height * 0.85,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Column(
            children: [
              const Text(
                'Booking Confirmation',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat-Regular',
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Image.asset('assets/images/confirmation-icon.png',
                width: 140,
                height: 150,
              ),
              SizedBox(height: size.height * 0.03),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/images/small-grey-location-icon.svg'),
                    SizedBox(width: size.width * 0.02),
                    const Text(
                      'Pickup Location',
                      style: TextStyle(
                        color: Color(0xFF929292),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat-Regular',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.01),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  '2972 Westheimer Rd. Santa Ana, Illinois 85486 ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Montserrat-Regular',
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/images/small-grey-location-icon.svg'),
                    SizedBox(width: size.width * 0.02),
                    const Text(
                      'Drop Off Location',
                      style: TextStyle(
                        color: Color(0xFF929292),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat-Regular',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.01),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  '2972 Westheimer Rd. Santa Ana, Illinois 85486 ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Montserrat-Regular',
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.04),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Date',
                      style: TextStyle(
                        color: Color(0xFF929292),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat-Regular',
                      ),
                    ),
                    Text(
                      '22-09-2022',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat-Regular',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Vehicle Name',
                      style: TextStyle(
                        color: Color(0xFF929292),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat-Regular',
                      ),
                    ),
                    Text(
                      'BMW S10 Series',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat-Regular',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Fare Amount',
                      style: TextStyle(
                        color: Color(0xFF929292),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat-Regular',
                      ),
                    ),
                    Text(
                      '200 SAR',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat-Regular',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Total Fare',
                      style: TextStyle(
                        color: Color(0xFF929292),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat-Regular',
                      ),
                    ),
                    Text(
                      '600 SAR',
                      style: TextStyle(
                        color: Color(0xFF79BF42),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat-Regular',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.06),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: dialogButton('OK', context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
