import 'package:flutter/material.dart';
import 'package:pros_cons/presentation/core/size_config.dart';
import 'package:pros_cons/presentation/core/theme/colors.dart';
import 'package:pros_cons/presentation/core/typography/text_styles.dart';
import 'package:pros_cons/presentation/prosCons/widgets/categories_row.dart';

enum TabItem { weigh, compare }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabItem _selectedItem = TabItem.weigh;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          )),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 32.w()),
          child: Column(
            children: [
              SizedBox(
                height: 16.h(),
              ),
              const CategoriesListRow()
            ],
          )),
    );
  }
}
