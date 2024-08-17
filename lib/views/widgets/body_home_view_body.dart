import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/cubits/taskes_cubit/taskes_cubit.dart';
import 'package:todo_list_app/views/add_new_task_view.dart';
import 'package:todo_list_app/views/widgets/custom_button.dart';
import 'package:todo_list_app/views/widgets/list_view_builder_todo_list.dart';

class BodyHomeViewBody extends StatefulWidget {
  const BodyHomeViewBody({super.key});

  @override
  State<BodyHomeViewBody> createState() => _BodyHomeViewBodyState();
}

class _BodyHomeViewBodyState extends State<BodyHomeViewBody> {
  @override
  void initState() {
    BlocProvider.of<TaskesCubit>(context).fetchAllTaskes();
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: const ListBuilderTodoItems(),
        ),
        const SizedBox(height: 10),
        CustomButton(
          text: 'Add New Task',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNewTaskView()));
          },
        ),
      ],
    );
  }
}

