import 'package:notes/model/note.dart';
import 'package:notes/repository/note_respository.dart';
import 'package:rxdart/rxdart.dart';

class DetailNoteBloc {
  NoteRepository _noteRepository;

  final noteSubject = BehaviorSubject<Note>();

  DetailNoteBloc(NoteRepository noteRepository) {
    _noteRepository = noteRepository;
  }

  Note getNote(int position) {
    noteSubject.sink.add(_noteRepository.getNote(position));
  }

  void dispose() {
    noteSubject.close();
  }
}
