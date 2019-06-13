import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes/model/note.dart';
import 'package:notes/ui/add/add_note_bloc.dart';

import 'detail_note_bloc.dart';

class DetailNoteScreen extends StatefulWidget {
  int _position;

  DetailNoteScreen.withPosition(int position) {
    _position = position;
  }

  @override
  State<StatefulWidget> createState() {
    return _DetailNoteState(_position);
  }
}

class _DetailNoteState extends State<DetailNoteScreen> {
  final _detailNoteBloc = DetailNoteBloc(noteRepository);

  _DetailNoteState(int position) {
    _detailNoteBloc.getNote(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note Detail"),
      ),
      body: SafeArea(
          minimum: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              StreamBuilder<Note>(
                stream: _detailNoteBloc.noteSubject,
                builder: (context, snapshot) {
                  var note;
                  if (snapshot.hasData) {
                    note = snapshot.data;
                  }
                  if (note != null) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Title: " + note.title),
                        SizedBox(
                          height: 14.0,
                        ),
                        Text("Message: " + note.message)
                      ],
                    );
                  } else {
                    return Text("No data");
                  }
                },
              ),
            ],
          )),
    );
  }

  @override
  void dispose() {
    _detailNoteBloc.dispose();
    super.dispose();
  }
}
