import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<dynamic>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Gagal mengambil data');
    }
  }

  Future<void> createPost() async {
    final response = await http.post(
      Uri.parse('$baseUrl/posts'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'title': 'Flutter GetX',
        'body': 'Contoh POST dengan GetX',
        'userId': 1,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Gagal menambah data');
    }
  }

  Future<void> updatePost() async {
    final response = await http.put(
      Uri.parse('$baseUrl/posts/1'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'title': 'Updated Title',
        'body': 'Updated Body',
        'userId': 1,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Gagal update data');
    }
  }

  Future<void> deletePost() async {
    final response = await http.delete(Uri.parse('$baseUrl/posts/1'));

    if (response.statusCode != 200) {
      throw Exception('Gagal hapus data');
    }
  }
}
