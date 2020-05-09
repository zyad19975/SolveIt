import 'package:flutter/material.dart';
import 'package:solveit/widgets/models/category.dart';
import 'design_app_theme.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solveit/widgets/solve.dart';
import 'dart:io';

class DetailScreen extends StatefulWidget {
  // Declare a field that holds the Todo.
  final Category todo;

  // In the constructor, require a Todo.
  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  File pickedimage;

  Future picCamera() async {
    var temp = await ImagePicker.pickImage(source: ImageSource.camera);
    FirebaseVisionImage camImage = FirebaseVisionImage.fromFile(temp);
    TextRecognizer recognizeText = FirebaseVision.instance.textRecognizer();
    VisionText readText = await recognizeText.processImage(camImage);
    print(readText.text);
  }

  Future picgallery() async {
    String equation = "x+5 = 12";
    TextEditingController controller;
    controller = TextEditingController(text: equation);

    showDialog(
        context: context,
        child: new AlertDialog(
          title: Text("Check your equation"),
          content: TextField(
            controller: controller,
          ),
          actions: <Widget>[
            new FlatButton(
              color: DesignCourseAppTheme.nearlyBlue,
              child: new Text(
                'Ok',
                style: TextStyle(
                  color: DesignCourseAppTheme.darkerText,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Solve(equation:controller.text,todo:widget.todo)),
                );
              },
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'SOLVE IT!',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 27,
            letterSpacing: 0.27,
            color: DesignCourseAppTheme.darkerText,
          ),
        ),
        iconTheme: IconThemeData(
          color: DesignCourseAppTheme.nearlyBlue,
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 18, right: 16),
                child: Text(
                  widget.todo.title,
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
              AspectRatio(
                aspectRatio: 1.2,
                child: Image.asset(widget.todo.imagePath),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, bottom: 10, top: 15),
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
                                color:
                                    DesignCourseAppTheme.grey.withOpacity(0.2)),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.photo_library),
                            color: DesignCourseAppTheme.nearlyWhite,
                            iconSize: 24,
                            onPressed: picgallery,
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
                                color: DesignCourseAppTheme.nearlyBlue
                                    .withOpacity(0.5),
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
                  widget.todo.description,
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
          )
        ],
      ),
    );
  }
}
