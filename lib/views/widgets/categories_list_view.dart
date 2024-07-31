import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/constants.dart';
import 'package:todo_list_app/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:todo_list_app/models/category_model.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key});
  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  int currentIndex = 0;

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
                currentIndex = index;
                BlocProvider.of<AddTaskCubit>(context).selectedCategory=kCategoriesList[index];
                setState(() {});
              },
              child: ColorsItem(
                isActive: currentIndex == index,
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

class ColorsItem extends StatelessWidget {
  const ColorsItem({super.key, required this.isActive, required this.category,});
  final bool isActive;
 final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return isActive
        ?  CircleAvatar(
            backgroundColor: Colors.grey[400],
            radius: 38,
            child: Icon(category.icon,color: category.colorIcon,size: 40,),
          )
        : Container(
            height: 74,
            width: 74,
            decoration:const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Icon(category.icon, color: category.colorIcon, size: 38,),
          );
  }
}
