import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'config/provider_manager.dart';
import 'generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ok/view_model/locale_model.dart';
import 'package:flutter_ok/view_model/global_model.dart';
import 'package:flutter_ok/ui/pages/language/language.dart';
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
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: localeModel.locale,
        theme:  globalModel.themeData(),
        // home: MyHomePage(title: 'Flutter Demo Home Page'),
        home: LanguagePage(),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _active = false;

  void handleChange(bool newVal) {
    setState(() {
      _active = newVal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('welcome:' + widget.title + ':' + S.of(context).index),
        ),
        body:
            Center(child: ChildPage(active: _active, onChanged: handleChange)));
  }
}

class ChildPage extends StatelessWidget {
  const ChildPage({Key? key, required this.onChanged, this.active = false})
      : super(key: key);
  final bool active;
  final ValueChanged<bool> onChanged;

  void handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: handleTap,
        child: Text('Hello world' + (this.active == true ? 'true' : 'false')));
  }
}
