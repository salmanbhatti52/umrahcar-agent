import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umrahcar/models/get_booking_list_model.dart';
import 'package:umrahcar/screens/tracking_process/track_screen.dart';
import 'package:umrahcar/screens/tracking_process/track_completed_screen.dart';
import 'package:umrahcar/screens/tracking_process/track_upcoming_screen.dart';
import 'package:umrahcar/utils/const.dart';

Widget homeList(BuildContext context, GetBookingListModel getBookingListModel) {
  var size = MediaQuery.of(context).size;
  print("data bookibg: ${getBookingListModel.data}");
  return ListView.builder(
    physics: const AlwaysScrollableScrollPhysics(),
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    itemCount: getBookingListModel.data!.length,
    itemBuilder: (BuildContext context, int index) {
      var reverselist = getBookingListModel.data!.reversed.toList();
      var getData = reverselist[index];
      print("images:");
      print("${imageUrl}${getData.routes!.vehicles!.featureImage}");
      return Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.grey.withOpacity(0.5),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrackPage(getBookingData: getData),
                ));
          },
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                        "$imageUrl${getData.routes!.vehicles!.featureImage}"),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 175,
                        child: Text(
                          getData.name!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Montserrat-Regular',
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: size.height * 0.005),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "booking id: ${getData.bookingsId}",
                            style: const TextStyle(
                              color: Color(0xFF565656),
                              fontSize: 8,
                              fontFamily: 'Montserrat-Regular',
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          SizedBox(width: size.width * 0.05),
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
                      Container(
                        width: 180,
                        child: Row(
                          children: [
                            for (int i = 0; i < getData.vehicles!.length; i++)
                              Padding(
                                padding: const EdgeInsets.only(right: 2),
                                child: getData.vehicles!.length < 4
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                              'assets/images/small-black-car-icon.svg'),
                                          SizedBox(width: size.width * 0.01),
                                          Text(
                                            '${getData.vehicles![i].vehiclesName!.name}',
                                            style: const TextStyle(
                                              color: Color(0xFF565656),
                                              fontSize: 7,
                                              fontFamily: 'Montserrat-Regular',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(right: 5),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 4),
                                              child: SvgPicture.asset(
                                                  'assets/images/small-black-car-icon.svg'),
                                            ),
                                            Text(
                                              '${getData.vehicles![i].vehiclesName!.name}',
                                              style: const TextStyle(
                                                color: Color(0xFF565656),
                                                fontSize: 7,
                                                fontFamily: 'Montserrat-Regular',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                              ),
                          ],
                        ),
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
                  // SizedBox(width: size.width * 0.15),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TrackPage(getBookingData: getData),
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
          ),
        ),
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
