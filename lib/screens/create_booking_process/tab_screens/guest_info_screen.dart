// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:umrahcar/utils/colors.dart';
import 'package:umrahcar/widgets/button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';

class GuestInfoPage extends StatefulWidget {
  final TabController? tabController;
  const GuestInfoPage({super.key, this.tabController});

  @override
  State<GuestInfoPage> createState() => _GuestInfoPageState();
}

class _GuestInfoPageState extends State<GuestInfoPage> {
  TextEditingController guestNameController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController whatsappNumberController = TextEditingController();
  final GlobalKey<FormState> guestInfoFormKey = GlobalKey<FormState>();
  final countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode;

  bool status = false;

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
            height: size.height * 0.72,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.04),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: guestNameController,
                    keyboardType: TextInputType.text,
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Guest Name field is required!';
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
                          horizontal: 20, vertical: 10),
                      hintText: "Guest Name",
                      hintStyle: const TextStyle(
                        color: Color(0xFF929292),
                        fontSize: 12,
                        fontFamily: 'Montserrat-Regular',
                        fontWeight: FontWeight.w500,
                      ),
                      prefixIcon: SvgPicture.asset(
                        'assets/images/name-icon.svg',
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
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: const Color(0xFF000000).withOpacity(0.15),
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final code = await countryPicker.showPicker(
                                context: context);
                            setState(() {
                              countryCode = code;
                            });
                            print('countryCode: $countryCode');
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              countryCode?.dialCode ?? "+966",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xFF929292),
                                fontSize: 14,
                                fontFamily: 'Montserrat-Regular',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          '|',
                          style: TextStyle(
                            color: Color(0xFF929292),
                            fontSize: 20,
                            fontFamily: 'Montserrat-Regular',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          width: 240,
                          child: TextFormField(
                            controller: contactNumberController,
                            keyboardType: TextInputType.number,
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Contact Number field is required!';
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
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1,
                                ),
                              ),
                              hintText: "Contact Number",
                              hintStyle: const TextStyle(
                                color: Color(0xFF929292),
                                fontSize: 12,
                                fontFamily: 'Montserrat-Regular',
                                fontWeight: FontWeight.w500,
                              ),
                              prefixIcon: SvgPicture.asset(
                                'assets/images/contact-icon.svg',
                                width: 25,
                                height: 25,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: whatsappNumberController,
                    keyboardType: TextInputType.number,
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Whatsapp Number field is required!';
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
                          horizontal: 20, vertical: 10),
                      hintText: "Whatsapp Number",
                      hintStyle: const TextStyle(
                        color: Color(0xFF929292),
                        fontSize: 12,
                        fontFamily: 'Montserrat-Regular',
                        fontWeight: FontWeight.w500,
                      ),
                      prefixIcon: SvgPicture.asset(
                        'assets/images/whatsapp-icon.svg',
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Same as contact',
                        style: TextStyle(
                          color: Color(0xFF565656),
                          fontSize: 12,
                          fontFamily: 'Montserrat-Regular',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      FlutterSwitch(
                        width: 45,
                        height: 25,
                        activeColor: const Color(0xFF79BF42),
                        inactiveColor: const Color(0xFF565656).withOpacity(0.2),
                        toggleSize: 25,
                        value: status,
                        borderRadius: 50,
                        padding: 2,
                        onToggle: (val) {
                          setState(() {
                            status = val;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.3),
                GestureDetector(
                  onTap: () {
                    final newIndex = widget.tabController!.index + 1;
                    widget.tabController!.animateTo(newIndex);
                    print('newIndex $newIndex');
                  },
                  child: button('Next', context),
                ),
                SizedBox(height: size.height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
