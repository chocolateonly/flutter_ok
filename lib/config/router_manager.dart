import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ok/ui/pages/home/myHome.dart';
import 'package:flutter_ok/ui/pages/language/language.dart';
class RouteName{
static const String login='login';
static const String tab='tab';
}
class Routers{
   static Route<dynamic> generateRoute(RouteSettings settings){
     switch(settings.name){
       case RouteName.tab:
         return CupertinoPageRoute(builder: (_) => MyHomePage(title: 'title'));
       case RouteName.login:
         return CupertinoPageRoute(builder: (_) => LanguagePage());
       default:
         return CupertinoPageRoute(builder: (_) => Scaffold(body: Center(child: Text('No route defined for ${settings.name}'))));
     }
   }
}