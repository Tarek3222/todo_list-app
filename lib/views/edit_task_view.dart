import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_list_app/cubits/taskes_cubit/taskes_cubit.dart';
import 'package:todo_list_app/models/task_model.dart';
import 'package:todo_list_app/views/widgets/categories_edit_list_view.dart';
import 'package:todo_list_app/views/widgets/custom_button.dart';
import 'package:todo_list_app/views/widgets/custom_icon.dart';
import 'package:todo_list_app/views/widgets/custom_text_form_field.dart';

class EditTaskView extends StatefulWidget {
  const EditTaskView({super.key, required this.task});
  final TaskModel task;
  @override
  State<EditTaskView> createState() => _EditTaskViewState();
}

class _EditTaskViewState extends State<EditTaskView> {
  String? title, description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Edit Task',
          style: TextStyle(fontFamily: 'Kalam'),
        ),
        centerTitle: true,
        actions: [
          CustomIcon(
            icon: Icons.delete,
            onTap: () {
              widget.task.delete();
              BlocProvider.of<TaskesCubit>(context).fetchAllTaskes();
              Navigator.pop(context);
              Fluttertoast.showToast(
                msg: 'Task Deleted',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.grey[400],
                textColor: Colors.white,
                fontSize: 16.0,
              );
            },
            backgroundColor: Colors.grey.withOpacity(0.3),
            iconColor: Colors.white,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                hintText: widget.task.title,
                onChanged: (value) {
                  title = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                hintText: widget.task.discription,
                maxLines: 5,
                onChanged: (value) {
                  description = value;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Categories',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'Kalam'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CategoriesEditListView(
                task: widget.task,
              ),
              const SizedBox(
                height: 210,
              ),
              CustomButton(
                text: 'Edit Task',
                onPressed: () {
                  widget.task.title = title ?? widget.task.title;
                  widget.task.discription =
                      description ?? widget.task.discription;
                  widget.task.save();
                  BlocProvider.of<TaskesCubit>(context).fetchAllTaskes();
                  Navigator.pop(context);
                  Fluttertoast.showToast(
                      msg: "Task Edited Successfully",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
