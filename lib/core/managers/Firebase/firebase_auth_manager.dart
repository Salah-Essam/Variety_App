import 'package:firebase_auth/firebase_auth.dart';
import 'package:variety_app/core/managers/shared_preferences_manager.dart';

class FirebaseManager {
  FirebaseManager._();
  static final FirebaseManager instance = FirebaseManager._();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signUpWithEmail({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await result.user?.updateDisplayName(name);
      await result.user?.reload();
      await SharedPreferencesManager.setToken(
        token: "${FirebaseManager.instance.getIdToken()}",
      );
      return _auth.currentUser;
    } catch (e) {
      rethrow;
    }
  }

  Future signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await SharedPreferencesManager.setToken(
        token: "${FirebaseManager.instance.getIdToken()}",
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  Future signOut() async {
    await _auth.signOut();
  }

  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  Future<bool> isLoggedIn() async {
    return _auth.currentUser != null;
  }

  Future<String?> getIdToken() async {
    return await _auth.currentUser?.getIdToken();
  }
}
