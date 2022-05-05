import 'package:flutter/material.dart';
import 'package:flutter_ok/config/storage_manager.dart';
import 'package:flutter_ok/generated/l10n.dart';
import 'package:flutter_ok/view_model/locale_model.dart';
import 'package:provider/provider.dart';
class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {


  var themechange = ThemeData.light();

  int _newValue=0;

  @override
  Widget build(BuildContext context) {
    var localModelData=Provider.of<LocaleModel>(context);
    getStorage(LocaleModel.kLocaleIndex,0)
    .then((res){
      setState(() {
        _newValue = res;
      });
    });


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
                  onChanged: (e) {
                    setState(() {
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
