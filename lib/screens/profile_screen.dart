import 'package:flutter/material.dart';
import 'package:umrahcar/screens/homepage_screen.dart';
import 'package:umrahcar/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umrahcar/widgets/button.dart';
import 'package:umrahcar/screens/edit_profile_screen.dart';

import '../service/rest_api_serivice.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();

  bool _obscure = true;
  bool _obscure1 = true;
  bool _obscure2 = true;
  var getProfileResponse;
  getProfile()async{
    print("userIdId ${userId}");
    var mapData={
      "users_agents_id": userId.toString()
    };
    getProfileResponse= await DioClient().getProfile(mapData, context);
    if(getProfileResponse.data !=null ) {
      print("getProfileResponse name: ${getProfileResponse.data.name}");
    }
    setState(() {

    });
  }
  @override
  void initState() {
    getProfile();
    // TODO: implement initState
    super.initState();
  }

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
          title: const Text(
            'Profile',
            style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontFamily: 'Montserrat-Regular',
                fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: getProfileResponse !=null?
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 60, left: 20),
                          child: CircleAvatar(
                            radius: 35,
                            child: Image.asset(
                              'assets/images/profile.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: size.width * 0.04),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if(getProfileResponse !=null)
                               Text(
                                '${getProfileResponse.data.name}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Montserrat-Regular',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: size.height * 0.003),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) => changePassword(),
                                  );
                                },
                                child: const Text(
                                  'Change Password',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF79BF42),
                                    fontSize: 12,
                                    fontFamily: 'Montserrat-Regular',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EditProfilePage(),
                                ));
                          },
                          child:
                              SvgPicture.asset('assets/images/edit-icon.svg')),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.06),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [

                    SvgPicture.asset(
                      'assets/images/name-icon.svg',
                      width: 25,
                      height: 25,
                    ),
                    SizedBox(width: size.width * 0.04),
                      Text(
                      '${getProfileResponse.data.name}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Montserrat-Regular',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/business-name-icon.svg',
                      width: 25,
                      height: 25,
                    ),
                    SizedBox(width: size.width * 0.04),
                     Text(
                      '${getProfileResponse.data.agency}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Montserrat-Regular',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/email-icon.svg',
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(width: size.width * 0.04),

                       Text(
                      '${getProfileResponse.data.email}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Montserrat-Regular',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/city-icon.svg',
                      width: 25,
                      height: 25,
                    ),
                    SizedBox(width: size.width * 0.04),

                      Text(
                      '${getProfileResponse.data.city}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Montserrat-Regular',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/contact-icon.svg',
                      width: 25,
                      height: 25,
                    ),
                    SizedBox(width: size.width * 0.04),

                       Text(
                      '${getProfileResponse.data.contact}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Montserrat-Regular',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/whatsapp-icon.svg',
                      width: 25,
                      height: 25,
                    ),
                    SizedBox(width: size.width * 0.04),

                       Text(
                      '${getProfileResponse.data.whatsapp}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Montserrat-Regular',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ):  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/2.5,),
              const Padding(
                padding: EdgeInsets.only(left: 175),
                child: CircularProgressIndicator(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget changePassword() {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: StatefulBuilder(
        builder: (BuildContext context, void Function(void Function()) setState) {
          return Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            insetPadding: const EdgeInsets.only(left: 20, right: 20),
            child: SizedBox(
              height: size.height * 0.60,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                child: Form(
                  key: changePasswordFormKey,
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.02),
                      const Text(
                        'Change Password',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat-Regular',
                        ),
                      ),
                      SizedBox(height: size.height * 0.04),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: currentPasswordController,
                          obscureText: _obscure,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Currrent Password field is required!';
                            }
                            else if(value.length <6){
                              return "Password must be 6 Digits";
                            }
                            return null;
                          },
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
                            hintText: "Current Password",
                            hintStyle: const TextStyle(
                              color: Color(0xFF929292),
                              fontSize: 12,
                              fontFamily: 'Montserrat-Regular',
                              fontWeight: FontWeight.w500,
                            ),
                            prefixIcon: SvgPicture.asset(
                              'assets/images/password-icon.svg',
                              width: 25,
                              height: 25,
                              fit: BoxFit.scaleDown,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                print("cbbsjc");
                                setState(() {
                                  _obscure = !_obscure;
                                });
                              },
                              child: _obscure
                                  ? SvgPicture.asset(
                                'assets/images/hide-password-icon.svg',
                                width: 25,
                                height: 25,
                                fit: BoxFit.scaleDown,
                              )
                                  : SvgPicture.asset(
                                'assets/images/show-password-icon.svg',
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
                        child: TextFormField(
                          controller: newPasswordController,
                          obscureText: _obscure1,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'New Password field is required!';
                            }
                            else if(value.length <6){
                              return "Password must be 6 Digits";
                            }
                            return null;
                          },
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
                            hintText: "New Password",
                            hintStyle: const TextStyle(
                              color: Color(0xFF929292),
                              fontSize: 12,
                              fontFamily: 'Montserrat-Regular',
                              fontWeight: FontWeight.w500,
                            ),
                            prefixIcon: SvgPicture.asset(
                              'assets/images/password-icon.svg',
                              width: 25,
                              height: 25,
                              fit: BoxFit.scaleDown,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscure1 = !_obscure1;
                                });
                              },
                              child: _obscure1
                                  ? SvgPicture.asset(
                                'assets/images/hide-password-icon.svg',
                                width: 25,
                                height: 25,
                                fit: BoxFit.scaleDown,
                              )
                                  : SvgPicture.asset(
                                'assets/images/show-password-icon.svg',
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
                        child: TextFormField(
                          controller: confirmPasswordController,
                          obscureText: _obscure2,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Confirm Password field is required!';
                            }
                            else if(value.length <6){
                              return "Password must be 6 Digits";
                            }
                            return null;
                          },
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
                            hintText: "Confirm Password",
                            hintStyle: const TextStyle(
                              color: Color(0xFF929292),
                              fontSize: 12,
                              fontFamily: 'Montserrat-Regular',
                              fontWeight: FontWeight.w500,
                            ),
                            prefixIcon: SvgPicture.asset(
                              'assets/images/password-icon.svg',
                              width: 25,
                              height: 25,
                              fit: BoxFit.scaleDown,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscure2 = !_obscure2;
                                });
                              },
                              child: _obscure2
                                  ? SvgPicture.asset(
                                'assets/images/hide-password-icon.svg',
                                width: 25,
                                height: 25,
                                fit: BoxFit.scaleDown,
                              )
                                  : SvgPicture.asset(
                                'assets/images/show-password-icon.svg',
                                width: 25,
                                height: 25,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.06),
                      GestureDetector(
                        onTap: () async {
                          if (changePasswordFormKey.currentState!.validate()) {
                            print("users_agents_id: ${userId}");
                            print("current: ${currentPasswordController.text}");
                            print("new_password: ${newPasswordController.text}");
                            print("confirm_password: ${confirmPasswordController.text}");
                            var mapData={
                              "users_agents_id":"$userId",
                              "old_password":currentPasswordController.text,
                              "new_password":newPasswordController.text,
                              "confirm_password":" ${confirmPasswordController.text}"
                            };
                            var response = await DioClient().changeUserPassword(
                                mapData,context
                            );
                            print("response otp: ${response.message}");
                            if (response != null) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${response.message}")));
                              Navigator.pop(context);
                              currentPasswordController.text="";
                              newPasswordController.text="";
                              confirmPasswordController.text="";
                              _obscure2=true;
                              _obscure1=true;
                              _obscure=true;
                              setState(() {
                              });
                            }
                          }



                        },
                        child: dialogButton('Update', context),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
