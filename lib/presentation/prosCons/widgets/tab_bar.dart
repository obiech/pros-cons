import 'package:flutter/material.dart';
import 'package:pros_cons/presentation/core/theme/colors.dart';
import 'package:pros_cons/presentation/core/typography/text_styles.dart';

enum TabItem { weigh, compare }

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  TabItem _selectedItem = TabItem.weigh;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: (() {
              setState(() {
                _selectedItem = TabItem.weigh;
              });
            }),
            child: Container(
              child: Text('Weigh',
                  style: ProsConsTextStyle.label.copyWith(
                      color: (_selectedItem == TabItem.weigh)
                          ? ProsConsColors.blue
                          : ProsConsColors.gray)),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: (_selectedItem == TabItem.weigh)
                          ? const BorderSide(color: ProsConsColors.blue)
                          : BorderSide.none)),
            )),
        GestureDetector(
            onTap: (() {
              setState(() {
                _selectedItem = TabItem.compare;
              });
            }),
            child: Container(
              child: Text('Compare',
                  style: ProsConsTextStyle.label.copyWith(
                      color: (_selectedItem == TabItem.compare)
                          ? ProsConsColors.blue
                          : ProsConsColors.gray)),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: (_selectedItem == TabItem.compare)
                          ? const BorderSide(color: ProsConsColors.blue)
                          : BorderSide.none)),
            )),
      ],
    );
  }
}
