import 'package:flutter/material.dart';
import 'package:note_app/widgets/add_note_bottom_sheet.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          context: context,
          builder: ((context) {
            return const AddNoteBottomSheet();
          }),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
