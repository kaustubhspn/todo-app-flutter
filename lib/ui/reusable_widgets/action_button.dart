import 'package:flutter/material.dart';

/// A reusable button widget with a blue background color and white text.
class AppActionButton extends StatelessWidget {
  /// A function to call when the button is tapped.
  final void Function()? onTap;

  /// The text to display on the button.
  final String title;

  const AppActionButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0), color: Colors.blue),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
