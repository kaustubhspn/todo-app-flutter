import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app_v2/services/password_generator.dart';
import 'package:to_do_app_v2/ui/pages/home_page.dart';
import 'package:to_do_app_v2/ui/reusable_widgets/action_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  late final TextEditingController _emailController;

  @override
  void initState() {
    final String strongPasswordSuggestion = generateStrongPassword();
    _passwordController = TextEditingController(text: strongPasswordSuggestion);
    _confirmPasswordController =
        TextEditingController(text: strongPasswordSuggestion);
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _confirmPasswordController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 80,
        child: Center(
          child: AppActionButton(
              onTap: () {
                Get.to(() => const TodoActionPage(),
                    transition: Transition.downToUp);
              },
              title: 'Continue'),
        ),
      ),
      appBar: AppBar(
        title: const Text('Welcome to ToDo'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              'Please sign up for ToDo!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Email address'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Password',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Confirm Password'),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'A strong password suggestion has been already prefilled for you.',
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
