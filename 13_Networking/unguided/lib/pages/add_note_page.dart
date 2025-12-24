import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/note_controller.dart';

class AddNotePage extends StatelessWidget {
  final NoteController controller = Get.find();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Catatan")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Judul",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descController,
              decoration: const InputDecoration(
                labelText: "Deskripsi",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.addNote(titleController.text, descController.text);
                Get.back();
              },
              child: const Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
