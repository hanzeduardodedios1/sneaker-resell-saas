// lib/config.dart
import 'dart:io';
import 'package:flutter/foundation.dart'; // For kIsWeb

class ApiConfig {
  static String get baseUrl {
    if (kIsWeb) {
      // For Flutter Web, localhost works fine
      return "http://localhost:8000"; 
    } else if (Platform.isAndroid) {
      // Android Emulator uses this special IP to talk to the host (your PC)
      return "http://10.0.2.2:8000"; 
    } else {
      // iOS Simulator uses localhost
      return "http://localhost:8000";
    }
  }
}