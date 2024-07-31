import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jiffy/jiffy.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_list_app/cubits/taskes_cubit/taskes_cubit.dart';
import 'package:todo_list_app/models/task_model.dart';

class DetailsTodoItem extends StatelessWidget {
  const DetailsTodoItem({super.key, required this.task});
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Icon(
              IconData(task.iconCategory, fontFamily: 'MaterialIcons'),
              color: Color(task.colorCategory),
              size: 50,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              task.title,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  fontFamily: 'Kalam'),
            ),
            const SizedBox(
              height: 10,
            ),
            task.isDone
                ? const Text(
                    'Task Done',
                    style: TextStyle(fontFamily: 'Kalam', color: Colors.black),
                  )
                : Text(
                    textAlign: TextAlign.center,
                    "Task to be done on: ${Jiffy.now().yMMMMd}",
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 15,
                      fontFamily: 'Kalam',
                    ),
                  ),
            Divider(
              color: Colors.grey.withOpacity(0.1),
              endIndent: 20,
              indent: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              task.discription,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black87, fontSize: 17, fontFamily: 'Kalam'),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                task.delete();
                BlocProvider.of<TaskesCubit>(context).fetchAllTaskes();
                Navigator.pop(context);
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
              child: Lottie.asset(
                'assets/animation/Animation2.json',
                width: 250,
                height: 250,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
