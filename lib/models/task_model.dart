import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject{
  @HiveField(0)
  String title;
  @HiveField(1)
  int iconCategory;
  @HiveField(2)
  int colorCategory;
  @HiveField(3)
 final String time;
  @HiveField(4)
  String discription;
  @HiveField(5)
  bool isDone;
  TaskModel({required this.title,required this.iconCategory,required this.colorCategory,required this.time,required this.discription,this.isDone=false});
}