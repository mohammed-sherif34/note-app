import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/views/edite_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, EditeNoteView.id);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.only(bottom: 24, left: 8, top: 16),
        decoration: BoxDecoration(
            color: Colors.orange, borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              isThreeLine: true,
              //title decoration
              title: const Padding(
                padding: EdgeInsets.only(left: 8, bottom: 24, top: 16),
                child: Text(
                  'Flutter tips',
                  style: TextStyle(color: Colors.black, fontSize: 28),
                ),
              ),
               //sub title decoration
              subtitle: Padding(
                padding: const EdgeInsets.only(right: 115.0),
                child: Column(
                  children: [
                    //part one
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Build yor Career With',
                        style: TextStyle(
                            color: Colors.black.withOpacity(.4), fontSize: 18),
                      ),
                    ),
                    //part two
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 38.0, top: 8, bottom: 24),
                      child: Text('Tharwat samy',
                          style: TextStyle(
                              color: Colors.black.withOpacity(.4),
                              fontSize: 18)),
                    ),
                  ],
                ),
              ),
              trailing: const Padding(
                  padding: EdgeInsets.only(top: 24.0),
                  child: Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.black,
                    size: 20,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text('May 21.2022',
                  style: TextStyle(
                      color: Colors.black.withOpacity(.4), fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }
}
