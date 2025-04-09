import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heraninda/view/authenticate/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

// Anahtar tanımları
const String _usersKey = 'users';

// SharedPreferences örneğini tutan provider
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferences henüz başlatılmadı.');
});

final userServiceProvider = StateNotifierProvider<UserService, List<User>>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return UserService(sharedPreferences);
});

class UserService extends StateNotifier<List<User>> {
  final SharedPreferences _prefs;

  UserService(this._prefs) : super(_loadUsers(_prefs));

  static List<User> _loadUsers(SharedPreferences prefs) {
    final usersStringList = prefs.getStringList(_usersKey) ?? [];
    return usersStringList.map((userString) => User.fromJson(jsonDecode(userString))).toList();
  }

  Future<void> _saveUsers(List<User> users) async {
    final usersStringList = users.map((user) => jsonEncode(user.toJson())).toList();
    await _prefs.setStringList(_usersKey, usersStringList);
  }

  void addUser(String name, String email, String password, String confirmPassword) async {
    if (password != confirmPassword) {
      throw Exception("Şifreler uyuşmuyor");
    }

    final newUser = User(
      id: const Uuid().v4(),
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );

    state = [...state, newUser];
    await _saveUsers(state); 
  }

  Future<void> removeUser(String userId) async {
    state = state.where((user) => user.id != userId).toList();
    await _saveUsers(state);
  }

  Future<void> updateUser(User updatedUser) async {
    state = state.map((user) => user.id == updatedUser.id ? updatedUser : user).toList();
    await _saveUsers(state);
  }
}
