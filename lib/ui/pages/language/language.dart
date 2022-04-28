import 'package:flutter/material.dart';
import 'package:flutter_ok/config/storage_manager.dart';
import 'package:flutter_ok/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ok/view_model/locale_model.dart';
class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {


  var themechange = ThemeData.light();

  var _newValue=getStorage(LocaleModel.kLocaleIndex);
  @override
  Widget build(BuildContext context) {
    var localModelData=Provider.of<LocaleModel>(context);
    return Theme(
      data:themechange,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(S.of(context).language),
        ),
        body: ListView.builder( //遍历对应v-for
          shrinkWrap: true,
          itemCount: LocaleModel.localeValueList.length,
          itemBuilder: (context,index){
            return Column(
              children: <Widget>[
                RadioListTile(
                  value: index,
                  title: Text(LocaleModel.localeName(index,context)),
                  groupValue: _newValue,
                  onChanged: (index) {
                    setState(() {
                      print(index);
                      _newValue = index;
                    });
                    localModelData.switchLocale(_newValue);
                  },
                ),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            (themechange == ThemeData.dark())?(themechange = ThemeData.light()):(themechange = ThemeData.dark());
            setState(() {

            });
          },
          tooltip: '切换主题',
          child:Icon(Icons.add)
        ),

      ),
    );
  }
}
