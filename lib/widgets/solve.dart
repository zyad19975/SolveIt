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
  
  Solve({Key key, @required this.equation, @required this.todo}) : super(key: key);

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
          child: Text(solving(equation,todo.type)),
        ),
      );
  }
}

String solving(String eq, String type){
  switch(type) { 
   case 'Basic': { 
      return basic(eq);
   } 
   break; 
  
   case 'Two': { 
      return two(eq);
   } 
   break; 

   case 'Second': { 
      return second(eq);
   } 
   break; 

   case 'Diff': { 
      return diff(eq);
   } 
   break; 
} 
}

String basic (String eq){
  
  bool valid = false;
  String ans,left,right;
  Parser p = Parser();
  Variable x = Variable('x');

  for(int i=0; i<eq.length; i++) {
  var char = eq[i];
  if (char == '='){  
    valid = true;
    left = eq.substring(0, i);
    right = eq.substring(i+1, eq.length);
    
    Expression expLeft = p.parse(left);
    Expression expRight = p.parse(right);

    print(expLeft.simplify());
    print(expRight.simplify());
    for (var i = -100; i < 100; i++) {
      ContextModel cm = ContextModel()
      ..bindVariable(x, Number(i));
      double evalLeft = expLeft.evaluate(EvaluationType.REAL, cm);
      double evalRight = expRight.evaluate(EvaluationType.REAL, cm);
      if (evalLeft == evalRight) {
        ans = "X = "+ i.toString();
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

String two (String eq){
  return "two equations in two unkwons";
}

String second (String eq){
  return "second orde equation";
}

String diff (String eq){
  return "diffrential equation";
}