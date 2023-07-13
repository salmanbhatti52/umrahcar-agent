import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umrahcar/models/get_booking_list_model.dart';
import 'package:umrahcar/screens/tracking_process/track_screen.dart';
import 'package:umrahcar/screens/tracking_process/track_completed_screen.dart';
import 'package:umrahcar/screens/tracking_process/track_upcoming_screen.dart';
import 'package:umrahcar/utils/const.dart';

Widget homeList(BuildContext context,GetBookingListModel getBookingListModel) {
  var size = MediaQuery.of(context).size;
  print("data bookibg: ${getBookingListModel.data}");
  return ListView.builder(
    physics: const BouncingScrollPhysics(),
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    itemCount: getBookingListModel.data!.length,
    itemBuilder: (BuildContext context, int index) {
      var getData=getBookingListModel.data![index];
      print("images:");
      print("${imageUrl}${getData.routes!.vehicles!.featureImage}");
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration:  const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network("$imageUrl${getData.routes!.vehicles!.featureImage}"),
              ),
              SizedBox(width: size.width * 0.005),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getData.name!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Montserrat-Regular',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: size.height * 0.005),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                          'assets/images/small-black-location-icon.svg'),
                      SizedBox(width: size.width * 0.01),
                       Text(
                        "${getData.routes!.pickup!.name}",
                        style: const TextStyle(
                          color: Color(0xFF565656),
                          fontSize: 8,
                          fontFamily: 'Montserrat-Regular',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.005),
                    Row(
                      children: [
                        for(int i=0; i<getData.vehicles!.length; i++)
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            SvgPicture.asset('assets/images/small-black-car-icon.svg'),
                            SizedBox(width: size.width * 0.01),
                              Text(
                              '${getData.vehicles![i].vehiclesName!.name}',
                              style: TextStyle(
                                color: Color(0xFF565656),
                                fontSize: 8,
                                fontFamily: 'Montserrat-Regular',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                        ],
                  ),
                          ),
                      ],
                    ),
                  SizedBox(height: size.height * 0.005),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                          'assets/images/small-black-bookings-icon.svg'),
                      SizedBox(width: size.width * 0.01),
                       Text(
                        '${getData.bookingTime} ${getData.bookingDate}',
                        style: TextStyle(
                          color: Color(0xFF565656),
                          fontSize: 8,
                          fontFamily: 'Montserrat-Regular',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(width: size.width * 0.15),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  TrackPage(getBookingData: getData),
                        ));
                  },
                  child: SizedBox(
                    // width: 72,
                    // height: 18,
                    width: size.width * 0.2,
                    height: size.height * 0.024,
                    child: Text(
                      getData.status!,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        color: Color(0xFF0066FF),
                        fontSize: 12,
                        fontFamily: 'Montserrat-Regular',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

            ],
          ),
          SizedBox(height: size.height * 0.02),
        ],
      );
    },
  );
}

// List myList = [
//   MyList("assets/images/list-image-1.png", "Albert Flores", "Track"),
//   MyList("assets/images/list-image-2.png", "Floyd Miles", "Upcoming"),
//   MyList("assets/images/list-image-3.png", "Arlene McCoy", "Completed"),
//   MyList("assets/images/list-image-4.png", "Robert Fox", "Upcoming"),
//   MyList("assets/images/list-image-1.png", "Albert Flores", "Track"),
//   MyList("assets/images/list-image-2.png", "Floyd Miles", "Upcoming"),
//   MyList("assets/images/list-image-3.png", "Arlene McCoy", "Completed"),
//   MyList("assets/images/list-image-4.png", "Robert Fox", "Upcoming"),
//   MyList("assets/images/list-image-1.png", "Albert Flores", "Track"),
//   MyList("assets/images/list-image-2.png", "Floyd Miles", "Upcoming"),
//   MyList("assets/images/list-image-3.png", "Arlene McCoy", "Completed"),
//   MyList("assets/images/list-image-4.png", "Robert Fox", "Upcoming"),
//   MyList("assets/images/list-image-1.png", "Albert Flores", "Track"),
//   MyList("assets/images/list-image-2.png", "Floyd Miles", "Upcoming"),
//   MyList("assets/images/list-image-3.png", "Arlene McCoy", "Completed"),
//   MyList("assets/images/list-image-4.png", "Robert Fox", "Upcoming"),
// ];
//
// class MyList {
//   String? image;
//   String? title;
//   String? status;
//
//   MyList(this.image, this.title, this.status);
// }
