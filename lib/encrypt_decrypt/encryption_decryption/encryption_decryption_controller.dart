import 'package:flutter/material.dart';

import 'encryption_decryption_model.dart';

class EncryptionDecryptionController {
  EncryptionDecryptionModel model;

  EncryptionDecryptionController({required this.model}) {
    if (model is CeaseCipher) {
      model.keyController = TextEditingController(text: '3');
    } else {
      model.keyController = TextEditingController();
    }
  }

  String encryptText({required String plainText}) {
    // key checking can be done here
    return this.model.encrypt(plainText: plainText);
  }

  String decryptText({required String cipherText}) {
    // key checking can be done here
    return this.model.decrypt(cipherText: cipherText);
  }
}
