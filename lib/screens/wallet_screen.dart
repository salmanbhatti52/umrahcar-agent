import 'package:flutter/material.dart';
import 'package:umrahcar/utils/colors.dart';
import 'package:umrahcar/widgets/top_boxes.dart';
import 'package:umrahcar/widgets/wallet_list.dart';

import '../service/rest_api_serivice.dart';
import 'booking_process/tab_screens/add_card_page.dart';
import 'wallet_tab/wallet_tabbar.dart';
import 'homepage_screen.dart';

class WalletPage extends StatefulWidget {
  int? indexNmbr=0;
   WalletPage({super.key,this.indexNmbr});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  var getAgentsWidgetData;

  getAgentWidgetData()async{
    print("userIdId ${userId}");
    var mapData={
      "users_agents_id": userId.toString()
    };
    getAgentsWidgetData= await DioClient().getAgentsWidgetsData(mapData, context);
    print("response id: ${getAgentsWidgetData.data}");
    setState(() {

    });

  }


  @override
  void initState() {
    getAgentWidgetData();
    print(" widget.indexNmbr: ${ widget.indexNmbr}");
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
        body: getAgentsWidgetData !=null ?
        Container(
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
                height: size.height * 0.12,
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      'My Wallet',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat-Regular',
                        fontWeight: FontWeight.w700,
                        fontSize: 26,
                      ),
                    ),
                  ),
                ),
              ),
              // SizedBox(height: size.height * 0.04),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        bignoimagebox('${getAgentsWidgetData.data.bookingsTotalDeposit}', 'Wallet Amount', context),
                        SizedBox(width: size.width * 0.04),
                        InkWell(
                            onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddCardPage()));
                            setState(() {

                            });
                            },
                            child: bignoimageredbox('Add', 'Debit/Credit card', context)),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
                 widget.indexNmbr==null?   WalletTabBarScreen(indexNmbr: 0): WalletTabBarScreen(indexNmbr: 1),
                  ],
                ),
              ),
            ],
          ),
        )
            :Container(
          height: MediaQuery.of(context).size.height/1,
          child: const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
