import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.iconshape});
  final IconData iconshape;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(.05),
      ),
      child: Center(child: Icon(iconshape)),
    );
  }
}
