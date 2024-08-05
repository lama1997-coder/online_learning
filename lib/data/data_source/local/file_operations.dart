import 'package:flutter/services.dart';

class FileOperations {
  Future<dynamic> getDataFormFile(String path) async {
    return await rootBundle.loadString(path);
  }
}
 