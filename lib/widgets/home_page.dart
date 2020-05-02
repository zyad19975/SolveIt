import 'package:solveit/widgets/eguation_category_selected.dart';
import 'package:solveit/widgets/popular_course_list_view.dart';
import 'package:solveit/main.dart';
import 'package:flutter/material.dart';

import 'design_course_app_theme.dart';

class DesignCourseHomeScreen extends StatefulWidget {
  @override
  _DesignCourseHomeScreenState createState() => _DesignCourseHomeScreenState();
}

class _DesignCourseHomeScreenState extends State<DesignCourseHomeScreen> {
  CategoryType categoryType = CategoryType.ui;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DesignCourseAppTheme.nearlyWhite,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            getAppBarUI(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      getUnknowntype(),
                      Flexible(
                        child: getEquationsTypes(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getUnknowntype() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 18, right: 16),
          child: Text(
            'Use Automate Detection',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: DesignCourseAppTheme.darkerText,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(right: 8),
                  height: 48,
                  child: Container(
                    decoration: BoxDecoration(
                      color: DesignCourseAppTheme.nearlyBlue,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                      border: Border.all(
                          color: DesignCourseAppTheme.grey.withOpacity(0.2)),
                    ),
                    child: Icon(
                      Icons.photo_library,
                      color: DesignCourseAppTheme.nearlyWhite,
                      size: 24,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: DesignCourseAppTheme.nearlyBlue,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color:
                              DesignCourseAppTheme.nearlyBlue.withOpacity(0.5),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.photo_camera,
                      color: DesignCourseAppTheme.nearlyWhite,
                      size: 24,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Text(
            'If you dont know what is the type of your equation dont worry You can choose between two options first from gallery, second capture an image by camera',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w100,
              fontSize: 14,
              letterSpacing: 0.27,
              color: DesignCourseAppTheme.nearlyBlue,
            ),
          ),
        )
      ],
    );
  }

  Widget getEquationsTypes() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Choose Your Equation Type',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 25,
              letterSpacing: 0.27,
              color: DesignCourseAppTheme.darkerText,
            ),
          ),
          Flexible(
            child: PopularCourseListView(
              callBack: () {
                moveTo();
              },
            ),
          )
        ],
      ),
    );
  }

  void moveTo() {
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => CourseInfoScreen(),
      ),
    );
  }

  Widget getAppBarUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'SOLVE IT!',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 44,
                    letterSpacing: 0.27,
                    color: DesignCourseAppTheme.darkerText,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 80,
            height: 80,
            child: Image.asset('assets/images/userImage.png'),
          )
        ],
      ),
    );
  }
}

enum CategoryType {
  ui,
  coding,
  basic,
}
