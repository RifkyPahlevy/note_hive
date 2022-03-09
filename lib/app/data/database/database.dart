import 'package:hive_flutter/hive_flutter.dart';
part 'database.g.dart';

@HiveType(typeId: 0)
class Notes extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? judul;

  @HiveField(2)
  String? deskripsi;
}

class NoteManager {
  static Box<Notes> getAllNotes() => Hive.box<Notes>('notes');
}
