import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:smart_nation/utils/app_config.dart';
import 'package:smart_nation/utils/assets.dart';
import 'package:smart_nation/utils/colors.dart';
import 'package:smart_nation/utils/common_strings.dart';
import 'package:smart_nation/views/category_list.dart';
import 'package:smart_nation/views/register_screen.dart';
class OnBoarding extends StatefulWidget {
  OnBoarding({Key key}) : super(key: key);

  @override
  _OnBoardingState createState() {
    return _OnBoardingState();
  }
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  void initState() {
    super.initState();
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top:100.0),
                child: Center(child: Image.asset(Assets.sntImg)),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Text('Create an account to earn points'
                'and gain access to exclusive content!',
                style: TextStyle(color: AppColor.black,fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              softWrap: true,),
            ),
          ),
            registerBtn(),
            skipBtn(),
          ],
        ),
      ),
    );
  }

 Widget  registerBtn() {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>
            RegisterScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.only(top:15.0,bottom: 15.0),
        child: Neumorphic(
          style: AppConfig.neuStyle,
          boxShape: AppConfig.neuShape,
          child: Container(
            height: 55.0,
            width: 374.0,
            color: AppColor.red,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(CommonStrings.register, style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),),
              ),
            ),
          ),
        ),
      ),
    );
  }

  skipBtn() {
    return GestureDetector(
      onTap: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CategoryList()));
      },
      child: Padding(
        padding: const EdgeInsets.only(top:15.0,bottom: 15.0),
        child: Neumorphic(
          style: AppConfig.neuStyle,
          boxShape: AppConfig.neuShape,
          child: Container(
            height: 55.0,
            width: 374.0,
            color: AppColor.whiteColor,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(CommonStrings.skipContinue, style: TextStyle(
                    color: AppColor.red,
                    fontWeight: FontWeight.bold
                ),),
              ),
            ),
          ),
        ),
      ),
    );
  }
}