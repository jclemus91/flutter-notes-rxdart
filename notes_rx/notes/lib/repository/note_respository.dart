
import 'package:notes/db/note_dao.dart';
import 'package:notes/model/note.dart';

class NoteRepository {

  NoteDao _noteDao;

  NoteRepository(NoteDao noteDao) {
    this._noteDao = noteDao;
  }

  void addNote(Note note) {
    _noteDao.addNote(note);
  }

  List<Note> getNotes() {
    return _noteDao.getNotes();
  }

  Note getNote(int position) {
    return _noteDao.getNote(position);
  }

}