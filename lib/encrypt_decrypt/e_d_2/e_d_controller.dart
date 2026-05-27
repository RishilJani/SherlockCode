import 'package:flutter/material.dart';
import 'e_d_model.dart';

class EDController {
  EDModel2 model;
  late TextEditingController keyController;

  EDController({required this.model}) {
    if (model is CeaserCipher2) {
      keyController = TextEditingController(text: '3');
    } else {
      keyController = TextEditingController();
    }
  }

  String encryptText({required String plainText}) {
    dynamic key;
    if (model is CeaserCipher2) {
      key = int.tryParse(keyController.text.toString());
      if (key == null) {
        return "";
      }
    }
    return this.model.encrypt(plainText: plainText, key: key);
  }

  String decryptText({required String cipherText}) {
    dynamic key;
    if (model is CeaserCipher2) {
      key = int.tryParse(keyController.value.toString());
      if (key == null) {
        return "";
      }
    }
    return this.model.decrypt(cipherText: cipherText, key: key);
  }
}
