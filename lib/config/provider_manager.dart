import 'package:massageflutterapp/view_model/global_model.dart';
import 'package:massageflutterapp/view_model/goods_types_model.dart';
import 'package:massageflutterapp/view_model/point_model.dart';
import 'package:massageflutterapp/view_model/locale_model.dart';
import 'package:massageflutterapp/view_model/address_model.dart';
import 'package:massageflutterapp/view_model/user_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<GlobalModel>(
      create:(context) => GlobalModel()
  ),
  ChangeNotifierProvider<LocaleModel>(
      create:(context) =>LocaleModel()
  ),
  ChangeNotifierProvider<UserModel>(
      create:(context) =>UserModel()
  ),
  ChangeNotifierProvider<AddressModel>( //更新数据
      create:(context) =>AddressModel()
  ),
  ChangeNotifierProvider<PointStoreModel>( //更新数据
      create:(context) =>PointStoreModel()
  ),
];
