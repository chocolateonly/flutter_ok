import 'package:flutter/material.dart';
import 'package:flutter_ok/generated/l10n.dart';

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