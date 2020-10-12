import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:smart_nation/utils/app_config.dart';
import 'package:smart_nation/utils/colors.dart';
import 'package:smart_nation/utils/common_strings.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key key}) : super(key: key);

  @override
  _NotificationScreenState createState() {
    return _NotificationScreenState();
  }
}

class _NotificationScreenState extends State<NotificationScreen> {
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
    return Scaffold(
      appBar: AppConfig.appBar(CommonStrings.notification, context),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: 2,
          physics: ScrollPhysics(parent: ScrollPhysics()),
          scrollDirection: Axis.vertical,
          itemBuilder: (context,position){
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Neumorphic(
                style: AppConfig.neuStyle,
                boxShape: AppConfig.neuShape,
                child: Container(
                  height: 121.0,
                  width: 374.0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text('There is a disturbing weather condition..Please '
                          ' ensure your Field is met with all precautional'
                          'requirements.',
                        overflow: TextOverflow.clip,
                        maxLines: null,style: TextStyle(
                            fontFamily:AppConfig.firaSans,
                            color: AppColor.black,fontSize: 12.0
                        ),),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}