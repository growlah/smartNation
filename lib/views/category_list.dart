import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:smart_nation/models/options_list.dart';
import 'package:smart_nation/utils/app_config.dart';
import 'package:smart_nation/utils/assets.dart';
import 'package:smart_nation/utils/colors.dart';
import 'package:smart_nation/utils/common_strings.dart';
import 'package:smart_nation/views/home_screen.dart';

class CategoryList extends StatefulWidget {
  CategoryList({Key key}) : super(key: key);

  @override
  _CategoryListState createState() {
    return _CategoryListState();
  }
}

class _CategoryListState extends State<CategoryList> {
  List<dynamic> optionsList = List<dynamic>();
  int selectedIndex = 0;
  bool isSelected = false;

  @override
  void initState() {
    optionsList = OptionsListResult.getOptionsList();
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
        child: SingleChildScrollView(
          physics: ScrollPhysics(parent: ScrollPhysics()),
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:40.0),
                child: Center(child: Image.asset(Assets.sntImg)),
              ),
              Center(
                child: Text(CommonStrings.moreAbout,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColor.black, fontWeight: FontWeight.bold),
                ),
              ),
              mainView()
            ],
          ),
        ),
      ),
    );
  }

  Widget mainView() {
    return Container(
      child: GridView.builder(
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          itemCount: optionsList.length,
          shrinkWrap: true,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                selectedIndex = index;
                setState(() {
               isSelected=true;
                });

                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                HomeScreen(index)));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Center(
                  child: Neumorphic(
                    boxShape: AppConfig.neuShape,
                    style: AppConfig.neuStyle,
                    child: Container(
                      color: isSelected && index == selectedIndex
                          ? getColor(index, true)
                          : AppColor.normalWhite,
                      height: 150.0,
                      width: 150.0,
                      child: Center(
                        child: Text(
                          optionsList[index].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: isSelected && index == selectedIndex
                                  ? getColor(index, false)
                                  : AppColor.red),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  getColor(int index, bool forCard) {
    return forCard ? AppColor.red : AppColor.whiteColor;
  }
}
