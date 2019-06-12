

import 'package:notes/model/note.dart';
import 'package:notes/repository/note_respository.dart';
import 'package:notes/ui/add/add_note_bloc.dart';
import 'package:rxdart/rxdart.dart';

NotesBloc notesBloc = NotesBloc(noteRepository);

class NotesBloc {

  NoteRepository _noteRepository;

  final notesSubject = BehaviorSubject<List<Note>>();

  NotesBloc(NoteRepository noteRepository) {
    _noteRepository = noteRepository;
    notesSubject.sink.add(_noteRepository.getNotes());
  }

  void dispose() {
    notesSubject.close();
  }

}