import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_list_app/cubits/taskes_cubit/taskes_cubit.dart';
import 'package:todo_list_app/cubits/taskes_cubit/taskes_states.dart';
import 'package:todo_list_app/models/task_model.dart';
import 'package:todo_list_app/views/widgets/custom_todo_item.dart';

class ListBuilderTodoItems extends StatelessWidget {
  const ListBuilderTodoItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskesCubit, TaskesStates>(
      builder: (context, state) {
        if (state is TaskesSuccessStateWithData) {
          List<TaskModel> tasks = BlocProvider.of<TaskesCubit>(context).tasks!;
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return CustomTodoItem(
                task: tasks[index],
              );
            },
          );
        } else {
          return  Column(
              children: [
                Lottie.asset('assets/animation/Animation_268752.json'),
                const SizedBox(height: 2,),
               const Text(
                  'No Tasks Found go and add some',
                  style: TextStyle(
                      fontFamily: 'Kalam', color: Colors.black, fontSize: 18),
                ),
              ],
            );
        }
      },
    );
  }
}
