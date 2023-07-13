import 'package:flutter/material.dart';
import 'package:umrahcar/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umrahcar/widgets/button.dart';

class OtherInfoPage extends StatefulWidget {
  final TabController? tabController;
   List<String>? pickVehicleData = [];
  List<String>? airLineComapny = [];

   OtherInfoPage({super.key,this.tabController,this.pickVehicleData,this.airLineComapny});

  @override
  State<OtherInfoPage> createState() => _OtherInfoPageState();
}

class _OtherInfoPageState extends State<OtherInfoPage> {
  TextEditingController flightnumberController = TextEditingController();
  TextEditingController instructionsController = TextEditingController();
  TextEditingController numberOfChilds = TextEditingController();
  TextEditingController numberOfinfants = TextEditingController();
  TextEditingController numberOfAdults = TextEditingController();
  TextEditingController nmbrOfLuggage = TextEditingController();
  final GlobalKey<FormState> guestInfoFormKey = GlobalKey<FormState>();
  int totalPassengers=0;
  int childs=0;
  int adult=0;
  int infants=0;


  List<Widget> addDropdowns = [];
  String? selectedVehicle;

  String? selectedChildren;
  String? selectedAdult;
  String? selectedLuggage;
  String? airlineName;

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
    List<String> selectedValues = List.filled(addDropdowns.length, '');

    print(childs);
    print(adult);
    print(infants);
    totalPassengers=infants+childs+adult;
    print("total passengers ${totalPassengers}");
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
                              items: widget.pickVehicleData!
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
                            if(addDropdowns.length>=4){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You can not add more vaheicles")));
                            }
                            else{
                              addDropdowns.add(additem());

                            }





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
                          child:TextFormField(
                            controller: numberOfChilds,
                            keyboardType: TextInputType.text,
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Number of Child field is required!';
                            //   }
                            //   return null;
                            // },
                            onChanged: (v){
                              childs= int.parse(numberOfChilds.text);


                              setState(() {

                              });

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
                              hintText: "Number of Childs",
                              hintStyle: const TextStyle(
                                color: Color(0xFF929292),
                                fontSize: 10,
                                fontFamily: 'Montserrat-Regular',
                                fontWeight: FontWeight.w500,
                              ),
                              prefixIcon: SvgPicture.asset(
                                'assets/images/adult-icon.svg',
                                width: 25,
                                height: 25,
                                fit: BoxFit.scaleDown,
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
                          child:TextFormField(
                            controller: numberOfAdults,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Number of Adults field is required!';
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
                              hintText: "No of Adults",
                              hintStyle: const TextStyle(
                                color: Color(0xFF929292),
                                fontSize: 10,
                                fontFamily: 'Montserrat-Regular',
                                fontWeight: FontWeight.w500,
                              ),
                              prefixIcon: SvgPicture.asset(
                                'assets/images/adult-icon.svg',
                                width: 25,
                                height: 25,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            onChanged: (v){
                              adult= int.parse(numberOfAdults.text);
                              setState(() {

                              });

                            },
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: numberOfinfants,
                    keyboardType: TextInputType.text,
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Number of Child field is required!';
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
                      hintText: "Number of Infants",
                      hintStyle: const TextStyle(
                        color: Color(0xFF929292),
                        fontSize: 10,
                        fontFamily: 'Montserrat-Regular',
                        fontWeight: FontWeight.w500,
                      ),
                      prefixIcon: SvgPicture.asset(
                        'assets/images/adult-icon.svg',
                        width: 25,
                        height: 25,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    onChanged: (v){
                      infants= int.parse(numberOfinfants.text);
                      setState(() {

                      });

                    },
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
                 Center(
                  child: Text(
                    totalPassengers !=null ?'$totalPassengers': "0",
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
                            hintText: 'Airline Name',
                            hintStyle: const TextStyle(
                              color: Color(0xFF929292),
                              fontSize: 12,
                              fontFamily: 'Montserrat-Regular',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(16),
                          items: widget.airLineComapny!
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
                          value: airlineName,
                          onChanged: (value) {
                            setState(() {
                              airlineName = value ;
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
                    items: widget.pickVehicleData!
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
                        selectedVehicle = value;
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

}
