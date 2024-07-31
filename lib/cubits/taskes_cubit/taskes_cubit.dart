import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_list_app/constants.dart';
import 'package:todo_list_app/cubits/taskes_cubit/taskes_states.dart';
import 'package:todo_list_app/models/task_model.dart';

class TaskesCubit extends Cubit<TaskesStates> {
  TaskesCubit() : super(TaskesInitialState());
   List<TaskModel>? tasks;
  fetchAllTaskes(){
    var noteBox= Hive.box<TaskModel>(kTaskBox);
    tasks = noteBox.values.toList();
    if(tasks!.isNotEmpty){
      emit(TaskesSuccessStateWithData());
    }else{
      emit(TaskesSuccessStateWithoutData());
    }
  }
}