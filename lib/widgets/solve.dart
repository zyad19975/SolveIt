import 'dart:math';

import 'package:solveit/widgets/models/category.dart';
import 'package:solveit/main.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
import 'package:solveit/widgets/eguation_category_selected.dart';
import 'design_app_theme.dart';

class Solve extends StatelessWidget {
  final Category todo;
  final String equation;
  final String second;

  Solve({Key key, @required this.equation, @required this.todo, this.second})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Text(solving(equation, second, todo.type)),
      ),
    );
  }
}


//check the equation type before solving it
String solving(String eq, String eq2, String type) {
  switch (type) {
    case 'Basic':
      {
        return basic(eq);
      }
      break;

    case 'Two':
      {
        return two(eq, eq2);
      }
      break;

    case 'Second':
      {
        return second(eq);
      }
      break;

    case 'Diff':
      {
        return diff(eq);
      }
      break;
  }
}

String basic(String eq) {
  bool valid = false;
  String ans, left, right;
  Parser p = Parser();
  Variable x = Variable('x');

  for (int i = 0; i < eq.length; i++) {
    var char = eq[i];
    if (char == '=') {
      valid = true;
      left = eq.substring(0, i);
      right = eq.substring(i + 1, eq.length);

      Expression expLeft = p.parse(left);
      Expression expRight = p.parse(right);

      print(expLeft.simplify());
      print(expRight.simplify());
      for (var i = -100; i < 100; i++) {
        ContextModel cm = ContextModel()..bindVariable(x, Number(i));
        double evalLeft = expLeft.evaluate(EvaluationType.REAL, cm);
        double evalRight = expRight.evaluate(EvaluationType.REAL, cm);
        if (evalLeft == evalRight) {
          ans = "X = " + i.toString();
          break;
        }
        ans = "Sorry we couldn't SolveIt! we will do our best next time";
      }
    }
  }
  if (valid) {
    return ans;
  } else {
    return "Make sure that your equation has only  one '=' sign";
  }
}

String two(String eq, String eq2) {
  Parser p = Parser();
  bool valid = false;
  String ans, leftone, rightone;
  String lefttwo, righttwo;
  Variable x = Variable('x');
  Variable y = Variable('y');

  for (int i = 0; i < eq.length; i++) {
    var char = eq[i];
    if (char == '=') {
      valid = true;
      leftone = eq.substring(0, i);
      rightone = eq.substring(i + 1, eq.length);
    }
  }
    for (int i = 0; i < eq2.length; i++) {
      var char = eq2[i];
      if (char == '=') {
        valid = true;
        lefttwo = eq2.substring(0, i);
        righttwo = eq2.substring(i + 1, eq2.length);
      }
    }

      Expression firstexpLeft = p.parse(leftone);
      Expression firstexpRight = p.parse(rightone);

      Expression secondexpLeft = p.parse(lefttwo);
      Expression secondexpRight = p.parse(righttwo);

      for (var i = -100; i < 100; i++) {
        for (var j = -100; j < 100; j++) {
          ContextModel cm = ContextModel()
            ..bindVariable(x, Number(i))
            ..bindVariable(y, Number(j));

          double evalLeft = firstexpLeft.evaluate(EvaluationType.REAL, cm);
          double evalRight = firstexpRight.evaluate(EvaluationType.REAL, cm);
          if (evalLeft == evalRight) {
            double evalLeft2 = secondexpLeft.evaluate(EvaluationType.REAL, cm);
            double evalRight2 =
                secondexpRight.evaluate(EvaluationType.REAL, cm);
            if (evalLeft2 == evalRight2) {
              ans = "X = " + i.toString() + " and Y = " + j.toString();
              break;
            }
          }
        }
      }
  return ans;
}

String second(String eq) {
  bool valid = false;
  bool firstvalue = false;
  String ans, left, right;
  Parser p = Parser();
  Variable x = Variable('x');

  for (int i = 0; i < eq.length; i++) {
    var char = eq[i];
    if (char == '=') {
      valid = true;
      left = eq.substring(0, i);
      right = eq.substring(i + 1, eq.length);

      Expression expLeft = p.parse(left);
      Expression expRight = p.parse(right);

      print(expLeft.simplify());
      print(expRight.simplify());
      for (var i = -100; i < 100; i++) {
        ContextModel cm = ContextModel()..bindVariable(x, Number(i));
        double evalLeft = expLeft.evaluate(EvaluationType.REAL, cm);
        double evalRight = expRight.evaluate(EvaluationType.REAL, cm);
        if (evalLeft == evalRight) {
          if (firstvalue) {
            ans = ans + " or X = " + i.toString();
            firstvalue = true;
            break;
          } else {
            ans = "X = " + i.toString();
            firstvalue = true;
          }
        }
        if (!firstvalue) {
          ans = "Sorry we couldn't SolveIt! we will do our best next time";
        }
      }
    }
  }
  if (valid) {
    return ans;
  } else {
    return "Make sure that your equation has only  one '=' sign";
  }
}

String diff(String eq) {
  Parser p = Parser();
  Expression exp = p.parse(eq);
  var a = exp.derive('x').simplify();
  return a.simplify().toString();
}
