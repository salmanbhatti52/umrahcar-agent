import 'package:flutter/material.dart';
import 'package:umrahcar/utils/colors.dart';
import 'package:umrahcar/widgets/top_boxes.dart';
import 'package:umrahcar/widgets/wallet_list.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
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
                        bignoimagebox('30,000', 'Total Deposit', context),
                        SizedBox(width: size.width * 0.04),
                        bignoimageredbox('15,000', 'Remaining', context),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        'Transaction History',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat-Regular',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Container(
                      color: Colors.transparent,
                      height: size.height * 0.579,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: walletList(context),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
