import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/cubit/add_note_cubit/add_note_cubit.dart';
// import 'package:note_app/cubit/add_note_cubit/notes_cubit/notes_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.color, required this.isActive});
  //final void Function()? onTap;
  final Color color;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 36,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 36,
            backgroundColor: color,
          );
  }
}

class ColorList extends StatefulWidget {
  const ColorList({super.key, this.onTap});
  // final Color color;
  final void Function()? onTap;

  @override
  State<ColorList> createState() => _ColorListState();
}

class _ColorListState extends State<ColorList> {
  int currentIndex = 0;
 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        itemCount: kcolorList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;
              BlocProvider.of<AddNoteCubit>(context).color = kcolorList[index];
              setState(() {});
            },
            child: ColorItem(
              color: kcolorList[index],
              isActive: currentIndex == index,
            ),
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
