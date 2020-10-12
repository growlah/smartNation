import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:smart_nation/utils/app_config.dart';
import 'package:smart_nation/utils/assets.dart';
import 'package:smart_nation/utils/colors.dart';
import 'package:smart_nation/utils/common_strings.dart';
import 'package:smart_nation/utils/date_utils.dart';
import 'package:smart_nation/views/child_youth_young.dart';

class MainView extends StatefulWidget {
  MainView(this.pos) : super();
  final int pos;

  @override
  _MainViewState createState() {
    return _MainViewState();
  }
}

class _MainViewState extends State<MainView> {
  bool isSelected = false;
  int selectedIndex = 0;
  TextEditingController _searchController;

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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(parent: ScrollPhysics()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Center(
                  child: Container(
                      width: 153.0,
                      height: 100.0,
                      child: Image.asset(Assets.sntImg))),
            ),
            widget.pos == 3
                ? Center(
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    CommonStrings.explore,
                    style: TextStyle(
                        color: AppColor.black,
                        fontWeight: FontWeight.bold),
                  )),
            )
                : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                CommonStrings.selectCategory,
                style: TextStyle(
                    color: AppColor.black, fontWeight: FontWeight.bold),
              ),
            ),
            widget.pos == 3 ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: Neumorphic(
                boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.all(Radius.circular(10.0))),
                style: NeumorphicStyle(depth: -8,
                    shadowDarkColor: Colors.black54,
                    lightSource: LightSource.topLeft,
                    color: Colors.white,
                    intensity: 0.86,
                    surfaceIntensity: 0.5),
                child: Container(
                  height: 54.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: TextField(
                      controller: _searchController,
                      textAlign: TextAlign.start,
                      maxLength: 10,
                      buildCounter: (BuildContext context,
                          {int currentLength,
                            int maxLength,
                            bool isFocused}) =>
                      null,
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.search, color: Colors.grey,),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Search ',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.only(top: 20.0, left: 10.0
                              , right: 10.0),
                          border: InputBorder.none
                      ),
                    ),
                  ),
                ),
              ),
            ) : Container(),
            getTopCategory(),
            widget.pos == 3 ? trending() : upComing(),
            widget.pos == 0 ? smallCards() : widget.pos == 1 ? largeCards()
                : widget.pos == 3 ? mediumCards() : Container()
          ],
        ),
      ),
    );
  }

  Widget getTopCategory() {
    return Container(
      height: 150.0,
      child: ListView.builder(
          physics: ScrollPhysics(parent: ScrollPhysics()),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, position) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  isSelected = true;
                });
                selectedIndex = position;
                navigate(position);
              },
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 20.0),
                    child: Neumorphic(
                        style: AppConfig.neuStyle,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.all(Radius.circular(25.0))),
                        child: Container(
                            height: 93.0,
                            width: 93.0,
                            color: isSelected
                                ? getColorForContainer(position)
                                : AppColor.whiteColor,
                            child: Center(
                              child: Image.asset(
                                widget.pos == 3 ? getCodingImage(position) :
                                getImage(position),
                                color: isSelected
                                    ? getColor(position)
                                    : AppColor.red,
                              ),
                            ))),
                  ),
                  Flexible(
                    child: Container(
                      width: 100.0,
                      height: 50.0,
                      child: Text(
                        widget.pos == 3 ? getCodingText(position) : getText(
                            position),
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: AppConfig.firaSans),
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }

  getImage(int position) {
    switch (position) {
      case 0:
        return Assets.search;
        break;
      case 1:
        return Assets.people;
        break;
      case 2:
        return Assets.newsFeed;
        break;
    }
  }

  getColor(int position) {
    return position == selectedIndex ? AppColor.whiteColor : AppColor.red;
  }

  getColorForContainer(int position) {
    return position == selectedIndex ? AppColor.red : AppColor.whiteColor;
  }

  getText(int position) {
    switch (position) {
      case 0:
        return CommonStrings.learn;
        break;
      case 1:
        return CommonStrings.coCreate;
        break;
      case 2:
        return CommonStrings.news;
        break;
    }
  }

  getCodingText(int position) {
    switch (position) {
      case 0:
        return CommonStrings.child;
        break;
      case 1:
        return CommonStrings.adults;
        break;
      case 2:
        return CommonStrings.senior;
        break;
    }
  }

  Widget upComing() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              CommonStrings.upcomingEvent,
              style:
              TextStyle(color: AppColor.black, fontWeight: FontWeight.bold),
            ),
            Image.asset(Assets.filter, height: 22.0, width: 21.0,)
          ],
        ),
      ),
    );
  }

  Widget smallCards() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: ScrollPhysics(parent: ScrollPhysics()),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: Padding(
            padding:
            const EdgeInsets.only(left: 20.0, right: 10.0, bottom: 20.0),
            child: Neumorphic(
              boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.all(Radius.circular(20.0))),
              child: Container(
                height: 118.0,
                width: 374.0,
                color: AppColor.whiteColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Neumorphic(
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.all(Radius.circular(10.0))),
                          child: Container(
                              height: 94.5,
                              width: 92.71,
                              child: Image.asset(Assets.sample,
                                  fit: BoxFit.fill))),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(
                                  top: 32.0, bottom: 11.0),
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Tech@play,',
                                      style: TextStyle(
                                          fontFamily: AppConfig.firaSans,
                                          color: AppColor.black),
                                    ),
                                    Text('>For kids',
                                        style: TextStyle(
                                            fontFamily: AppConfig.firaSans,
                                            color: AppColor.grey))
                                  ],
                                ),
                              )),
                          Text(
                            'Wed 23, Sep 2020',
                            style: TextStyle(
                                fontFamily: AppConfig.firaSans,
                                color: AppColor.grey),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Neumorphic(
                        style: AppConfig.neuStyle,
                        boxShape: NeumorphicBoxShape.circle(),
                        child: Container(
                            color: AppColor.whiteColor,
                            height: 38.0,
                            width: 38.0,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: AppColor.red,
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget largeCards() {
    return ListView.builder(
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
    );
  }

  getCodingImage(int position) {
    switch (position) {
      case 0:
        return Assets.children;
        break;
      case 1:
        return Assets.adult;
        break;
      case 2:
        return Assets.senoir;
        break;
    }
  }

  Widget trending() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              CommonStrings.trending,
              style:
              TextStyle(color: AppColor.black, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                DateUtils.monthDateYear.format(DateTime.now()).toString(),
                style: TextStyle(color: AppColor.grey),),
            )
          ],
        ),
      ),
    );
  }

  Widget mediumCards() {
    return Container(
      height: 220.0,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          physics: ScrollPhysics(parent: ScrollPhysics()),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Neumorphic(
                  style: AppConfig.neuStyle,
                  boxShape: AppConfig.neuShape,
                  child: Container(
                    height: 206.0,
                    width: 296.0,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Neumorphic(
                          boxShape: AppConfig.neuShape,
                          child: Image.asset(
                            Assets.sample, fit: BoxFit.cover,)),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  void navigate(int position) {
    if (position == 0 && widget.pos == 3) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ChildYouthYoung()));
    }
  }
}
