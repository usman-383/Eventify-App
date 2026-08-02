import 'dart:typed_data';
import 'package:flutter/material.dart';

class UserProfile {
  String name;
  String email;
  String? avatarUrl;
  Uint8List? avatarBytes;
  String? avatarPath;

  UserProfile({
    required this.name,
    required this.email,
    this.avatarUrl,
    this.avatarBytes,
    this.avatarPath,
  });
}

class AuthService extends ChangeNotifier {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  bool _isLoggedIn = true;
  UserProfile? _currentUser = UserProfile(
    name: 'Ahmed Khan',
    email: 'ahmed.khan@example.com',
    avatarUrl:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=400&auto=format&fit=crop',
  );

  bool get isLoggedIn => _isLoggedIn;
  UserProfile? get currentUser => _currentUser;

  Future<bool> login(
    String email,
    String password, {
    Uint8List? customAvatarBytes,
    String? customAvatarPath,
  }) async {
    await Future.delayed(const Duration(milliseconds: 600));

    String name = email.split('@').first;
    if (name.isNotEmpty) {
      name = name[0].toUpperCase() + name.substring(1);
    } else {
      name = 'User';
    }

    _currentUser = UserProfile(
      name: name,
      email: email,
      avatarBytes: customAvatarBytes,
      avatarPath: customAvatarPath,
      avatarUrl: (customAvatarBytes == null && customAvatarPath == null)
          ? 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=400&auto=format&fit=crop'
          : null,
    );
    _isLoggedIn = true;
    notifyListeners();
    return true;
  }

  Future<bool> signUp(
    String name,
    String email,
    String password, {
    Uint8List? customAvatarBytes,
    String? customAvatarPath,
  }) async {
    await Future.delayed(const Duration(milliseconds: 600));

    _currentUser = UserProfile(
      name: name.isNotEmpty ? name : 'User',
      email: email,
      avatarBytes: customAvatarBytes,
      avatarPath: customAvatarPath,
      avatarUrl: (customAvatarBytes == null && customAvatarPath == null)
          ? 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=400&auto=format&fit=crop'
          : null,
    );
    _isLoggedIn = true;
    notifyListeners();
    return true;
  }

  void updateAvatarBytes(Uint8List bytes) {
    if (_currentUser != null) {
      _currentUser!.avatarBytes = bytes;
      _currentUser!.avatarPath = null;
      _currentUser!.avatarUrl = null;
      notifyListeners();
    }
  }

  void updateAvatarPath(String path) {
    if (_currentUser != null) {
      _currentUser!.avatarPath = path;
      _currentUser!.avatarBytes = null;
      _currentUser!.avatarUrl = null;
      notifyListeners();
    }
  }

  void logout() {
    _isLoggedIn = false;
    _currentUser = null;
    notifyListeners();
  }
}
