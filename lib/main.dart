import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'config/provider_manager.dart';
import 'generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ok/view_model/locale_model.dart';
import 'package:flutter_ok/view_model/global_model.dart';
import 'package:flutter_ok/ui/pages/language/language.dart';
import 'package:flutter_ok/config/router_manager.dart';
void main() {
  runApp(MultiProvider(providers: providers, child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer2<GlobalModel, LocaleModel>(
        builder: (context, globalModel, localeModel, child) {
      return MaterialApp(
        title: 'Flutter Demo',
        //去掉右上角debug
        debugShowCheckedModeBanner: false,
        //多语言
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: localeModel.locale,
        //主题
        theme:  globalModel.themeData(),
        //路由
        initialRoute: getInitRoute(context),

        //页面
        // home: MyHomePage(title: 'Flutter Demo Home Page'),
        home: LanguagePage(),
      );
    });
  }
}

String getInitRoute(BuildContext context) {
  String routeName;
  var token;
  if (token != null) {
    routeName = RouteName.tab;
  } else
    routeName = RouteName.login;
  return routeName;
}