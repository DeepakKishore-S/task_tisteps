import 'package:flutter/material.dart';
import 'package:tisteps_task/core/styles/app_text_style.dart';
import '../widget/user_list_widget.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Users List',
        style: AppTextStyle.xxxLargeBlackBold,
      )),
      body: const UserList(),
    );
  }
}
