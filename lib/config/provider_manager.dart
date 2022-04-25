import 'package:flutter_ok/view_model/global_model.dart';
import 'package:flutter_ok/view_model/locale_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<GlobalModel>(
      create:(context) => GlobalModel()
  ),
  ChangeNotifierProvider<LocaleModel>(
      create:(context) =>LocaleModel()
  ),
];
