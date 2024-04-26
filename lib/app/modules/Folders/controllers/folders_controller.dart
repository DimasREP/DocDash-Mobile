import 'dart:convert';

import 'package:get/get.dart';
import 'package:docdash_mobile/app/data/folders_models.dart';
import 'package:docdash_mobile/app/providers/api.dart';
import 'package:docdash_mobile/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;

class FoldersController extends GetxController {
  var foldersList = <Folders>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchFolder();
  }

  Future<void> fetchFolder() async {
    try {
      var apiUrl = '${Api.baseUrl}folders';
      var headers = await Api.getHeaders();

      var response = await http.get(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body)['rows'];
        foldersList
            .assignAll(jsonResponse.map((model) => Folders.fromJson(model)));
      } else {
        throw Exception('Failed to load folders');
      }
    } catch (e) {
      print('Error during fetching folders: $e');
    }
  }

  //  fungsi create,
  Future<void> tambahFolders(String FolderName, String userId) async {
    
    try {
      if (FolderName.isEmpty || userId.isEmpty
          ) {
        Get.snackbar('Error', 'Semua field harus diisi');
        return;
      }

      var apiUrl = '${Api.baseUrl}folders';
      var headers = await Api.getHeaders();

      var response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: {
          'user_id' : userId,
          'FolderName': FolderName,
        },
      );

      if (response.statusCode == 200) {
        Get.snackbar('Sukses', 'Folders berhasil ditambahkan');
        fetchFolder();
        Get.offAndToNamed(Routes.FOLDERS); // Redirect ke halaman folder
      } else {
        throw Exception('Failed to add folders');
      } 
    } catch (e) {
      print('Error during tambah folders: $e');
      if (e is http.Response) {
        print('Response Body: ${e.body}');
      }
    }
  }

  // edit folders
//  Future<void> editFolders(Folders folders, String newFolderName, String userId) async {
//   try {
//     var apiUrl = '${Api.baseUrl}/folders/${folders.id}';
//     var headers = await Api.getHeaders();

//     var response = await http.put(
//       Uri.parse(apiUrl),
//       headers: headers,
//       body: {
//         'user_id' : userId,
//         'FolderName': newFolderName,

//       },
//     );

//     if (response.statusCode == 200) {
//       Get.snackbar('Success', 'Folder successfully updated');
//       fetchData(); // Fetch updated data after successful edit
//       Get.offAndToNamed(Routes.FOLDERS); // Redirect to folders page
//     } else {
//       throw Exception('Failed to edit folders');
//     }
//   } catch (e) {
//     print('Error during edit folders: $e');
//   }
// }

   // show folders
  // void showFoldersDetails(Folders folders) {
  //   Get.to(() => DetailFoldersView(folders: folders));
  // }


// delete folders
  // Future<void> deleteFolders(Folders folders) async {
  //   try {
  //     var apiUrl = '${Api.baseUrl}/folders/${folders.id}';
  //     var headers = await Api.getHeaders();

  //     var response = await http.delete(
  //       Uri.parse(apiUrl),
  //       headers: headers,
  //     );

  //     if (response.statusCode == 200) {
  //       Get.snackbar('Sukses', 'Folders berhasil dihapus');
  //       fetchData();
  //       // Optionally, you can navigate to a different page after deletion
  //     } else {
  //       throw Exception('Failed to delete folders');
  //     }
  //   } catch (e) {
  //     print('Error during delete folders: $e');
  //   }
  // }
}
