import 'package:flutter/material.dart';
import 'package:flutter_ok/ui/pages/home/myHome.dart';
import 'package:flutter_ok/ui/pages/language/language.dart';
import 'package:flutter_ok/generated/l10n.dart';
import 'package:flutter_ok/config/resouce_manager.dart';
class TabNavigator extends StatefulWidget {
  var tabIndex;
  var orderStatus;
  TabNavigator({this.tabIndex:0,this.orderStatus:0});
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> with WidgetsBindingObserver{
  var _pageController = PageController();
  int _selectedIndex = 0;
  var _lastPressed;
  List<Widget> pages = <Widget>[MyHomePage(title: 'title'),LanguagePage()];

  @override
  void initState() {
    _pageController = PageController(initialPage:widget.tabIndex);
    _selectedIndex=widget.tabIndex;
    pages = <Widget>[MyHomePage(title: 'title'),LanguagePage()];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope( //处理是否离开当前页面
        onWillPop: () async {
          if(_lastPressed==null || DateTime.now().difference(_lastPressed) > Duration(seconds: 1)){
            //两次点击间隔超过1秒则重新计时
            _lastPressed=DateTime.now();
            return false;
          }
          return true;
        },
        child: PageView.builder(
          itemBuilder: (ctx,index)=>pages[index],
          itemCount: pages.length,
          controller:_pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index){
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).accentColor,
        items:<BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon:Image.asset(ImageHelper.wrapAssets("icon_tab1.png"),width:20,height:20),
              title: Text(S.of(context).tab1),
              activeIcon: Image.asset(ImageHelper.wrapAssets("icon_tab1_active.png"), color: Theme.of(context).accentColor, height: 20, width: 20)
          ),
          BottomNavigationBarItem(
              icon:Image.asset(ImageHelper.wrapAssets("icon_tab2.png"),width:20,height:20),
              title: Text(S.of(context).tab2),
              activeIcon: Image.asset(ImageHelper.wrapAssets("icon_tab2_active.png"), color: Theme.of(context).accentColor, height: 20, width: 20)
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index){
          print(index);
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}
