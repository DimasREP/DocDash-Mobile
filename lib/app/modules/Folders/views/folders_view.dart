import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:docdash_mobile/app/data/folders_models.dart';
import '../controllers/folders_controller.dart';

class FoldersView extends GetView<FoldersController> {
  const FoldersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Folders'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.toNamed("/tambah-folders");
            },
          ),
        ],
      ),
      body: Obx(
        () => controller.foldersList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.foldersList.length,
                itemBuilder: (context, index) {
                  var folders = controller.foldersList[index];
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      title: Text(
                        folders.folderName.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Biru sebagai tema utama
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward, color: Colors.blue),
                      onTap: () {
                        // Tambahkan navigasi ke tampilan detail di sini
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
