import 'package:flutter/material.dart';
import 'package:flutter_ok/config/storage_manager.dart';
class GlobalModel extends ChangeNotifier {
  static const modeArr = ['light','dark'];
  static const themeKey = 'ThemeMode';
  String mode = modeArr[0];
  String get themeMode => mode;
  //   主题色
  static const _themeColor = Color(0xffD27633);
  get themeColor => _themeColor;

  final ThemeData lightTheme = new ThemeData(
    primarySwatch: Colors.purple,
    brightness: Brightness.light,
    accentColor: Colors.purpleAccent[100],
    primaryColor: Colors.white,
    primaryColorLight: Colors.purple[700],
    dividerColor: Colors.grey[200],
    bottomAppBarColor: Colors.grey[200],
    buttonColor: Colors.purple[700],
    iconTheme: new IconThemeData(color: Colors.white),
    primaryIconTheme: new IconThemeData(color: Colors.black),
    accentIconTheme: new IconThemeData(color: Colors.purple[700]),
    disabledColor: Colors.grey[500],
  );

  final ThemeData darkTheme = new ThemeData(
    brightness: Brightness.dark,
    accentColor: Colors.deepPurpleAccent[100],
    primaryColor: Color.fromRGBO(5, 5, 5, 1.0),
    backgroundColor: Colors.black,
    canvasColor: Colors.black,
    primaryColorLight: Colors.deepPurple[300],
    buttonColor: Colors.deepPurpleAccent[100],
    accentIconTheme: new IconThemeData(color: Colors.deepPurple[300]),
    cardColor: Color.fromRGBO(16, 16, 16, 1.0),
    dividerColor: Color.fromRGBO(20, 20, 20, 1.0),
    bottomAppBarColor: Color.fromRGBO(19, 19, 19, 1.0),
    dialogBackgroundColor: Colors.black,
    iconTheme: new IconThemeData(color: Colors.white),
  );

   GlobalModel(){
     getStorage(themeKey).then((val){
       mode = val;
     });
   }

   switchTheme(){
     mode = mode ==modeArr[0]?modeArr[1]:modeArr[0];
     notifyListeners();
     setStorage(themeKey, mode);
   }

  themeData() {
    var themeData = ThemeData();
    // return themeData;
    return mode==modeArr[0]?lightTheme:darkTheme;
  }

}
