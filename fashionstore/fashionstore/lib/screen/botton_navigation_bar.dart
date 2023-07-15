import 'package:fashionstore/post/post_apartment.dart';
import 'package:fashionstore/screen/dashboard_sceen.dart';
import 'package:fashionstore/settings/setting.dart';
import 'package:fashionstore/theme/color.dart';
import 'package:fashionstore/widgets/bottombar_item.dart';
import 'package:flutter/material.dart';


class RootApp extends StatefulWidget {
  static const id = "/RootApp";
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  List barItems = [
    {
      "icon": Icons.home_outlined,
      "active_icon": Icons.home_rounded,
      "page": const DashboardScreen(),
      "title": ""
    },
    {
      "icon": Icons.search_outlined,
      "active_icon": Icons.search,
      "page": const DashboardScreen(),
      "title": ""
    },
    {
      "icon": Icons.add,
      "active_icon": Icons.add_card_rounded,
      "page": AddProductPage(),
      "title": ""
    },
    // {
    //   "icon": Icons.favorite_border,
    //   "active_icon": Icons.favorite_outlined,
    //   "page": const FavouriteScreen(),
    //   "title": ""
    // },
    {
      "icon": Icons.settings_outlined,
      "active_icon": Icons.settings_rounded,
      "page": SettingsPage(),
      "title": ""
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: getBarPage(),
      // bottomNavigationBar: getBottomBar1()
      floatingActionButton: getBottomBar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  Widget getBarPage() {
    return IndexedStack(
        index: activeTab,
        children:
            List.generate(barItems.length, (index) => barItems[index]["page"]));
  }

  Widget getBottomBar() {
    return Container(
      height: 55,
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      decoration: BoxDecoration(
          color: bottomBarColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: shadowColor.withOpacity(0.1),
                blurRadius: 1,
                spreadRadius: 1,
                offset: const Offset(0, 1))
          ]),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(
              barItems.length,
              (index) => BottomBarItem(
                    activeTab == index
                        ? barItems[index]["active_icon"]
                        : barItems[index]["icon"],
                    "",
                    isActive: activeTab == index,
                    activeColor: primary,
                    onTap: () {
                      setState(() {
                        activeTab = index;
                      });
                    },
                  ))),
    );
  }
}
