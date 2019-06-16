import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:notes/repository/note_respository.dart';
import 'package:notes/ui/add/add_note_bloc.dart';

class _NoteRepositoryMock extends Mock implements NoteRepository {}

void main() {
  _NoteRepositoryMock _noteRepository;
  AddNoteBloc _addNoteBloc;

  setUp(() {
    _noteRepository = _NoteRepositoryMock();
    _addNoteBloc = AddNoteBloc(_noteRepository);
  });

  test(
    'exit action', () async {
    _addNoteBloc.navigatorAddNote.goBack.listen(expectAsync1((result) {
      expect(result, isInstanceOf<Object>());
    }));
    _addNoteBloc.cancelAction();
  });

  test('save note and exit', () {
    _addNoteBloc.navigatorAddNote.goBack.listen((result) {
      expect(result, isInstanceOf<Object>());
    });
    _addNoteBloc.createNote("title", "message");
  });
}
