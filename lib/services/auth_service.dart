import 'dart:convert';
import 'package:crypto/crypto.dart';

class AuthService {
  AuthService(){
    _users = {
      'user@example.com': {
        'password': hashPassword('userpass'),
        'firstName': 'Jane',
        'lastName': 'Doe',
        'role': 'User',
      },
      'admin@example.com': {
        'password': hashPassword('adminpass'),
        'firstName': 'Admin',
        'lastName': 'User',
        'role': 'Admin',
      },
    };
  }
  // Tableau associatif local des utilisateurs
  Map<String, Map<String, dynamic>> _users = {};

  // Méthode de connexion
  Future<Map<String, dynamic>?> login(String email, String password) async {
      // Implémentation à venir avec le hachage sécurisé
      if (_users.containsKey(email)) {
        String hashedPassword = hashPassword(password);
        if(_users[email]!["password"] == hashedPassword){
          return _users[email];
        }
      }
      return null;
  }

  String hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}