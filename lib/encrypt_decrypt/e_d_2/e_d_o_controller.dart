import 'package:cipher_decoder/encrypt_decrypt/e_d_2/e_d_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'e_d_controller.dart';

enum EDTypes { CeaseCipher }
List<EDTypes> edMethods = EDTypes.values;

class EDOptionsController extends GetxController {
  RxList<EDController> options = [EDController(model: CeaserCipher2())].obs;

  Rx<TextEditingController> plainTextController = TextEditingController().obs;
  Rx<TextEditingController> cipherTextController = TextEditingController().obs;

  void onChange({bool isEncrypt = true}) {
    String text = plainTextController.value.text;
    String ans = text;
    for (var o in options) {
      if (isEncrypt) {
        ans = o.encryptText(plainText: ans);
      } else {
        ans = o.decryptText(cipherText: ans);
      }
    }
    if (isEncrypt) {
      cipherTextController.value.text = ans;
    } else {
      plainTextController.value.text = ans;
    }
  }

  void removeProtocol({required int index}) {
    if (index < 0 || index > options.length) {
      return;
    }
    options.removeAt(index);
  }

  void updateWidget({required int index, element, bool isEncrypt = true}) {
    options[index] = getObject(element: element);
    onChange(isEncrypt: isEncrypt);
    update([options]);
  }

  dynamic getObject({required EDTypes element}) {
    if (element == EDTypes.CeaseCipher) {
      print("Returning The object......");
      return EDController(model: new CeaserCipher2());
    }
    return null;
  }
}
