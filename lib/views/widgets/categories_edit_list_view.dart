import 'package:flutter/material.dart';
import 'package:todo_list_app/constants.dart';
import 'package:todo_list_app/models/task_model.dart';
import 'package:todo_list_app/views/widgets/categories_list_view.dart';

class CategoriesEditListView extends StatefulWidget {
  const CategoriesEditListView({super.key, required this.task});
  final TaskModel task;
  @override
  State<CategoriesEditListView> createState() => _CategoriesEditListViewState();
}

class _CategoriesEditListViewState extends State<CategoriesEditListView> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: kCategoriesList.length,
        itemBuilder: (context, index) {
          return  Padding(
            padding:const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                widget.task.iconCategory = kCategoriesList[index].icon.codePoint;
                widget.task.colorCategory = kCategoriesList[index].colorIcon.value;
                setState(() {});
              },
              child: ColorsItem(
                isActive: kCategoriesList[index].icon.codePoint==widget.task.iconCategory,
                category: kCategoriesList[index],
              ),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}