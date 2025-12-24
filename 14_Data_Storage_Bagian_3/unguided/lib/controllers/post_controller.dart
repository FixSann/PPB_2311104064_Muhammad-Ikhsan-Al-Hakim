import 'package:get/get.dart';
import '../services/api_service.dart';

class PostController extends GetxController {
  final ApiService apiService = ApiService();

  var posts = <dynamic>[].obs;
  var isLoading = false.obs;

  Future<void> getPosts() async {
    isLoading.value = true;
    try {
      posts.value = await apiService.fetchPosts();
      Get.snackbar('Sukses', 'Data berhasil diambil');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addPost() async {
    try {
      await apiService.createPost();
      Get.snackbar('Sukses', 'Data berhasil ditambahkan');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> updatePost() async {
    try {
      await apiService.updatePost();
      Get.snackbar('Sukses', 'Data berhasil diperbarui');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> deletePost() async {
    try {
      await apiService.deletePost();
      posts.removeWhere((post) => post['id'] == 1);
      Get.snackbar('Sukses', 'Data berhasil dihapus');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
