import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:dumc_backoffice/controllers/layout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'dart:math' as math show pi;

class LayoutScreen extends StatelessWidget {
  late List<CollapsibleItem> _items;
  late String _headline;

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Dashboard',
        icon: Icons.assessment,
        onPressed: () {},
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Ice-Cream',
        icon: Icons.icecream,
        onPressed: () {},
      ),
      CollapsibleItem(
        text: 'Search',
        icon: Icons.search,
        onPressed: () {},
      ),
      CollapsibleItem(
        text: 'Notifications',
        icon: Icons.notifications,
        onPressed: () {},
      ),
      CollapsibleItem(
        text: 'Settings',
        icon: Icons.settings,
        onPressed: () {},
      ),
      CollapsibleItem(
        text: 'Home',
        icon: Icons.home,
        onPressed: () {},
      ),
      CollapsibleItem(
        text: 'Alarm',
        icon: Icons.access_alarm,
        onPressed: () {},
      ),
      CollapsibleItem(
        text: 'Eco',
        icon: Icons.eco,
        onPressed: () {},
      ),
      CollapsibleItem(
        text: 'Event',
        icon: Icons.event,
        onPressed: () {},
      ),
      CollapsibleItem(
        text: 'Email',
        icon: Icons.email,
        onPressed: () {},
      ),
      CollapsibleItem(
        text: 'Face',
        icon: Icons.face,
        onPressed: () {},
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    _items = _generateItems;
    _headline = _items.firstWhere((item) => item.isSelected).text;
    return GetBuilder<LayoutController>(
      init: LayoutController(),
      builder: (_) => Scaffold(
        body: Container(
          child: CollapsibleSidebar(
            isCollapsed: true,
            items: _items,
            //avatarImg: _avatarImg,
            title: 'John Smith',
            onTitleTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Yay! Flutter Collapsible Sidebar!')));
            },
            body: _body(size, context),
            backgroundColor: Colors.black,
            selectedTextColor: Colors.limeAccent,
            textStyle: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
            titleStyle: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
            toggleTitleStyle:
                TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            sidebarBoxShadow: [
              BoxShadow(
                color: Colors.indigo,
                blurRadius: 20,
                spreadRadius: 0.01,
                offset: Offset(3, 3),
              ),
              BoxShadow(
                color: Colors.green,
                blurRadius: 50,
                spreadRadius: 0.01,
                offset: Offset(3, 3),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _body(Size size, BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.red,
      child: Center(
        child: Text('hola Mundo'),
      ),
    );
  }
}
