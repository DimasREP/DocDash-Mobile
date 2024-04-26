import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:docdash_mobile/app/modules/Folders/controllers/folders_controller.dart';
import 'package:docdash_mobile/app/data/folders_models.dart';

class TambahFoldersView extends StatelessWidget {
  final FoldersController controller = Get.find<FoldersController>();
  final TextEditingController folderNameController = TextEditingController();
  final TextEditingController userIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Folders'),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             TextField(
              controller: userIdController,
              decoration: InputDecoration(
                labelText: 'ID User',
                border: OutlineInputBorder(),
              ),
            ),    
            SizedBox(height: 20),
             TextField(
              controller: folderNameController,
              decoration: InputDecoration(
                labelText: 'Nama Folder',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_validateInput()) {
                  controller.tambahFolders(
                    folderNameController.text,
                    userIdController.text,
                  );
                }
              },
              child: Text('Simpan', style: TextStyle(fontSize: 22),),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Warna tombol biru
                padding: EdgeInsets.symmetric(vertical: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _validateInput() {
    if (folderNameController.text.isEmpty || userIdController.text.isEmpty) {
      Get.snackbar('Error', 'Semua field harus diisi',
          backgroundColor: Colors.red, // Warna snackbar merah
          colorText: Colors.white, // Warna teks snackbar putih
      );
      return false;
    }
    return true;
  }
}
