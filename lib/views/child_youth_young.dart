import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:smart_nation/utils/app_config.dart';
import 'package:smart_nation/utils/assets.dart';
import 'package:smart_nation/utils/colors.dart';
import 'package:smart_nation/utils/common_strings.dart';
import 'package:smart_nation/utils/date_utils.dart';
import 'package:smart_nation/views/inner_events.dart';

class ChildYouthYoung extends StatefulWidget{
  ChildYouthYoung():super();
   
  @override
  _ChildYouthYoungState createState(){
    return _ChildYouthYoungState();
  }
}
class _ChildYouthYoungState extends State{
  int select=0;
  bool dateSelected=false;
  TextEditingController _eventController;
  @override
  void initState() {
    super.initState();
    _handleNewDate(DateUtils.normalFormat.parse(DateTime.now().toString()),false);
    // _selectedEvents = _events[_selectedDay] ?? [];
  }


  void _handleNewDate(date,bool fromDateSelected) {
    dateSelected=fromDateSelected;
    setState(() {
      _selectedDay = date;
      _selectedEvents = _events[_selectedDay] ?? [];
    });
    print(_selectedEvents);
  }

  List _selectedEvents;
  DateTime _selectedDay;

  final Map<DateTime, List> _events = {
    DateTime(2020, 10, 7): [
      {'name': 'Event A', 'isDone': true},
    ],
    DateTime(2020, 10, 9): [
      {'name': 'Event A', 'isDone': true},
      {'name': 'Event B', 'isDone': true},
    ],
    DateTime(2020, 10, 10): [
      {'name': 'Event A', 'isDone': true},
      {'name': 'Event B', 'isDone': true},
    ],
    DateTime(2020, 10, 13): [
      {'name': 'Event A', 'isDone': true},
      {'name': 'Event B', 'isDone': true},
      {'name': 'Event B', 'isDone': true},
      {'name': 'Event B', 'isDone': true},
      {'name': 'Event B', 'isDone': true},
      {'name': 'Event B', 'isDone': true},
      {'name': 'Event B', 'isDone': true},
      {'name': 'Event B', 'isDone': true},
      {'name': 'Event B', 'isDone': true},
    ],
    DateTime(2020, 10, 25): [
      {'name': 'Event A', 'isDone': true},
      {'name': 'Event B', 'isDone': true},
      {'name': 'Event C', 'isDone': false},
    ],
    DateTime(2020, 10, 6): [
      {'name': 'Event A', 'isDone': false},
    ],
  };
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: AppColor.whiteColor,
      appBar:AppConfig.appBar(CommonStrings.childParents, context),
      body: Column(
        children: <Widget>[
          Container(
            child: Calendar(
              startOnMonday: false,
              weekDays: ["S","M", "T", "W", "T","F", "S"],
              events: _events,
              onRangeSelected: (range) =>
                  print("Range is ${range.from}, ${range.to}"),
              onDateSelected: (date) => _handleNewDate(date,true),
              isExpanded: _selectedEvents!=null&&_selectedEvents.isNotEmpty,
              isExpandable: true,
              hideTodayIcon: true,
              eventDoneColor: AppColor.green,
              selectedColor: AppColor.pink,
              todayColor: AppColor.blue,
              eventColor: AppColor.grey,
              dayOfWeekStyle: TextStyle(
                  color: AppColor.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 11),
            ),
          ),
          _buildEventList(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: normalButtons(),
          ),
          Visibility(
              visible: select==0,
              child: loadEventsList()),
          Visibility(
            visible: select==1,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: techButtons1(),
            ),
          ),
          Visibility(
            visible: select==1,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: techButtons2(),
            ),
          ),
          Visibility(
            visible:dateSelected,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: FloatingActionButton(
                  onPressed: (){
                  showAlertDialog();
                },
                child: Icon(Icons.add,color:AppColor.whiteColor,),),
              ),
            ),
          )
        ],
      ),
    );
  }


  Widget _buildEventList() {
    return Container(
      child: _selectedEvents!=null&&_selectedEvents.isNotEmpty?ListView.builder(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(parent: ScrollPhysics()),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.5, color: Colors.black12),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
          child: ListTile(
            title: Text(_selectedEvents[index]['name'].toString()),
            onTap: () {},
          ),
        ),
        itemCount: _selectedEvents.length,
      ):Visibility(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(child: Text(CommonStrings.noEvents,style: TextStyle(
            fontFamily: AppConfig.firaSans,color: AppColor.red,fontSize: 12.0
          ),textAlign: TextAlign.center,),),
        ),
      ),
    );
  }

  void showAlertDialog() {
    showDialog(context: context,barrierDismissible: true,
    builder: (context)=>AlertDialog(
      title: TextField(
        decoration: InputDecoration(
          hintText: CommonStrings.enterEvent
        ),
        controller: _eventController,
      ),
      actions: <Widget>[
        FlatButton(onPressed: (){
          _eventController.clear();
          Navigator.pop(context);
        }, child:Text(CommonStrings.save))
      ],
    ));
  }

  Widget normalButtons() {
    return Container(
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: (){
              setState(() {
                select=0;
              });
            },
            child: Neumorphic(
              style: AppConfig.neuStyle,
              boxShape: AppConfig.neuShape,
              child: Container(
                width: 177.0,
                height: 41.0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(CommonStrings.currentEvent,style:TextStyle(
                    color:select==0?AppColor.black:AppColor.grey,fontFamily: AppConfig.firaSans,
                    fontSize: 16.0
                    ),),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                select=1;
              });
            },
            child: Neumorphic(
              style: AppConfig.neuStyle,
              boxShape: AppConfig.neuShape,
              child: Container(
                width: 177.0,
                height: 41.0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(CommonStrings.viewSeries,style:TextStyle(
                      color:select==1?AppColor.black:AppColor.grey,fontFamily: AppConfig.firaSans,
                      fontSize: 16.0
                    ),),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

 Widget techButtons2() {
   return Container(
     height: 50.0,
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: <Widget>[
         GestureDetector(
           onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>
                 InnerEvents(CommonStrings.techPlay)));
           },
           child: AppConfig.normalButton(CommonStrings.techPlay,0),
         ),
         GestureDetector(
           onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>
                 InnerEvents(CommonStrings.funWithTech)));
           },
           child:  AppConfig.normalButton(CommonStrings.funWithTech,1),
         )
       ],
     ),
   );
 }
 Widget techButtons1() {
   return Container(
     height: 50.0,
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: <Widget>[
         GestureDetector(
           onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>
             InnerEvents(CommonStrings.techUpSized)));
           },
           child:  AppConfig.normalButton(CommonStrings.techUpSized,2),
         ),
         GestureDetector(
           onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>
                 InnerEvents(CommonStrings.techTalk)));
           },
           child:  AppConfig.normalButton(CommonStrings.techTalk,3),
         )
       ],
     ),
   );
 }

  Widget loadEventsList() {
    return Expanded(
      child: ListView.builder(
        physics: ScrollPhysics(parent: ScrollPhysics()),
        itemCount: 5,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, position) {
          return Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            child: AppConfig.cardImageView(),
          );
        },
      ),
    );
  }

}