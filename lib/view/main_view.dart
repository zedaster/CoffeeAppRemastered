import 'package:coffee_app_remastered/view/components/navigation/navigation_bar.dart';
import 'package:coffee_app_remastered/view/components/navigation/page_icon_holder.dart';
import 'package:coffee_app_remastered/view/pages/cart_page.dart';
import 'package:coffee_app_remastered/view/pages/discounts_page.dart';
import 'package:coffee_app_remastered/view/pages/home_page.dart';
import 'package:coffee_app_remastered/view/pages/i_page.dart';
import 'package:coffee_app_remastered/view/pages/map_page.dart';
import 'package:coffee_app_remastered/view/pages/menu_page.dart';
import 'package:coffee_app_remastered/view/view_settings.dart';
import 'package:flutter/material.dart';

import 'components/navigation/navigation_icon.dart';

class MainView extends StatefulWidget {
  final pages = <PageIconHolder>[
    PageIconHolder(HomePage(), const NavigationIcon(Icons.home)),
    PageIconHolder(DiscountsPage(), const NavigationIcon(Icons.local_activity)),
    PageIconHolder(MenuPage(), const NavigationIcon(Icons.menu)),
    PageIconHolder(MapPage(), const NavigationIcon(Icons.map)),
    PageIconHolder(CartPage(), const NavigationIcon(Icons.shopping_cart)),
  ];

  MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late IPage _currentPage = widget.pages[0].page;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _currentPage.getAsWidget()),
      backgroundColor: ViewSettings.pageBackgroundColor,
      bottomNavigationBar: NavigationBar(
        unselectedItemColor: ViewSettings.unselectedNavigationIconColor,
        selectedItemColor: ViewSettings.selectedNavigationIconColor,
        pages: widget.pages,
        onPageChanged: _onPageChanged,
      ),
    );
  }

  void _onPageChanged(IPage newPage) {
    setState(() {
      _currentPage = newPage;
    });
  }
}
