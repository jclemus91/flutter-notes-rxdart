
import 'package:notes/model/note.dart';
import 'package:notes/repository/note_respository.dart';
import 'package:notes/ui/add/add_note_bloc.dart';
import 'package:rxdart/rxdart.dart';

DetailNoteBloc detailNoteBloc = DetailNoteBloc(noteRepository);

class DetailNoteBloc {

  NoteRepository _noteRepository;
  final noteSubject = BehaviorSubject<Note>();

  DetailNoteBloc(NoteRepository noteRepository) {
    _noteRepository = noteRepository;
  }

  Note getNote(int position) {
    _noteRepository.getNotes()[position];
  }

  void dispose() {
    noteSubject.close();
  }

}