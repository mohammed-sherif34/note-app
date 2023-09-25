import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.iconshape, required this.title});
  final IconData iconshape;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          height: 70,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 28,
          ),
        ),
        const Spacer(),
        CustomIcon(iconshape: iconshape),
      ],
    );
  }
}
