import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/database/database.dart';

class EditNoteController extends GetxController {
  TextEditingController juduC = TextEditingController();
  TextEditingController desC = TextEditingController();

  RxBool isLoading = false.obs;

  Future<void> editNote(Notes note) async {
    note.judul = juduC.text;
    note.deskripsi = desC.text;

    note.save();
  }
}
