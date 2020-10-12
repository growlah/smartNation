import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:smart_nation/utils/app_config.dart';
import 'package:smart_nation/utils/assets.dart';
import 'package:smart_nation/utils/colors.dart';
import 'package:smart_nation/utils/common_strings.dart';
import 'package:smart_nation/views/register_success.dart';

class InnerEvents extends StatefulWidget {
  InnerEvents(this.title) : super();
  String title;
  @override
  _InnerEventsState createState() {
    return _InnerEventsState();
  }
}

class _InnerEventsState extends State<InnerEvents> {
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
      appBar: AppConfig.appBar(widget.title, context),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(parent: ScrollPhysics()),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Neumorphic(
                            style:AppConfig.neuStyle,
                            boxShape: AppConfig.neuShape,
                            child: Container(
                                height: 181.0,
                                width: 374.0,
                                child: Image.asset(Assets.sample,fit: BoxFit.cover))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: Wrap(
                            direction: Axis.horizontal,
                            children: <Widget>[
                              Text('Building Robots, Building skills and ready,'
                                  'set, Robot race',
                                overflow: TextOverflow.clip,softWrap: true,
                                style: TextStyle(
                                    fontFamily:AppConfig.firaSans,
                                  fontSize: 16.0,fontWeight: FontWeight.bold),),
                              Container(
                                decoration:BoxDecoration(
                                    color: AppColor.lightPink,
                                  borderRadius: BorderRadius.circular(15.0)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text('30 pts',
                                    style: TextStyle(
                                        fontFamily:AppConfig.firaSans,
                                        fontSize: 16.0,fontWeight: FontWeight.bold),),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:8.0,bottom: 8.0,
                                left: 5.0),
                                child: ClipOval(child:
                                Container(color: AppColor.blue,height: 5.0,width: 5.0,)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text('Zoom',
                                  style: TextStyle(
                                      fontFamily:AppConfig.firaSans,
                                      fontSize: 16.0,fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("9 Sep , 8pm - 9pm > For kids aged 7 to 9",
                          style: TextStyle(
                              fontFamily:AppConfig.firaSans,
                              fontSize: 14.0),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(CommonStrings.details,
                          style: TextStyle(
                              fontFamily:AppConfig.firaSans,
                             fontSize: 16.0,fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:10.0,top: 10.0),
                        child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing'
                            'elit. Facilisis lectus at a vulputate pellentesque'
                            'aliquet velit odio nullam. Mattis ut est ut enim.'
                            'Nullam lobortis dolor quis non mauris, dui sed'
                            'nunc quam. Gravida commodo vel at dignissim'
                            'integer.',
                          style: TextStyle(
                              fontFamily:AppConfig.firaSans,
                             fontSize: 16.0),),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                        RegisterSuccessScreen()));
                  },
                  child: buyButton())
            ],
          ),
        ),
      ),
    );
  }
  Widget buyButton() {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
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
                  fontFamily:AppConfig.firaSans,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),),
            ),
          ),
        ),
      ),
    );
  }
}