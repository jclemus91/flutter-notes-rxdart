import 'package:notes/db/impl/note_dart_impl.dart';
import 'package:notes/db/note_dao.dart';
import 'package:notes/model/note.dart';
import 'package:notes/repository/note_respository.dart';
import 'package:rxdart/subjects.dart';


final NoteDao _noteDao = NoteDaoImpl();
final NoteRepository noteRepository = NoteRepository(_noteDao);

class AddNoteBloc {
  NoteRepository _noteRepository;
  final navigatorAddNote = _NavigatorAddNote();

  AddNoteBloc(NoteRepository noteRepository) {
    _noteRepository = noteRepository;
  }

  void createNote(String title, String message) {
    _noteRepository.addNote(Note(title, message));
    cancelAction();
  }

  void cancelAction() {
    navigatorAddNote.goBack.add(Object());
  }

  void dispose() {
    navigatorAddNote.goBack.close();
  }

}

class _NavigatorAddNote {
  final goBack = PublishSubject<Object>();
}