import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_list_app/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:todo_list_app/cubits/add_task_cubit/add_task_states.dart';
import 'package:todo_list_app/cubits/taskes_cubit/taskes_cubit.dart';
import 'package:todo_list_app/views/widgets/add_task_form.dart';

class AddNewTaskView extends StatelessWidget {
  const AddNewTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Add New Task',
            style: TextStyle(fontFamily: 'Kalam'),
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<AddTaskCubit, AddTaskStates>(
          listener: (context, state) {
            if (state is AddTaskSuccessState) {
              BlocProvider.of<TaskesCubit>(context).fetchAllTaskes();
              Navigator.pop(context);
              Fluttertoast.showToast(
                  msg: "Task Added Successfully",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
            if (state is AddTaskErrorState) {
              Fluttertoast.showToast(
                  msg: state.error,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          },
          builder: (context, state) {
            return  AbsorbPointer(
              absorbing: state is AddTaskLoadingState,
              child: AddTaskForm(
                isLoading: state is AddTaskLoadingState,
              ),
            );
          },
        ),
      ),
    );
  }
}
