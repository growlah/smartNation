import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:smart_nation/controller/register_controller.dart';
import 'package:smart_nation/utils/app_config.dart';
import 'package:smart_nation/utils/assets.dart';
import 'package:smart_nation/utils/colors.dart';
import 'package:smart_nation/utils/common_strings.dart';
import 'package:smart_nation/views/category_list.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() {
    return _RegisterScreenState();
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isClicked=false;
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
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
              child: Center(child: Image.asset(Assets.sntImg)),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Neumorphic(
                boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.all(Radius.circular(10.0))),
                style: NeumorphicStyle(
                    depth: -8,
                    shadowDarkColor: Colors.black54,
                    lightSource: LightSource.topLeft,
                    color: Colors.white,
                    intensity: 0.86,
                    surfaceIntensity: 0.5),
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: TextField(
                      controller: RegisterController.nameController,
                      textAlign: TextAlign.start,
                      maxLength: 10,
                      buildCounter: (BuildContext context,
                              {int currentLength,
                              int maxLength,
                              bool isFocused}) =>
                          null,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter Name',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding:
                              EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Neumorphic(
                boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.all(Radius.circular(10.0))),
                style: NeumorphicStyle(
                    depth: -8,
                    shadowDarkColor: Colors.black54,
                    lightSource: LightSource.topLeft,
                    color: Colors.white,
                    intensity: 0.86,
                    surfaceIntensity: 0.5),
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: TextField(
                      controller: RegisterController.emailController,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter Email Address',
                          hintStyle: TextStyle(color: AppColor.grey),
                          contentPadding:
                              EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(child: Container(),),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          isClicked=!isClicked;
                        });
                      },
                      child: Neumorphic(
                        style: NeumorphicStyle(
                            depth: -8,
                            shadowDarkColor: Colors.black54,
                            lightSource: LightSource.topLeft,
                            color: Colors.white,
                            intensity: 0.86,
                            surfaceIntensity: 0.5),
                        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(5.0))),
                        child: Container(
                          color: Colors.transparent,
                          height: 30.0,width: 30.0,
                          child: isClicked?
                          Center(child: Icon(Icons.check,color: Colors.red,size: 20.0,)):Container(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(CommonStrings.pdpa,
                      style: TextStyle(color:  AppColor.grey),),
                    )
                  ],
                ),
              ),
            ),
            registerBtn()
          ],
        ),
      ),
    );
  }

  Widget  registerBtn() {
    return GestureDetector(
      onTap: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CategoryList()));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
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
}
