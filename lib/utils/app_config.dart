import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_nation/utils/assets.dart';
import 'package:smart_nation/utils/colors.dart';

class AppConfig {
  static String firaSans = 'FiraSans-Regular';

  static buildCounter() {
    return (BuildContext context,
            {int currentLength, int maxLength, bool isFocused}) =>
        null;
  }

  static showToast(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.grey);
  }

  static void hideKeyBoard() =>
      SystemChannels.textInput.invokeMethod('TextInput.hide');
  static NeumorphicStyle neuStyle = NeumorphicStyle(
      color: Colors.grey[100],
      border: NeumorphicBorder(color: AppColor.whiteColor, width: 2.0));
  static NeumorphicBoxShape neuShape =
      NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(10.0)));

  static divider() {
    return Divider(
      height: 2.0,
      color: Colors.grey,
    );
  }

  static appBar(String title, BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: AppColor.whiteColor,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: AppColor.black,
          size: 24,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: AppConfig.firaSans,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: AppColor.black),
      ),
    );
  }

  static cardImageView() {
    return Center(
      child: Neumorphic(
        style: AppConfig.neuStyle,
        boxShape: AppConfig.neuShape,
        child: Container(
          width: 374.0,
          height: 180.0,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Neumorphic(
                boxShape: AppConfig.neuShape,
                child: Image.asset(
                  Assets.sample,
                  fit: BoxFit.cover,
                )),
          ),
        ),
      ),
    );
  }

  static normalButton(String text,int pos) {
    return Neumorphic(
      style: AppConfig.neuStyle,
      boxShape: AppConfig.neuShape,
      child: Container(
        width: 174.0,
        height: 54.0,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              pos==1||pos==2?
             Colors.black: Color.fromRGBO(237,26,59,1),Colors.white
          ,
        ])),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: AppColor.black,
                fontFamily: AppConfig.firaSans,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
