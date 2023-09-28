
import 'package:flutter/cupertino.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/color_list.dart';

class EditeVColorList extends StatefulWidget {
  const EditeVColorList({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditeVColorList> createState() => _EditeVColorListState();
}

class _EditeVColorListState extends State<EditeVColorList> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kcolorList.indexOf(Color(widget.note.color));
    super.initState();
  }

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
              widget.note.color = kcolorList[index].value;

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