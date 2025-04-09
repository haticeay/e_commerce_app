import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final rememberMeProvider = StateProvider<bool>((ref) => false);
final rememberedEmailProvider = StateProvider<String?>((ref) => null);
final rememberedPasswordProvider = StateProvider<String?>((ref) => null);

Future<void> saveRememberMeInfo(
  WidgetRef ref,
  bool remember,
  String? email,
  String? password,
) async {
  final prefs = await SharedPreferences.getInstance();
  if (remember) {
    await prefs.setBool('rememberMe', true);
    await prefs.setString('rememberedEmail', email ?? '');
    await prefs.setString('rememberedPassword', password ?? '');
  } else {
    await prefs.setBool('rememberMe', false);
    await prefs.remove('rememberedEmail');
    await prefs.remove('rememberedPassword');
  }
}

Future<void> loadRememberMeInfo(WidgetRef ref) async {
  final prefs = await SharedPreferences.getInstance();
  final rememberMe = prefs.getBool('rememberMe') ?? false;
  final email = prefs.getString('rememberedEmail');
  final password = prefs.getString('rememberedPassword');

  ref.read(rememberMeProvider.notifier).state = rememberMe;
  ref.read(rememberedEmailProvider.notifier).state = email;
  ref.read(rememberedPasswordProvider.notifier).state = password;
}
