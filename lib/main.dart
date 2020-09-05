import 'package:flutter/material.dart';
import 'logic.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  void maxLength() {
    if (editText.length <= 9) {
      setState(() {
        editSize = 60;
        paddingT = 0;
        size = 40.00;
      });
    }
    if (editText.length > 9) {
      setState(() {
        editSize = 55;
        paddingT = 9;
        size = 36.00;
      });
    }
    if (editText.length > 10) {
      setState(() {
        editSize = 50;
        paddingT = 15;
        size = 35.00;
      });
    }
    if (editText.length > 11) {
      setState(() {
        editSize = 46;
        paddingT = 24;
        size = 31.00;
      });
    }
    if (editText.length > 12) {
      setState(() {
        editSize = 42;
        paddingT = 32;
        size = 28.00;
      });
    } else {
      printNum = true;
    }
  }

  void toAC() {
    if (editText == '0') {
      setState(() {
        ac = 'AC';
      });
    } else {
      ac = 'C';
    }
  }

  zeroDiv() {
    if (equalText == '= Infinity') {
      setState(() {
        equalText = equalText.replaceAll(equalText, 'ERROR');
      });
    }
  }

  checkFunc() {
    if (equal) {
      equal = false;
      setState(() {
        size = 60.00;
        editSize = 40.00;
        editColor = color;
        equalColor = numsColor;
        paddingT = 0.00;
      });
    } else {
      setState(() {
        editColor = numsColor;
        equalColor = color;
      });
    }

    if (editText != '0') {
      zero = true;
      setState(() {
        marginTop = 232.00;
      });
    } else {
      zero = false;
      setState(() {
        equalText = editText;
        editText = '';
        size = 70.00;
      });
    }
  }

  getZero() {
    if (equalText == '= ') {
      setState(() {
        editText = '';
        equalText = '0';
        size = 70.00;
        marginTop = 200;
      });
    }
  }

  changeToSysTheme() {
    checkSysTheme();
    if (themeMode == 'dark') {
      setState(() {
        colorBg = Colors.black;
        numsColor = Colors.white;
        color = Colors.white38;
        hrColor = Colors.white70;
        if (editText != '0') {
          setState(() {
            equalColor = color;
          });
        } else {
          setState(() {
            equalColor = numsColor;
          });
        }
      });
    } else if (themeMode == 'light') {
      setState(() {
        colorBg = Colors.white;
        numsColor = Colors.black;
        color = Colors.black54;
        hrColor = Colors.black;
        if (editText != '0') {
          setState(() {
            equalColor = color;
          });
        } else {
          setState(() {
            equalColor = numsColor;
          });
        }
      });
    }
  }

  onAC() {
    dotMayBeUsed = true;
    setState(() {
      editText = '0';
      equalText = '0';
      marginTop = 200;
    });
  }

  onC() {
    end();
    if ((editText.length == 1) || (editText == '0.')) {
      onAC();
    }
    if (editText.endsWith('.')) {
      dotMayBeUsed = true;
    }
    if (editText.length > 1) {
      setState(() {
        editText = editText.substring(0, editText.length - 1);
      });
    }
    if (editSize == 40.00) {
      setState(() {
        editText = equalText.replaceAll('= ', '').substring(0, editText.length);
        if (editText == '') {
          onAC();
        }
      });
    }
  }

  void toMemoryEdit() {
    setState(() {
      memoryEdit = editText;
      memoryEdit = memoryEdit.replaceAll('×', '*');
      memoryEdit = memoryEdit.replaceAll('÷', '/');
      memoryEdit = memoryEdit.replaceAll('= ', '');
      memoryEdit = memoryEdit.replaceAll(' ', '');
    });
  }

  void endOperators(String op) {
    if (memoryEdit.endsWith(op)) {
      memoryEdit = memoryEdit.substring(0, memoryEdit.length - 1);
      eval(memoryEdit);
      setState(() {
        equalText = '=' + ' ' + res;
      });
    }
  }

  void endsWithOperators() {
    endOperators('+');
    endOperators('/');
    endOperators('*');
    endOperators('-');
  }

  void result() {
    eval(memoryEdit);
    setState(() {
      equalText = '=' + ' ' + res;
    });
    zeroDiv();
  }

  void toInt() {
    if (equalText.endsWith('.0')) {
      setState(() {
        equalText = equalText.substring(0, equalText.length - 2);
      });
    }
  }

  onNum(var n) {
    if (printNum) {
      if (editSize == 40.00) {
        setState(() {
          editText = '$n';
        });
      } else {
        setState(() {
          if (equalText == 'error') {
            editText = editText;
          } else {
            editText = editText + '$n';
          }
        });
      }
      checkFunc();
    }
  }

  onNum_0() {
    if (zero) {
      onNum(0);
    }
  }

  onNum_1() {
    onNum(1);
  }

  onNum_2() {
    onNum(2);
  }

  onNum_3() {
    onNum(3);
  }

  onNum_4() {
    onNum(4);
  }

  onNum_5() {
    onNum(5);
  }

  onNum_6() {
    onNum(6);
  }

  onNum_7() {
    onNum(7);
  }

  onNum_8() {
    onNum(8);
  }

  onNum_9() {
    onNum(9);
  }

  onPlus() {
    dotMayBeUsed = true;
    if (editText[0] != '+') {
      if (op) {
        setState(() {
          editText = editText + '+';
        });
        checkFunc();
      } else if (editText.endsWith('.') == false) {
        setState(() {
          editText = editText.substring(0, editText.length - 1);
          editText = editText + '+';
        });
      }
      if (editSize == 40.00) {
        setState(() {
          editText = equalText.replaceAll('= ', '') + '+';
        });
      }
    }
  }

  onMinus() {
    dotMayBeUsed = true;
    if (editText[0] != '-') {
      if (op) {
        setState(() {
          editText = editText + '-';
        });
        checkFunc();
      } else if (editText.endsWith('.') == false) {
        setState(() {
          editText = editText.substring(0, editText.length - 1);
          editText = editText + '-';
        });
      }
      if (editSize == 40.00) {
        setState(() {
          editText = equalText.replaceAll('= ', '') + '-';
        });
      }
    }
  }

  onTimes() {
    dotMayBeUsed = true;
    if (editText[0] != '×') {
      if (op) {
        setState(() {
          editText = editText + '×';
        });
        checkFunc();
      } else if (editText.endsWith('.') == false) {
        setState(() {
          editText = editText.substring(0, editText.length - 1);
          editText = editText + '×';
        });
      }
      if (editSize == 40.00) {
        setState(() {
          editText = equalText.replaceAll('= ', '') + '×';
        });
      }
    }
  }

  onDiv() {
    dotMayBeUsed = true;
    if (editText[0] != '÷') {
      if (op) {
        setState(() {
          editText = editText + '÷';
        });
        checkFunc();
      } else if (editText.endsWith('.') == false) {
        setState(() {
          editText = editText.substring(0, editText.length - 1);
          editText = editText + '÷';
        });
      }
      if (editSize == 40.00) {
        setState(() {
          editText = equalText.replaceAll('= ', '') + '÷';
        });
      }
    }
  }

  void onDot() {
    try {
      if (dotMayBeUsed) {
        dotMayBeUsed = false;
        if (op) {
          setState(() {
            editText = editText + '.';
          });
          checkFunc();
        }
        if (editText[0] == '.') {
          setState(() {
            editText = '0.';
          });
        }
      }
    } on FormatException {
      print('pkcdkicf');
    }
  }

  void getRes() {
    if (editText != '') {
      equal = true;
      setState(() {
        editSize = 40.00;
        size = 60.00;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    changeToSysTheme();
    toMemoryEdit();
    toAC();
    repCheckOp();
    endsWithOperators();
    result();
    toInt();
    maxLength();
    checkFunc();
    getZero();
    return MaterialApp(
        theme: theme,
        home: Scaffold(
          backgroundColor: colorBg,
          body: Container(
            margin: EdgeInsets.fromLTRB(30, marginTop, 30, 30),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, paddingT, 0, 0),
                      child: Text(
                        editText,
                        style: TextStyle(
                          color: numsColor,
                          fontSize: editSize,
                          height: 1.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.end,
                ),

                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Text(
                        equalText,
                        style: TextStyle(
                          color: equalColor,
                          fontSize: size,
                          height: 1.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.end,
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Divider(
                    color: hrColor,
                    thickness: 0.4,
                  ),
                ),

                // Buttons
                Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text('2nd',
                              style: TextStyle(
                                fontSize: 20,
                                color: color,
                              )),
                          onPressed: null,
                          backgroundColor: colorBg,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text('deg',
                              style: TextStyle(
                                fontSize: 20,
                                color: color,
                              )),
                          onPressed: null,
                          backgroundColor: colorBg,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text('sin',
                              style: TextStyle(
                                fontSize: 20,
                                color: color,
                              )),
                          onPressed: null,
                          backgroundColor: colorBg,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text('cos',
                              style: TextStyle(
                                fontSize: 20,
                                color: color,
                              )),
                          onPressed: null,
                          backgroundColor: colorBg,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text('tan',
                              style: TextStyle(
                                fontSize: 20,
                                color: color,
                              )),
                          onPressed: null,
                          backgroundColor: colorBg,
                        )),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),

                Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text(
                            '^',
                            style: TextStyle(
                              fontSize: 30,
                              height: 1.7,
                              color: color,
                            ),
                          ),
                          onPressed: null,
                          backgroundColor: colorBg,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text('lg',
                              style: TextStyle(
                                fontSize: 20,
                                color: color,
                              )),
                          onPressed: null,
                          backgroundColor: colorBg,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text('ln',
                              style: TextStyle(
                                fontSize: 20,
                                color: color,
                              )),
                          onPressed: null,
                          backgroundColor: colorBg,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text('(',
                              style: TextStyle(
                                fontSize: 20,
                                color: color,
                              )),
                          onPressed: null,
                          backgroundColor: colorBg,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text(')',
                              style: TextStyle(
                                fontSize: 20,
                                color: color,
                              )),
                          onPressed: null,
                          backgroundColor: colorBg,
                        )),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),

                Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          onPressed: null,
                          child: Text('√X',
                              style: TextStyle(
                                fontSize: 20,
                                color: color,
                              )),
                          backgroundColor: colorBg,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text(ac,
                              style: TextStyle(
                                  fontSize: 25, color: Colors.orange[800])),
                          onPressed: onAC,
                          backgroundColor: colorBg,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Icon(
                            Icons.backspace,
                            color: Colors.orange[800],
                            size: 25,
                          ),
                          onPressed: onC,
                          backgroundColor: colorBg,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text('%',
                              style: TextStyle(
                                  fontSize: 25, color: Colors.orange[800])),
                          onPressed: null,
                          backgroundColor: colorBg,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text('÷',
                              style: TextStyle(
                                  fontSize: 30, color: Colors.orange[800])),
                          onPressed: onDiv,
                          backgroundColor: colorBg,
                        )),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),

                Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text('X!',
                              style: TextStyle(
                                fontSize: 20,
                                color: color,
                              )),
                          onPressed: null,
                          backgroundColor: colorBg,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text('7',
                              style: TextStyle(
                                fontSize: 30,
                                color: numsColor,
                              )),
                          onPressed: onNum_7,
                          backgroundColor: colorBg,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text('8',
                              style: TextStyle(
                                fontSize: 30,
                                color: numsColor,
                              )),
                          onPressed: onNum_8,
                          backgroundColor: colorBg,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text('9',
                              style: TextStyle(
                                fontSize: 30,
                                color: numsColor,
                              )),
                          onPressed: onNum_9,
                          backgroundColor: colorBg,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text('×',
                              style: TextStyle(
                                  fontSize: 30, color: Colors.orange[800])),
                          onPressed: onTimes,
                          backgroundColor: colorBg,
                        )),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),

                Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text('1/X',
                              style: TextStyle(fontSize: 20, color: color)),
                          onPressed: null,
                          backgroundColor: colorBg,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text('4',
                              style: TextStyle(
                                fontSize: 30,
                                color: numsColor,
                              )),
                          onPressed: onNum_4,
                          backgroundColor: colorBg,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text('5',
                              style: TextStyle(
                                fontSize: 30,
                                color: numsColor,
                              )),
                          onPressed: onNum_5,
                          backgroundColor: colorBg,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text('6',
                              style: TextStyle(
                                fontSize: 30,
                                color: numsColor,
                              )),
                          onPressed: onNum_6,
                          backgroundColor: colorBg,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text('-',
                              style: TextStyle(
                                  fontSize: 30, color: Colors.orange[800])),
                          onPressed: onMinus,
                          backgroundColor: colorBg,
                        )),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),

                Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text('π',
                              style: TextStyle(fontSize: 20, color: color)),
                          onPressed: null,
                          backgroundColor: colorBg,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text('1',
                              style: TextStyle(
                                fontSize: 30,
                                color: numsColor,
                              )),
                          onPressed: onNum_1,
                          backgroundColor: colorBg,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text('2',
                              style: TextStyle(
                                fontSize: 30,
                                color: numsColor,
                              )),
                          onPressed: onNum_2,
                          backgroundColor: colorBg,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text('3',
                              style: TextStyle(
                                fontSize: 30,
                                color: numsColor,
                              )),
                          onPressed: onNum_3,
                          backgroundColor: colorBg,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text('+',
                              style: TextStyle(
                                  fontSize: 30, color: Colors.orange[800])),
                          onPressed: onPlus,
                          backgroundColor: colorBg,
                        )),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),

                Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text('|X|',
                              style: TextStyle(
                                fontSize: 20,
                                color: color,
                              )),
                          onPressed: null,
                          backgroundColor: colorBg,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text('e',
                              style: TextStyle(
                                fontSize: 30,
                                color: numsColor,
                              )),
                          onPressed: null,
                          backgroundColor: colorBg,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text('0',
                              style: TextStyle(
                                fontSize: 30,
                                color: numsColor,
                              )),
                          onPressed: onNum_0,
                          backgroundColor: colorBg,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text('.',
                              style: TextStyle(
                                fontSize: 30,
                                color: numsColor,
                              )),
                          onPressed: onDot,
                          backgroundColor: colorBg,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FloatingActionButton(
                          child: Text('=',
                              style: TextStyle(
                                fontSize: 30,
                              )),
                          onPressed: getRes,
                          backgroundColor: Colors.orange[800],
                        )),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
        ));
  }
}
