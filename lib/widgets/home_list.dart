import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umrahcar/screens/tracking_process/track_screen.dart';
import 'package:umrahcar/screens/tracking_process/track_completed_screen.dart';
import 'package:umrahcar/screens/tracking_process/track_upcoming_screen.dart';

Widget homeList(BuildContext context) {
  var size = MediaQuery.of(context).size;
  return ListView.builder(
    physics: const BouncingScrollPhysics(),
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    itemCount: myList.length,
    itemBuilder: (BuildContext context, int index) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(myList[index].image),
              ),
              SizedBox(width: size.width * 0.005),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    myList[index].title,
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
                      const Text(
                        'Makkah Hottle Aziziz',
                        style: TextStyle(
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/small-black-car-icon.svg'),
                      SizedBox(width: size.width * 0.01),
                      const Text(
                        'Sedan',
                        style: TextStyle(
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                          'assets/images/small-black-bookings-icon.svg'),
                      SizedBox(width: size.width * 0.01),
                      const Text(
                        '12:00 am on 2-12-2022',
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
              if (myList[index].status == 'Track')
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TrackPage(),
                        ));
                  },
                  child: SizedBox(
                    // width: 72,
                    // height: 18,
                    width: size.width * 0.2,
                    height: size.height * 0.024,
                    child: Text(
                      myList[index].status,
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
              if (myList[index].status == 'Upcoming')
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TrackUpcomingPage(),
                        ));
                  },
                  child: SizedBox(
                    // width: 72,
                    // height: 18,
                    width: size.width * 0.2,
                    height: size.height * 0.024,
                    child: Text(
                      myList[index].status,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        color: Color(0xFFCAAA00),
                        fontSize: 12,
                        fontFamily: 'Montserrat-Regular',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              if (myList[index].status == 'Completed')
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TrackCompletedPage(),
                        ));
                  },
                  child: SizedBox(
                    // width: 72,
                    // height: 18,
                    width: size.width * 0.2,
                    height: size.height * 0.024,
                    child: Text(
                      myList[index].status,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        color: Color(0xFF79BF42),
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

List myList = [
  MyList("assets/images/list-image-1.png", "Albert Flores", "Track"),
  MyList("assets/images/list-image-2.png", "Floyd Miles", "Upcoming"),
  MyList("assets/images/list-image-3.png", "Arlene McCoy", "Completed"),
  MyList("assets/images/list-image-4.png", "Robert Fox", "Upcoming"),
  MyList("assets/images/list-image-1.png", "Albert Flores", "Track"),
  MyList("assets/images/list-image-2.png", "Floyd Miles", "Upcoming"),
  MyList("assets/images/list-image-3.png", "Arlene McCoy", "Completed"),
  MyList("assets/images/list-image-4.png", "Robert Fox", "Upcoming"),
  MyList("assets/images/list-image-1.png", "Albert Flores", "Track"),
  MyList("assets/images/list-image-2.png", "Floyd Miles", "Upcoming"),
  MyList("assets/images/list-image-3.png", "Arlene McCoy", "Completed"),
  MyList("assets/images/list-image-4.png", "Robert Fox", "Upcoming"),
  MyList("assets/images/list-image-1.png", "Albert Flores", "Track"),
  MyList("assets/images/list-image-2.png", "Floyd Miles", "Upcoming"),
  MyList("assets/images/list-image-3.png", "Arlene McCoy", "Completed"),
  MyList("assets/images/list-image-4.png", "Robert Fox", "Upcoming"),
];

class MyList {
  String? image;
  String? title;
  String? status;

  MyList(this.image, this.title, this.status);
}
