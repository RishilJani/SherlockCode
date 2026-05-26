import 'package:flutter/material.dart';
import '../encryption_decryption/encryption_decryption_model.dart';

class DecryptionController {
  TextEditingController plainTextController = TextEditingController();
  TextEditingController cipherTextController = TextEditingController();
  TextEditingController keyController = TextEditingController(text: '0');

  String? decryptUsing({required EncryptionDecryptionModel method, String? decrypt}) {
    if (decrypt != null) {
      return method.decrypt(cipherText: decrypt);
    } else {
      plainTextController.text = method.decrypt(cipherText: cipherTextController.text);
      return null;
    }
  }
}