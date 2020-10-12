import 'package:flutter/material.dart';
import 'package:smart_nation/utils/app_config.dart';
import 'package:smart_nation/utils/colors.dart';
import 'package:smart_nation/utils/common_strings.dart';

class RegisterSuccessScreen extends StatelessWidget {
  RegisterSuccessScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppConfig.appBar('',context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.check_box,color:AppColor.red,size: 30.0,),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(CommonStrings.registerSuccess,textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0,fontFamily: AppConfig.firaSans,
              fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
