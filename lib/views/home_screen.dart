import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:smart_nation/utils/app_config.dart';
import 'package:smart_nation/utils/assets.dart';
import 'package:smart_nation/utils/colors.dart';
import 'package:smart_nation/views/main_view.dart';
import 'package:smart_nation/views/notification.dart';
import 'package:smart_nation/views/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen(this.index) : super();

  final int index;

  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  int currentIndex = 1;
  static TabController tabController;
  @override
  void initState() {
    tabController = TabController(
        length: 3, vsync:this, initialIndex: 1);
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
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          backgroundColor: AppColor.whiteColor,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              tabController.index=index;
            });
          },
          items: [
            BottomNavigationBarItem(
                title: Text(''),
                icon: Column(
                  children: <Widget>[
                    Neumorphic(
                      style: getStyle(0),
                      boxShape: AppConfig.neuShape,
                      child: Container(
                          color: AppColor.whiteColor,
                          height: 50.0,
                          width: 50.0,
                          child: Image.asset(Assets.bell)),
                    ),
                    currentIndex==0? getContainer():Container()
                  ],
                )),
            BottomNavigationBarItem(
                title: Text(''),
                icon: Column(
                  children: <Widget>[
                    Neumorphic(
                      style: getStyle(1),
                      boxShape: AppConfig.neuShape,
                      child: Container(
                          color: AppColor.whiteColor,
                          height: 50.0,
                          width: 50.0,
                          child: Image.asset(Assets.homeIcon)),
                    ),
                   currentIndex==1? getContainer():Container()
                  ],
                )),
            BottomNavigationBarItem(
                title: Text(''),
                icon: Column(
                  children: <Widget>[
                    Neumorphic(
                      style: getStyle(2),
                      boxShape: AppConfig.neuShape,
                      child: Container(
                          color: AppColor.whiteColor,
                          height: 50.0,
                          width: 50.0,
                          child: Image.asset(Assets.profile)),
                    ),
                    currentIndex==2? getContainer():Container()
                  ],
                )),
          ]),
      body: Padding(
        padding: const EdgeInsets.only(top:20.0),
        child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: tabController,
            children: [NotificationScreen(), MainView(widget.index),MyProfile()]),
      ),
    );
  }

  getStyle(int position) {
    return position == currentIndex
        ? NeumorphicStyle(depth: -8)
        : AppConfig.neuStyle;
  }

  Widget getContainer() {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Container(height: 5.0,width:100.0,color: AppColor.divider,),
    );
  }
}
