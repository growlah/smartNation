import 'package:flutter/material.dart';
import 'package:smart_nation/utils/app_config.dart';
import 'package:smart_nation/utils/assets.dart';
import 'package:smart_nation/utils/colors.dart';
import 'package:smart_nation/utils/common_strings.dart';
import 'package:smart_nation/views/on_boarding.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    AppConfig.hideKeyBoard();
    super.initState();
    Future.delayed(const Duration(seconds: 4), () async {
      Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>OnBoarding()));
    });

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
    body: Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top:100.0),
            child: Center(child: Image.asset(Assets.sntImg)),
          ),
        ),
        Center(child: Text(CommonStrings.inSupportOf),),
        Padding(
          padding: const EdgeInsets.only(top:10.0,bottom: 10.0),
          child: Center(
            child: Image.asset(Assets.snsLogo),
          ),
        ),
        Padding(padding: const EdgeInsets.all(20.0),
          child: Center(child: Text(CommonStrings.poweredBy),),),
        Center(child: Image.asset(Assets.digizen),),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Image.asset(Assets.tcs),
          ),
        )
      ],
    ),
    );
  }
}