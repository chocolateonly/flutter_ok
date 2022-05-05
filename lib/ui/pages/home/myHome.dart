import 'package:flutter/material.dart';
import 'package:flutter_ok/config/router_manager.dart';
import 'package:flutter_ok/generated/l10n.dart';
import 'package:flutter_ok/view_model/global_model.dart';
import 'package:provider/provider.dart';

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
    var globalModelData = Provider.of<GlobalModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('welcome:' + widget.title + ':' + S.of(context).index),
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.face),
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
            );
          }),
        ),
        body: Center(child: ChildPage(active: _active, onChanged: handleChange)),
        drawer: Drawer(
          child: ListView(
           padding: EdgeInsets.zero,
           children: [
             DrawerHeader(
               decoration: BoxDecoration(
                 color: Theme.of(context).accentColor,
               ),
               child: Text('侧边 '),
             ),
             ListTile(
               title: Text(S.of(context).switchLanguage),
               onTap: () {
                 // Update the state of the app
                 // ...
                 // Then close the drawer
                 // Navigator.pop(context);
                 Navigator.of(context).pushNamed(RouteName.login);
               },
             ),
             ListTile(
               title: Text(S.of(context).switchTheme),
               trailing: Icon(Icons.star),
               onTap: () {
                 // Update the state of the app
                 // ...
                 // Then close the drawer
                 globalModelData.switchTheme();
               },
             ),
           ],
          ),
        ),
    );
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