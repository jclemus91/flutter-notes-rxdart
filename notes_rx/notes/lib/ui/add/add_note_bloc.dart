import 'package:notes/db/impl/note_dart_impl.dart';
import 'package:notes/db/note_dao.dart';
import 'package:notes/model/note.dart';
import 'package:notes/repository/note_respository.dart';
import 'package:rxdart/subjects.dart';


final NoteDao _noteDao = NoteDaoImpl();
final NoteRepository noteRepository = NoteRepository(_noteDao);
final AddNoteBloc addNoteBloc = AddNoteBloc(noteRepository);

class AddNoteBloc {
  NoteRepository _noteRepository;
  final navigatorAddNote = _NavigatorAddNote();

  AddNoteBloc(NoteRepository noteRepository) {
    _noteRepository = noteRepository;
  }

  void createNote(String title, String message) {
    _noteRepository.addNote(Note(title, message));
  }

  void cancelAction() {
    navigatorAddNote.goBack.sink.add(Object());
  }

  void dispose() {
    navigatorAddNote.goBack.close();
  }

}

class _NavigatorAddNote {
  final goBack = BehaviorSubject<Object>();
}