import 'package:flutter/material.dart';
import 'package:solveit/widgets/models/category.dart';
import 'design_app_theme.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solveit/widgets/solve.dart';
import 'dart:io';

//Todo means the type of category you want to solve the equation for
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

  //capture image form camera
  Future picCamera() async {
    //wait to get the image from the camera
    var temp = await ImagePicker.pickImage(source: ImageSource.camera);
    //convert the file into a firebase image file to be able to send it to the server
    FirebaseVisionImage camImage = FirebaseVisionImage.fromFile(temp);
    //apply text recognation function on the image file
    TextRecognizer recognizeText = FirebaseVision.instance.textRecognizer();
    //read back the return value of the function from the server side
    VisionText readText = await recognizeText.processImage(camImage);
    

    //all the equation dialog box has one text field except the two equations in two unknowsn
    //so we check the tybe of equation before create the dialog box
    if (widget.todo.type == "Two") {
      //take the first line of the text as first equation
      String equationOne = readText.blocks[0].lines[0].text;
      equationOne = equationOne.toString().toLowerCase(); //convert the outpudata to string 
      TextEditingController controllerOne;
      controllerOne = TextEditingController(text: equationOne);


      //second line as second equation
      String equationTwo = readText.blocks[0].lines[1].text;
      equationTwo = equationTwo.toString().toLowerCase();
      TextEditingController controllerTwo;
      controllerTwo = TextEditingController(text: equationTwo);

      showDialog(
          context: context,
          child: new AlertDialog(
            title: Text("Check your equation"),
            content: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: controllerOne,
                  ),
                  TextField(
                    controller: controllerTwo,
                  )
                ],
              ),
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
                    MaterialPageRoute(  
                        builder: (context) => Solve(
                            equation: controllerOne.text, todo: widget.todo, second: controllerTwo.text)),
                  );
                },
              )
            ],
          ));
    } else {
      String equation = readText.text;
      equation = equation.toString().toLowerCase();
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
                    MaterialPageRoute(
                        builder: (context) => Solve(
                            equation: controller.text, todo: widget.todo)),
                  );
                },
              )
            ],
          ));
    }


  }
  //use a picture from gallery
  Future picgallery() async {
    var temp = await ImagePicker.pickImage(source: ImageSource.gallery);
    FirebaseVisionImage galImage = FirebaseVisionImage.fromFile(temp);
    TextRecognizer recognizeText = FirebaseVision.instance.textRecognizer();
    VisionText readText = await recognizeText.processImage(galImage);

    if (widget.todo.type == "Two") {
      String equationOne = readText.blocks[0].lines[0].text;
      equationOne = equationOne.toString().toLowerCase();
      TextEditingController controllerOne;
      controllerOne = TextEditingController(text: equationOne);

      String equationTwo = readText.blocks[0].lines[1].text;
      equationTwo = equationTwo.toString().toLowerCase();
      TextEditingController controllerTwo;
      controllerTwo = TextEditingController(text: equationTwo);

      showDialog(
          context: context,
          child: new AlertDialog(
            title: Text("Check your equation"),
            content: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: controllerOne,
                  ),
                  TextField(
                    controller: controllerTwo,
                  )
                ],
              ),
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
                    MaterialPageRoute(
                        builder: (context) => Solve(
                            equation: controllerOne.text, todo: widget.todo,second: controllerTwo.text)),
                  );
                },
              )
            ],
          ));
    } else {
      String equation = readText.text;
      equation = equation.toString().toLowerCase();
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
                    MaterialPageRoute(
                        builder: (context) => Solve(
                            equation: controller.text, todo: widget.todo)),
                  );
                },
              )
            ],
          ));
    }
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
                          child: IconButton(
                            icon: Icon(Icons.photo_camera),
                            color: DesignCourseAppTheme.nearlyWhite,
                            iconSize: 24,
                            onPressed: picCamera,
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
