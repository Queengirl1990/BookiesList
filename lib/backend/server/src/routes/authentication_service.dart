import 'package:http/http.dart' as http;

class AuthenticationService {
  static const String baseUrl = 'http://dein-server/api';

  Future<bool> signIn(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: {'username': username, 'password': password},
    );

    return response.statusCode == 200;
  }
}
