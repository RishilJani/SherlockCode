import 'package:cipher_decoder/encrypt_decrypt/encryption_decryption/encryption_decryption_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../utils/common_functions.dart';
import '../../utils/custom_exceptions.dart';
import '../decryption/decryption_controller.dart';
import '../encryption/encryption_controller.dart';
import 'encryption_decryption_model.dart';

class EncryptionDecryptionOptionsController extends GetxController {
  final int maxLimit = 5;
  RxString desc = ''.obs;
  RxList<EncryptionDecryptionController> options = [EncryptionDecryptionController(model: CeaseCipher())].obs;
  Rx<TextEditingController> plainTextController = TextEditingController().obs;
  Rx<TextEditingController> cipherTextController = TextEditingController().obs;

  void addWidget({required controller}) {
    EncryptionDecryptionController methodObj =
        EncryptionDecryptionController(model: CeaseCipher());
    if (options.length < maxLimit) {
      options.add(methodObj);
      onChange(controller: controller);
    } else {
      showSnackBar(
          title: "Max Limit Reached",
          message: "Can't add more methods",
          backgroundColor: cyberpunkDarkElevated,
          colorText: cyberpunkGreen);
    }
  }

  // on method change
  void updateWidget({required EncryptionDecryptionController methodController, index, controller, isEncrypt}) {
    options[index] = methodController;
    onChange(controller: controller, isEncrypt: isEncrypt);
    update([options]);
  }

  // on change plaint text / cipher text
  void onChange({controller, bool isEncrypt = true}) {
    if (isEncrypt) {
      String ans = plainTextController.value.text.toString();
      for (var met in options) {
        ans = met.encryptText(plainText: ans);
      }
      cipherTextController.value.text = ans;
    } else {
      String ans = cipherTextController.value.text.toString();
      for (var met in options) {
        ans = met.decryptText(cipherText: ans);
      }
      plainTextController.value.text = ans;
    }
    changeDescription(controller: controller);
    update([String]);
  }

  // to change description according to methods
  void changeDescription({controller}) {
    if (controller is EncryptionController) {
      desc.value = dynamicDescription(controller: controller);
    } else if (controller is DecryptionController) {
      desc.value = dynamicDescription(controller: controller);
    } else {
      throw ControllerTypeException(
          message:
              "Encryption Decryption Controller is Not right ::: ${controller.runtimeType}");
    }
  }

  // void keyUpdateWidget({required index, controller}) {
  //   if (controller is EncryptionController) {
  //     controller.encryptUsing(method: options[index]);
  //   } else if (controller is DecryptionController) {
  //     controller.decryptUsing(method: options[index]);
  //   }
  //
  //   onChange(controller: controller);
  // }

  void removeWidget({index, controller, bool isEncrypt = true}) {
    options.removeAt(index);
    onChange(controller: controller, isEncrypt: isEncrypt);
  }

  //
  // Widget getOptionList({controller}) {
  //   return Obx(() {
  //     return ListView.builder(
  //       shrinkWrap: true,
  //       itemCount: options.length,
  //       itemBuilder: (context, index) {
  //         return EncryptionDecryptionOptions(
  //           controller: controller,
  //           encryptionDecryptionOptionController: this,
  //           index: index,
  //         );
  //       },
  //     );
  //   });
  // }
}
