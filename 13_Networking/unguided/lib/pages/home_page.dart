import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/note_controller.dart';
import 'add_note_page.dart';

class HomePage extends StatelessWidget {
  final NoteController controller = Get.put(NoteController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Catatan")),
      body: Obx(() {
        if (controller.notes.isEmpty) {
          return const Center(child: Text("Belum ada catatan"));
        }

        return ListView.builder(
          itemCount: controller.notes.length,
          itemBuilder: (context, index) {
            final note = controller.notes[index];
            return Card(
              margin: const EdgeInsets.all(8),
              child: ListTile(
                title: Text(note.title),
                subtitle: Text(note.description),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    controller.deleteNote(index);
                  },
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddNotePage());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
