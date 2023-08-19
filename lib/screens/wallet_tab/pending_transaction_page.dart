import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:umrahcar/models/pending_transaction_model.dart';

import '../../service/rest_api_serivice.dart';
import '../../utils/const.dart';
import '../homepage_screen.dart';

class PendingTransactionPage extends StatefulWidget {
  const PendingTransactionPage({super.key});

  @override
  State<PendingTransactionPage> createState() => _PendingTransactionPageState();
}
class _PendingTransactionPageState extends State<PendingTransactionPage> {

  PendingTransactiontModel summaryAgentModel=PendingTransactiontModel();
  getSummaryAgent()async{
    print("userIdId ${userId}");
    var mapData={
      "users_agents_id": userId.toString()
    };
    summaryAgentModel= await DioClient().pendingTransactions(mapData, context);
    if(summaryAgentModel.data !=null ) {
      print("getProfileResponse name: ${summaryAgentModel.data![0].description}");
    }
    setState(() {

    });
  }

  @override
  void initState() {
    getSummaryAgent();
    // TODO: implement initState
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return  Scaffold(
      body: summaryAgentModel.data !=null ?
      ListView.builder(
          itemCount: summaryAgentModel.data!.length,
          itemBuilder: (BuildContext context,i){
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  margin: EdgeInsets.only(left: 20,right: 20),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                      "$imageUrl${summaryAgentModel.data![i].image}"),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 175,
                      child: Text(
                       "Txn Type: ${ summaryAgentModel.data![i].txnType!}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Montserrat-Regular',
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: size.height * 0.005),
                    Text(
                      "amount: ${summaryAgentModel.data![i].amount!}",
                      style: const TextStyle(
                        color: Color(0xFF565656),
                        fontSize: 10,
                        fontFamily: 'Montserrat-Regular',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: size.height * 0.005),
                    Text(
                      "description: ${summaryAgentModel.data![i].description!}",
                      style: const TextStyle(
                        color: Color(0xFF565656),
                        fontSize: 10,
                        fontFamily: 'Montserrat-Regular',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: size.height * 0.005),
                    Text(
                      "date: ${summaryAgentModel.data![i].txnDate!}",
                      style: const TextStyle(
                        color: Color(0xFF565656),
                        fontSize: 10,
                        fontFamily: 'Montserrat-Regular',
                        fontWeight: FontWeight.w500,
                      ),
                    ),SizedBox(height: size.height * 0.005),
                    Text(
                      "User Agent Id: ${summaryAgentModel.data![i].usersAgentsId!}",
                      style: const TextStyle(
                        color: Color(0xFF565656),
                        fontSize: 10,
                        fontFamily: 'Montserrat-Regular',
                        fontWeight: FontWeight.w500,
                      ),
                    ),SizedBox(height: size.height * 0.005),
                    Text(
                      "User Agent Account Id: ${summaryAgentModel.data![i].usersAgentsAccountsId!}",
                      style: const TextStyle(
                        color: Color(0xFF565656),
                        fontSize: 10,
                        fontFamily: 'Montserrat-Regular',
                        fontWeight: FontWeight.w500,
                      ),
                    ),



                  ],
            ),
                SizedBox(height: size.height * 0.02),
                Container(
                  width: size.width * 0.2,
                  height: size.height * 0.024,
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    summaryAgentModel.data![i].status!,
                    style: const TextStyle(
                      color: Color(0xFF0066FF),
                      fontSize: 12,
                      fontFamily: 'Montserrat-Regular',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

              ],
        ),
          ]
            );
      }):const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Padding(
            padding: EdgeInsets.only(left: 100),
            child: Text(
              'No Pending Transaction Found',
              style: TextStyle(
                color: Color(0xFF565656),
                fontSize: 12,

                fontFamily: 'Montserrat-Regular',
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      )
    );
  }
}
