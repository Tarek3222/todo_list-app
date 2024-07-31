import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_list_app/cubits/taskes_cubit/taskes_cubit.dart';
import 'package:todo_list_app/models/task_model.dart';
import 'package:todo_list_app/views/edit_task_view.dart';
import 'package:todo_list_app/views/widgets/custom_icon.dart';
import 'package:todo_list_app/views/widgets/details_todo_item.dart';

class CustomTodoItem extends StatefulWidget {
  const CustomTodoItem({super.key, required this.task});
  final TaskModel task;
  @override
  State<CustomTodoItem> createState() => _CustomTodoItemState();
}

class _CustomTodoItemState extends State<CustomTodoItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Dismissible(
          key: Key(widget.task.key.toString()),
          onDismissed: (_){
            widget.task.delete();
            BlocProvider.of<TaskesCubit>(context).fetchAllTaskes();
            Fluttertoast.showToast(
              msg: 'Task Deleted',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          },
          child: ListTile(
            onTap: () {
              showModalBottomSheet(context: context, builder: (context) => DetailsTodoItem(task: widget.task,));
            },
            leading:  Icon(
             IconData(widget.task.iconCategory, fontFamily: 'MaterialIcons'),
              color: Color(widget.task.colorCategory),
              size: 50,
            ),
            title:  Text(
              widget.task.title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Kalam',
                  decoration:widget.task.isDone ? TextDecoration.lineThrough : TextDecoration.none,
                  decorationThickness:widget.task.isDone ? 2 :0,
                  decorationColor: Colors.black,
                  ),
            ),
            subtitle:  Text(
              widget.task.time,
              style:const TextStyle(
                  color: Colors.black87, fontFamily: 'Kalam', fontSize: 15),
            ),
            trailing: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                customCheckBox(
                  context,
                  isChecked: widget.task.isDone,
                  onChanged: (value) {
                    setState(() {  
                      widget.task.isDone = value!;
                      widget.task.save();
                    });
                    if(widget.task.isDone){
                      Fluttertoast.showToast(
                        msg: 'Task Done',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    }
                  },
                ),
                CustomIcon(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  EditTaskView(task: widget.task,)));
                  },
                  icon: Icons.edit,
                  backgroundColor: Colors.grey.withOpacity(0.1),
                  iconColor: Colors.black,
                ),
              ],
            ),
          ),
        ),
        const Divider(
          thickness: 0.5,
          color: Colors.grey,
        ),
      ],
    );
  }
}

Widget customCheckBox(BuildContext context,
    {required bool isChecked, required Function(bool?) onChanged}) {
  return Checkbox(
    activeColor: Colors.black,
    checkColor: Colors.white,
    value: isChecked,
    onChanged: onChanged,
  );
}
