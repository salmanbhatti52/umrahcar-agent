// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:umrahcar/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umrahcar/widgets/button.dart';

class PickUpInfoPage extends StatefulWidget {
  final TabController? tabController;
  const PickUpInfoPage({super.key, this.tabController});

  @override
  State<PickUpInfoPage> createState() => _PickUpInfoPageState();
}

class _PickUpInfoPageState extends State<PickUpInfoPage> {
  TextEditingController pickUpController = TextEditingController();
  TextEditingController dropOffController = TextEditingController();
  final GlobalKey<FormState> pickUpInfoFormKey = GlobalKey<FormState>();

  List<Widget> addDropdowns = [];
  String? selectedVisa;
  String? selectedPickUp;
  String? selectedDropOff;

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
                          value: selectedVisa,
                          onChanged: (value) {
                            setState(() {
                              selectedVisa = value as String;
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
                    height: size.height * 0.08,
                    child: TextFormField(
                      controller: pickUpController,
                      keyboardType: TextInputType.streetAddress,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Pickup Location field is required!';
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
                        errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 1,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        hintText: "Pickup Location",
                        hintStyle: const TextStyle(
                          color: Color(0xFF929292),
                          fontSize: 12,
                          fontFamily: 'Montserrat-Regular',
                          fontWeight: FontWeight.w500,
                        ),
                        prefixIcon: SvgPicture.asset(
                          'assets/images/address-icon.svg',
                          width: 25,
                          height: 25,
                          fit: BoxFit.scaleDown,
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
                  child: TextFormField(
                    controller: dropOffController,
                    keyboardType: TextInputType.streetAddress,
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Drop off Location field is required!';
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
                      hintText: "Drop off Location",
                      hintStyle: const TextStyle(
                        color: Color(0xFF929292),
                        fontSize: 12,
                        fontFamily: 'Montserrat-Regular',
                        fontWeight: FontWeight.w500,
                      ),
                      prefixIcon: SvgPicture.asset(
                        'assets/images/address-icon.svg',
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
                const Center(
                  child: Text(
                    '06-07-2023',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF79BF42),
                      fontSize: 16,
                      fontFamily: 'Montserrat-Regular',
                      fontWeight: FontWeight.w500,
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
                const Center(
                  child: Text(
                    '06-07-2023',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF79BF42),
                      fontSize: 16,
                      fontFamily: 'Montserrat-Regular',
                      fontWeight: FontWeight.w500,
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
