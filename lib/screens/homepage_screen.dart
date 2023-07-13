import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:umrahcar/service/rest_api_serivice.dart';
import 'package:umrahcar/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umrahcar/widgets/top_boxes.dart';
import 'package:umrahcar/widgets/homepage_get_booking_list.dart';


var userId;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    getLocalData();
    // TODO: implement initState
    super.initState();
  }
  var getBookingResponse;
  var getProfileResponse;
  getLocalData()async{
    final _sharedPref = await SharedPreferences.getInstance();
    var uid=_sharedPref.getString('userId');
    userId=uid;
    print("uiduid: ${uid}");
    print("uiduid: ${userId}");
    getBookingList();
    getProfile();

  }
  getBookingList()async{
    print("userIdId ${userId}");
    var mapData={
      "users_agents_id": userId.toString()
    };
     getBookingResponse= await DioClient().getBookingList(mapData, context);
    print("response id: ${getBookingResponse.data}");
    setState(() {

    });

  }
  getProfile()async{
    print("userIdId ${userId}");
    var mapData={
      "users_agents_id": userId.toString()
    };
    getProfileResponse= await DioClient().getProfile(mapData, context);
    if(getProfileResponse.data !=null )
    print("getProfileResponse name: ${getProfileResponse.data.name}");
    setState(() {

    });

  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: mainColor,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              color: Colors.transparent,
              width: size.width,
              height: size.height * 0.158,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60, left: 20),
                    child: CircleAvatar(
                      radius: 35,
                      child: Image.asset('assets/images/profile.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: size.width * 0.02),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if(getProfileResponse !=null )
                         Container(
                           width: 150,
                           child: Text(
                            '${getProfileResponse.data!.name}',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Montserrat-Regular',
                              fontWeight: FontWeight.w600,

                            ),
                        ),
                         ),
                        SizedBox(height: size.height * 0.002),
                        Row(
                          children: [

                            SvgPicture.asset(
                                'assets/images/white-location-icon.svg'),
                            SizedBox(width: size.width * 0.01),
                            if(getProfileResponse !=null )
                             Container(
                               width: 150,
                               child: Text(
                                '${getProfileResponse.data!.address!} ${getProfileResponse.data!.city!}, ${getProfileResponse.data!.state!} ${getProfileResponse.data!.country!}',
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Montserrat-Regular',
                                  fontWeight: FontWeight.w500,
                                ),
                            ),
                             ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6, left: 50),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1,
                          color: Colors.black.withOpacity(0.15),
                        ),
                      ),
                      child: SvgPicture.asset(
                          'assets/images/notification-icon.svg'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.04),
            Container(
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      box('assets/images/white-bookings-icon.svg', '30',
                          'Pending Bookings', context),
                      box('assets/images/white-bookings-icon.svg', '10',
                          'All Bookings', context),
                      box('assets/images/white-bookings-icon.svg', '15',
                          'Completed Trips', context),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      noimagebox('30,000', 'Total Deposit', context),
                      noimageredbox('15,000', 'Remaining', context),
                      nobox(context),
                    ],
                  ),
                  SizedBox(height: size.height * 0.03),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Bookings',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Montserrat-Regular',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) => const BookingsPage(),
                        //         ));
                        //   },
                        //   child: const Text(
                        //     'See all',
                        //     textAlign: TextAlign.right,
                        //     style: TextStyle(
                        //       color: Color(0xFF79BF42),
                        //       fontFamily: 'Montserrat-Regular',
                        //       fontWeight: FontWeight.w500,
                        //       fontSize: 12,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Container(
                    color: Colors.transparent,
                    height: size.height * 0.430,
                    child:                   getBookingResponse !=null?
                      Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: homeList(context,getBookingResponse),
                    ): Center(child: Container(
                        height: 20,
                        width: 20,
                        child: const CircularProgressIndicator())),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
