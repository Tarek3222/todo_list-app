import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:todo_list_app/models/task_model.dart';
import 'package:todo_list_app/views/widgets/categories_list_view.dart';
import 'package:todo_list_app/views/widgets/custom_button.dart';
import 'package:todo_list_app/views/widgets/custom_text_form_field.dart';

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({super.key, this.isLoading=false});
  final bool isLoading;

  @override
  State<AddTaskForm> createState() => _AddNewTaskViewState();
}

class _AddNewTaskViewState extends State<AddTaskForm> {
  TimeOfDay selectedTime = TimeOfDay.now();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title,description,time;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
               const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  hintText: 'Task Title',
                  label: "Task Title",
                  onChanged:(data){
                    title = data;
                  } ,
                  validator: (data){
                    if(data?.isEmpty ?? true){
                      return 'title must not be empty';
                    }
                    return null;
                  },
                ),
               const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  hintText: 'Task Description',
                  label: "Task Description",
                  maxLines: 5,
                  onChanged: (data){
                    description = data;
                  },
                  validator: (data){
                    if(data?.isEmpty ?? true){
                      return 'description must not be empty';
                    }
                    return null;
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
               const CategoriesListView(),
               const SizedBox(height: 10,),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Time',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: 'Kalam'),
                  ),
                ),
               const SizedBox(height: 10,),
                timePicker(context),
                const SizedBox(height: 110,),
               widget.isLoading ? const CircularProgressIndicator() : CustomButton(
                  text: 'Add Task',
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                      formKey.currentState!.save();
                      TaskModel taskModel = TaskModel(
                        title: title!,
                        iconCategory: 203,
                        colorCategory: Colors.blue.value,
                        time: selectedTime.format(context),
                        discription: description!,
                      );
                      
                      BlocProvider.of<AddTaskCubit>(context).addNewTask(taskModel);
                    }else{
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                ),
                const SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      );
  }

  Widget timePicker(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[300],
      ),
      child: Row(
        children: [
          const SizedBox(width: 10,),
          Text(selectedTime.format(context),style:const TextStyle(fontSize: 20,color: Colors.black,fontFamily: 'Kalam'),),
          const Spacer(),
          IconButton(
            onPressed: () {
             showTimePicker(
                context: context,
                initialTime: selectedTime,
              ).then((value) {
                if (value != null) {
                  setState(() {
                    selectedTime = value;
                    time = selectedTime.format(context);
                  });
                }
              });
            },
            icon: const Icon(Icons.alarm),
            color: Colors.black,
          ),
          const SizedBox(width: 10,),
        ],
      ),
    );
  }
}
