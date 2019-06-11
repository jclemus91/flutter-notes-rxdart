import 'package:notes/db/impl/note_dart_impl.dart';
import 'package:notes/db/note_dao.dart';
import 'package:notes/model/note.dart';
import 'package:notes/repository/note_respository.dart';

final NoteDao _noteDao = NoteDaoImpl();
final NoteRepository _noteRepository = NoteRepository(_noteDao);
final AddNoteBloc addNoteBloc = AddNoteBloc(_noteRepository);

class AddNoteBloc {
  NoteRepository _noteRepository;

  AddNoteBloc(NoteRepository noteRepository) {
    this._noteRepository = noteRepository;
  }

  void createNote(String title, String message) {
    _noteRepository.addNote(Note(title, message));
  }
}
