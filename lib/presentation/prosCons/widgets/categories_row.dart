import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pros_cons/application/bloc/category_bloc.dart';
import 'package:pros_cons/application/core/state.dart' as category_state;
import 'package:pros_cons/domain/category/model/category.dart';
import 'package:pros_cons/presentation/core/icons.dart';
import 'package:pros_cons/presentation/core/size_config.dart';
import 'package:pros_cons/presentation/core/theme/colors.dart';
import 'package:pros_cons/presentation/core/typography/text_styles.dart';

class CategoriesListRow extends StatefulWidget {
  const CategoriesListRow({Key? key}) : super(key: key);

  @override
  _CategoriesListRowState createState() => _CategoriesListRowState();
}

class _CategoriesListRowState extends State<CategoriesListRow> {
  final ScrollController _controller = ScrollController();
  int currentIndex = 0;

  Color lightenColor(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  _showMaterialDialog(int index, BuildContext context, Category category) {
    showDialog(
        context: context,
        builder: (_) => Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.pop(context);
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return Wrap(
                              children: [
                                // BackdropFilter(
                                //     filter:
                                //         ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                //     child: EditCategoryBottomSheet(
                                //       category: category,
                                //       index: index,
                                //     )),
                              ],
                            );
                          });
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: ProsConsColors.gray,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 25, bottom: 10),
                        child: Text(
                          'Редактировать',
                          style: ProsConsTextStyle.label.copyWith(
                            fontWeight: FontWeight.w600,
                            color: ProsConsColors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // BlocProvider.of<CategoryBloc>(context)
                      //     .add(RemoveCategoryEvent(category: category));
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        color: ProsConsColors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 25),
                        child: Text(
                          'Удалить',
                          style: ProsConsTextStyle.headline4.copyWith(
                            fontWeight: FontWeight.w600,
                            color: ProsConsColors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return Wrap(
                        children: [
                          // BackdropFilter(
                          //     filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          //     child: CategoriesBottomSheet()),
                        ],
                      );
                    });
              },
              child: SizedBox(
                  width: 20.w(),
                  height: 20.h(),
                  child: SvgPicture.asset(
                    MainIcons.circlePlus,
                    fit: BoxFit.scaleDown,
                  )),
            ),
            SizedBox(width: 16.w()),
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state.state == category_state.State.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.state == category_state.State.success) {
                  return Expanded(
                    child: SizedBox(
                      height: 15.h(),
                      child: ListView.separated(
                        itemCount: state.categories.length,
                        controller: _controller,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onLongPress: () {
                              if (index != 0) {
                                // _showMaterialDialog(
                                //     index, context, state.categories[index]);
                              }
                            },
                            onTap: () {
                              // setState(() {
                              //   currentIndex = index;
                              //   global.store.set('categoryName', null);
                              //   global.store.set('categoryName',
                              //       state.categories[index].title);
                              // });
                              // BlocProvider.of<TaskListBloc>(context)
                              //   ..add(TaskListLoadEvent());
                              // BlocProvider.of<GoalListBloc>(context)
                              //   ..add(GoalListLoadEvent());
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                color: currentIndex == index
                                    ? lightenColor(
                                        ProsConsColors.colorPickerList[
                                            state.categories[index].color],
                                        0)
                                    : lightenColor(
                                        ProsConsColors.colorPickerList[
                                            state.categories[index].color],
                                        .2),
                              ),
                              child: Center(
                                child: Text(
                                  state.categories[index].name,
                                  style: ProsConsTextStyle.label.copyWith(
                                      color: currentIndex == index
                                          ? ProsConsColors.white
                                          : ProsConsColors.colorPickerList[
                                              state.categories[index].color],
                                      fontSize: 9),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(width: 16);
                        },
                      ),
                    ),
                  );
                } else if (state.state == category_state.State.failed) {
                  return Center(
                    child: Text(state.error.error),
                  );
                } else {
                  return const Offstage();
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
