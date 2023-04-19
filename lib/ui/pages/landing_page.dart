import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/ui/pages/sign_up_page.dart';

import '../reusable_widgets/action_button.dart';
import 'login_page.dart';

/// The landing page widget for the ToDo app.
class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:
            BoxDecoration(color: Theme.of(context).colorScheme.onPrimary),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.local_activity,
                color: Colors.blue,
                size: 200,
              ),
              Text(
                'ToDo App',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 60,
              ),
              AppActionButton(
                title: 'Login',
                onTap: () {
                  Get.to(() => const LoginPage(),
                      transition: Transition.downToUp);
                },
              ),
              const SizedBox(
                height: 40,
              ),
              AppActionButton(
                onTap: () {
                  Get.to(() => const SignupPage(),
                      transition: Transition.downToUp);
                },
                title: 'Signup',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
