import 'dart:io';
import 'package:camera/new/src/camera_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_nation/utils/app_config.dart';
import 'package:smart_nation/utils/assets.dart';
import 'package:smart_nation/utils/colors.dart';
import 'package:smart_nation/utils/common_strings.dart';

class MyProfile extends StatefulWidget {
  MyProfile({Key key}) : super(key: key);

  @override
  _MyProfileState createState() {
    return _MyProfileState();
  }
}

class _MyProfileState extends State<MyProfile> {
  bool hasImage = false;
  CameraController controller;
  String imagePath = '';
  File imageFile;

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
      appBar: AppConfig.appBar(CommonStrings.myProfile, context,),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(parent: ScrollPhysics()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    changeImage();
                  },
                  child: Neumorphic(
                    style: AppConfig.neuStyle,
                    boxShape: NeumorphicBoxShape.circle(),
                    child: Container(
                      height: 120.0,
                      width: 120.0,
                      child: imageFile != null
                          ? Image.file(
                        imageFile,
                        fit: BoxFit.cover,
                      )
                          : Image.asset(Assets.manIcon),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                'Name',
                style: TextStyle(
                    color: AppColor.black,
                    fontFamily: AppConfig.firaSans,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          buttons(),
          Padding(padding: const EdgeInsets.only(top:40.0,bottom: 20.0,
          left: 10.0,right: 10.0),
          child:   AppConfig.divider(),),
            Padding(
              padding: const EdgeInsets.only(left:20.0),
              child: Text(CommonStrings.upcomingEvents,style: TextStyle(
                fontFamily: AppConfig.firaSans,fontWeight: FontWeight.bold,
                fontSize: 16.0
              ),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: getList(),
            )
          ],
        ),
      ),
    );
  }

  void changeImage() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                onTap: () {
                  seeImage();
                },
                title: Center(
                    child: Text(
                      CommonStrings.view,
                      style: TextStyle(
                          fontFamily: AppConfig.firaSans,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              AppConfig.divider(),
              ListTile(
                onTap: () {
                  openCamera();
                },
                title: Center(
                    child: Text(CommonStrings.camera,
                        style: TextStyle(
                            fontFamily: AppConfig.firaSans,
                            fontWeight: FontWeight.bold))),
              ),
              AppConfig.divider(),
              ListTile(
                onTap: () {
                  openGallery();
                },
                title: Center(
                    child: Text(CommonStrings.gallery,
                        style: TextStyle(
                            fontFamily: AppConfig.firaSans,
                            fontWeight: FontWeight.bold))),
              ),
            ],
          );
        });
  }

  openCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = image;
    });
    Navigator.pop(context);
  }

  openGallery() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  seeImage() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              height: 300.0,
              width: 200.0,
              child: imageFile != null
                  ? Image.file(
                imageFile,
                fit: BoxFit.cover,
              )
                  : Image.asset(Assets.manIcon),
            ),
          );
        });
  }

  Widget buttons() {
    return   Padding(
      padding: const EdgeInsets.only(top:20.0,left: 10.0,right: 10.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Neumorphic(
              style: AppConfig.neuStyle,
              boxShape: AppConfig.neuShape,
              child: Container(
                height: 45.0,
                width: 151.0,
                color:AppColor.whiteColor,
                child: Center(
                  child: Text(
                    '200 Points Earned',
                    style: TextStyle(
                        fontFamily: AppConfig.firaSans, color:AppColor.red),
                  ),
                ),
              ),
            ),
            Neumorphic(
              style: AppConfig.neuStyle,
              boxShape: AppConfig.neuShape,
              child: Container(
                height: 45.0,
                width: 151.0,
                color: AppColor.whiteColor,
                child: Center(
                  child: Text(
                    'Reedem Now',
                    style: TextStyle(
                        fontFamily: AppConfig.firaSans, color:AppColor.red),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getList() {
    return ListView.builder(
        itemCount: 1,
        shrinkWrap: true,
         scrollDirection: Axis.vertical,
        physics: ScrollPhysics(parent: ScrollPhysics()),
        itemBuilder: (context,index){
          return AppConfig.cardImageView();
        });
  }


}
