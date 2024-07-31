import 'package:flutter/material.dart';
import 'package:todo_list_app/views/widgets/background_home_view.dart';
import 'package:todo_list_app/views/widgets/body_home_view_body.dart';
import 'package:todo_list_app/views/widgets/header_home_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Stack(
      children: [
          BackgroundHomeView(),
        Positioned(
          top: 50,
          left: 0,
          right: 0,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                HeaderHomeView(),
                SizedBox(height: 20),
                BodyHomeViewBody(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
