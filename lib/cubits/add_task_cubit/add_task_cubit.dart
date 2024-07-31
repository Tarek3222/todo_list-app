import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_list_app/constants.dart';
import 'package:todo_list_app/cubits/add_task_cubit/add_task_states.dart';
import 'package:todo_list_app/models/category_model.dart';
import 'package:todo_list_app/models/task_model.dart';

class AddTaskCubit extends Cubit<AddTaskStates> {
  AddTaskCubit() : super(AddTaskInitialState());
  CategoryModel selectedCategory = kCategoriesList[0];

  addNewTask(TaskModel taskModel)async {
    emit(AddTaskLoadingState());
    try {
      var box = Hive.box<TaskModel>(kTaskBox);
      taskModel.iconCategory=selectedCategory.icon.codePoint;
      taskModel.colorCategory=selectedCategory.colorIcon.value;
      await box.add(taskModel);
      emit(AddTaskSuccessState());
    } catch (e) {
      emit(AddTaskErrorState(e.toString()));
  }
  }

}