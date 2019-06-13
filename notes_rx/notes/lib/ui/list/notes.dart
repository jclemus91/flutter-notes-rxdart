import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes/model/note.dart';
import 'package:notes/ui/add/add_note.dart';
import 'package:notes/ui/add/add_note_bloc.dart';
import 'package:notes/ui/detail/detail_note.dart';

import 'notes_bloc.dart';

class NotesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NotesScreenState();
  }
}

class _NotesScreenState extends State<NotesScreen> {

  final _notesBloc = NotesBloc(noteRepository);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: StreamBuilder(
        stream: _notesBloc.notesSubject,
        builder: (context, snapshot) {
          List<Note> notes;
          if (snapshot.hasData) {
            notes = snapshot.data;
          }

          if (notes != null && notes.isNotEmpty) {
            return ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, position) {
                  Note note = notes[position];
                  return Container(
                    child: Card(
                      child: InkWell(
                        onTap: () {
                          _goToDetail(position);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(note.title),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: Container(
                child: Text("No hay información"),
              ),
            );
          }
        },
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: _fabPressed, child: Icon(Icons.add)),
    );
  }

  @override
  void dispose() {
    _notesBloc.dispose();
    super.dispose();
  }

  void _fabPressed() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddNoteScreen())
    );
  }

  void _goToDetail(int position) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailNoteScreen.withPosition(position)
        )
    );
  }
}
