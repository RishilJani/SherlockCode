import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../encryption_decryption/encryption_decryption_model.dart';

class EncryptionController extends GetxController {
  TextEditingController plainTextController = TextEditingController();
  TextEditingController cipherTextController = TextEditingController();

  String? encryptUsing({required EncryptionDecryptionModel method, String? encrypt}) {
    if (encrypt != null) {
      String ans = method.encrypt(plainText: encrypt);
      return ans;
    } else {
      cipherTextController.text =
          method.encrypt(plainText: plainTextController.text);
      return null;
    }
  }
}
