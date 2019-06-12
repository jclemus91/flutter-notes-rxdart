import 'package:notes/model/note.dart';

import '../note_dao.dart';

List<Note> _notesDB = List<Note>();

class NoteDaoImpl extends NoteDao {

  @override
  void addNote(Note note) {
    _notesDB.add(note);
  }

  @override
  List<Note> getNotes() {
    return _notesDB;
  }

}