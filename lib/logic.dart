import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:math_expressions/math_expressions.dart';

var editText = '0';
var equalColor = Colors.white;
var memoryEdit = '0';
var equalText = '';
var size;
var marginTop = 200.00;
var colorBg = Colors.black;
var color = Colors.white38;
var numsColor = Colors.white;
var btnColor = Colors.white.withAlpha(0);
var hrColor = Colors.white70;
var editColor = numsColor;
var ac = 'AC';
var res;
var editSize = 60.00;
var paddingT = 0.00;
bool equal = false;
bool printNum = true;

bool op = true;
bool zero = false;
bool dotMayBeUsed = true;

var themeMode;

var brightness = SchedulerBinding.instance.window.platformBrightness;
bool darkModeOn = brightness == Brightness.dark;

checkSysTheme() {
  if (darkModeOn) {
    themeMode = 'dark';
  } else {
    themeMode = 'light';
  }
}

final theme = ThemeData(
  highlightColor: btnColor,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    hoverColor: btnColor,
    splashColor: btnColor,
    elevation: 0,
    disabledElevation: 0,
    focusElevation: 0,
    highlightElevation: 0,
    hoverElevation: 0,
  ),
);

void eval(String str) {
  Parser p = Parser();
  Expression exp = p.parse(str);
  ContextModel cm = ContextModel();
  double evalu = exp.evaluate(EvaluationType.REAL, cm);
  res = evalu.toString();
}

void repCheckOp() {
  if ((editText.endsWith('+')) ||
      (editText.endsWith('×')) ||
      (editText.endsWith('.')) ||
      (editText.endsWith('-')) ||
      (editText.endsWith('÷'))) {
    op = false;
  } else {
    op = true;
  }
}

checkOp() {
  try {
    if ((editText.endsWith('+')) ||
        (editText.endsWith('×')) ||
        (editText.endsWith('-')) ||
        (editText.endsWith('÷'))) {
      return true;
    } else {
      return false;
    }
  } on FormatException {
  }
}

void end() {
  String str = editText;
  if (checkOp()) {
    dotMayBeUsed = false;
    str = str.replaceAll(RegExp(r'[0-9]'), '');

    if ((str == '+') || (str == '×') || (str == '÷') || (str == '-')) {
      dotMayBeUsed = true;
    }
    if (str.length >= 2) {
      if ((str[str.length - 2] != '.')) {
        dotMayBeUsed = true;
      }
    }
  }
}

