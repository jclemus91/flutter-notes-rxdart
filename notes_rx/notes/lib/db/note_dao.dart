import 'package:notes/model/note.dart';

abstract class NoteDao {
  void addNote(Note note);
  List<Note> getNotes();
}
