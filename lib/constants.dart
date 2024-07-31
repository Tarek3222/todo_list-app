import 'package:flutter/material.dart';
import 'package:todo_list_app/models/category_model.dart';

const kPrimaryColor=Colors.grey;
const kTaskBox='taskes_box';

List<CategoryModel> kCategoriesList= const[
  CategoryModel(icon: Icons.movie, colorIcon: Color(0xff000000)),
  CategoryModel(icon: Icons.food_bank, colorIcon: Color(0xffFF0000)),
  CategoryModel(icon: Icons.sports_football, colorIcon: Color(0xff008000)),
  CategoryModel(icon: Icons.phone_enabled, colorIcon: Color(0xff0000FF)),
  CategoryModel(icon: Icons.menu_book, colorIcon: Color(0xffA020F0)),
  CategoryModel(icon: Icons.baby_changing_station, colorIcon: Color(0xffFFC0CB)),
  CategoryModel(icon: Icons.school, colorIcon: Color(0xffFFA500)),
  CategoryModel(icon: Icons.theater_comedy, colorIcon: Color(0xff00FFFF)),
  CategoryModel(icon: Icons.computer, colorIcon: Color(0xff4B0082)),
  CategoryModel(icon: Icons.stadium, colorIcon: Color(0xffdde26a)),
  CategoryModel(icon: Icons.emoji_food_beverage, colorIcon: Color(0xff008000)),
  CategoryModel(icon: Icons.music_note, colorIcon: Color(0xff0000FF)),
  CategoryModel(icon: Icons.phone_android_outlined, colorIcon: Color(0xffA020F0)),
  CategoryModel(icon: Icons.hotel_sharp, colorIcon: Color(0xffFFC0CB)),
  CategoryModel(icon: Icons.emoji_events, colorIcon: Color(0xff00FFFF)),
  CategoryModel(icon: Icons.run_circle_outlined, colorIcon: Color(0xff4B0082)),
  CategoryModel(icon: Icons.pool, colorIcon: Color(0xffdde26a)),
  CategoryModel(icon: Icons.shopping_cart, colorIcon: Color(0xff008000)),
  CategoryModel(icon: Icons.shower, colorIcon: Color(0xff0000FF)),
  CategoryModel(icon: Icons.games, colorIcon: Color(0xffA020F0)),
  CategoryModel(icon: Icons.sports_volleyball_rounded, colorIcon: Color(0xff008000)),
  CategoryModel(icon: Icons.airplane_ticket_outlined, colorIcon: Color(0xff0000FF)),
  CategoryModel(icon: Icons.sports_gymnastics, colorIcon: Color(0xffA020F0)),
  CategoryModel(icon: Icons.email, colorIcon: Color(0xff008000)),
];