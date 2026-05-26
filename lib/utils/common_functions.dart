import 'package:cipher_decoder/utils/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../encoding_decoding/decode/decode_controller.dart';
import '../encoding_decoding/encode/encode_controller.dart';
import '../encoding_decoding/encode_decode/encode_decode_model.dart';
import '../encoding_decoding/encode_decode/encode_decode_model.dart';
import '../encoding_decoding/encode_decode/encode_decode_option_controller.dart';
import '../encrypt_decrypt/decryption/decryption_controller.dart';
import '../encrypt_decrypt/encryption/encryption_controller.dart';
import '../encrypt_decrypt/encryption_decryption/encryption_decryption_model.dart';
import '../encrypt_decrypt/encryption_decryption/encryption_decryption_options_controller.dart';
import 'colors.dart';
import 'custom_exceptions.dart';

Widget myInputfield(
    {key,
    required context,
    required String textTitle,
    String? hintText,
    suffixIcon,
    required controller,
    minLines,
    maxLines,
    keyboardType,
    textInputAction,
    inputFormatters,
    onChanged,
    validator,
    bool readonly = false,
    bool isEncode = true,
    bool isPlain = true,
    methodController}) {
  TextEditingController ctr;
  if (isPlain) {
    ctr = key != null ? controller : controller.plainTextController;
  } else {
    ctr = controller.cipherTextController;
  }

  return Container(
    key: key,
    decoration: const BoxDecoration(
      color: terminalBlack,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header bar for the input field
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: const BoxDecoration(
            color: terminalWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
          child: Row(
            children: [
              Icon(
                readonly ? Icons.output : Icons.input,
                size: 14,
                color: terminalBlack,
              ),
              const SizedBox(width: 8),
              Text(
                textTitle.toUpperCase(),
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w900,
                  color: terminalBlack,
                  fontFamily: 'monospace',
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
        TextFormField(
          readOnly: readonly,
          controller: ctr,
          decoration: InputDecoration(
            hintText: hintText?.toUpperCase(),
            hintStyle: const TextStyle(
              color: terminalMidGrey,
              fontFamily: 'monospace',
              fontSize: 12,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
              borderSide: BorderSide(color: terminalWhite, width: 1),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
              borderSide: BorderSide(color: terminalWhite, width: 1),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
              borderSide: BorderSide(color: terminalWhite, width: 2),
            ),
            filled: true,
            fillColor: terminalBlack,
            contentPadding: const EdgeInsets.all(16),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                suffixIcon ?? const SizedBox(width: 0),
                Visibility(
                  visible: isEncode,
                  child: enhancedClearIconButton(
                      controller: controller,
                      encryptionDecryptionOptionsController: methodController),
                ),
              ],
            ),
          ),
          style: const TextStyle(
            color: terminalWhite,
            fontFamily: 'monospace',
            fontSize: 14,
            height: 1.4,
            letterSpacing: 0.5,
          ),
          minLines: minLines,
          maxLines: maxLines,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onChanged: onChanged,
          validator: validator,
          inputFormatters: inputFormatters,
        ),
      ],
    ),
  );
}

// region Descriptions
Widget description({required context, controller}) {
  if (controller is EncodeController || controller is DecodeController) {
    return const SizedBox.shrink();
  }
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getDescriptionList(controller: controller, context: context),
        Visibility(
          visible: controller.desc.value != '',
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
              border: Border.all(color: terminalWhite, width: 0.5),
            ),
            child: Text(
              controller.desc.value.toUpperCase(),
              style: const TextStyle(
                fontSize: 11,
                color: terminalWhite,
                fontFamily: 'monospace',
                height: 1.4,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _getDescriptionList({controller, context}) {
  List<String> temp = [];
  return ListView.builder(
    shrinkWrap: true,
    itemCount: controller is EncryptionDecryptionOptionsController
        ? controller.options.length
        : 1,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      String txt1;
      String description = "";
      bool isCame = false;

      if (controller is EncodeDecodeOptionController) {
        txt1 = controller.selectedMethod.value.title!.toUpperCase();
        if (temp.contains(txt1))
          isCame = true;
        else {
          temp.add(txt1);
          description = controller.selectedMethod.value.description!;
        }
      } else {
        String name = controller.options[index].title!.toUpperCase();
        txt1 = '${index + 1}. $name';
        if (temp.contains(name))
          isCame = true;
        else {
          temp.add(name);
          description = controller.options[index].description!;
        }
      }

      return Visibility(
        visible: !isCame,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.keyboard_arrow_right,
                    color: terminalWhite, size: 16),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    txt1,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w900,
                      color: terminalWhite,
                      fontFamily: 'monospace',
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.only(left: 12, top: 4, bottom: 12),
              decoration: const BoxDecoration(
                border:
                    Border(left: BorderSide(color: terminalWhite, width: 1)),
              ),
              child: Text(
                description.toUpperCase(),
                style: const TextStyle(
                  fontSize: 11,
                  color: terminalGrey,
                  fontFamily: 'monospace',
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
// endregion

PreferredSizeWidget buildEnhancedAppBar({title, content, bottom}) {
  return AppBar(
    title: Column(
      children: [
        Text(
          title.toUpperCase(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: terminalWhite,
            fontFamily: 'monospace',
            letterSpacing: 4.0,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: terminalWhite,
            borderRadius: BorderRadius.circular(2),
          ),
          child: Text(
            content.toUpperCase(),
            style: const TextStyle(
              fontSize: 10,
              color: terminalBlack,
              fontFamily: 'monospace',
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
            ),
          ),
        ),
      ],
    ),
    centerTitle: true,
    backgroundColor: terminalBlack,
    elevation: 0,
    bottom: bottom,
  );
}

Widget _customIconButton({Color? color, onTap, IconData, double? size}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: terminalBlack,
        border: Border.all(color: color ?? terminalWhite, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Icon(IconData, color: color ?? terminalWhite, size: size ?? 20.0),
    ),
  );
}

Widget enhancedClearIconButton(
    {required controller, required encryptionDecryptionOptionsController}) {
  return _customIconButton(
      color: terminalError,
      IconData: Icons.clear,
      onTap: () {
        controller.plainTextController.clear();
        controller.cipherTextController.clear();
        encryptionDecryptionOptionsController.onChange(controller: controller);
      });
}

Widget buildMobilePasteButton({controller, onChange}) {
  return _customIconButton(
      IconData: Icons.paste,
      onTap: () {
        pasteText(controller: controller, onChange: onChange);
      });
}

Widget buildMobileCopyButton(controller, bool isEncoding) {
  return _customIconButton(
      onTap: () {
        String cpy = isEncoding
            ? controller.cipherTextController.text.toString()
            : controller.plainTextController.text.toString();
        copyText(cpy);
      },
      IconData: Icons.copy);
}

void copyText(String txt) {
  if (txt.isEmpty) {
    showSnackBar(
        title: "EMPTY FIELD",
        message: "NO DATA TO COPY.",
        backgroundColor: terminalWhite,
        colorText: terminalBlack);
  } else {
    Clipboard.setData(ClipboardData(text: txt)).then((value) {
      showSnackBar(
          title: "SUCCESS",
          message: "DATA COPIED TO BUFFER.",
          backgroundColor: terminalWhite,
          colorText: terminalBlack);
    });
  }
}

void showSnackBar({title, message, backgroundColor, colorText}) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: backgroundColor,
    colorText: colorText,
    borderRadius: 4,
    margin: const EdgeInsets.all(16),
    duration: const Duration(seconds: 3),
    borderWidth: 1,
    borderColor: terminalBlack,
  );
}

// rest of the helpers remain essentially the same but with monospace defaults from theme
bool checkAllTypes({controller}) =>
    controller is EncryptionController ||
    controller is DecryptionController ||
    controller is EncodeController ||
    controller is DecodeController;

void pasteText({controller, required Function onChange}) async {
  ClipboardData? data = await Clipboard.getData('text/plain');
  if (data != null) {
    if (controller is EncodeController || controller is EncryptionController)
      controller.plainTextController.text = data.text!;
    else if (controller is DecodeController ||
        controller is DecryptionController)
      controller.cipherTextController.text = data.text!;
    onChange(controller: controller);
  }
}

String dynamicDescription({controller, String text1 = '', String text2 = ''}) {
  if (controller is EncryptionController) {
    text1 ??= controller.plainTextController.text;
    text2 ??= controller.cipherTextController.text;
  } else if (controller is DecryptionController) {
    text1 ??= controller.cipherTextController.text;
    text2 ??= controller.plainTextController.text;
  } else if (controller is DecodeController || controller is EncodeController) {
    return '';
  } else {
    throw ControllerTypeException(
        message: "Controller is Not right ::: ${controller.runtimeType}");
  }

  const int maxLimit = 10;
  String ans = '';
  int count = 0;
  String ignore = "\n ";
  var l1 = text1.split('');
  var l2 = text2.split('');
  for (int i = 0; i < l1.length && i < l2.length; i++) {
    if (i == 0) {
      ans = "\n> CIPHER MAP:\n";
    }

    if (ignore.contains(l1[i])) {
      continue;
    }

    if (count == maxLimit) {
      ans = "$ans...";
      break;
    }
    ans = "$ans${l1[i]} → ${l2[i]}\n";
    count++;
  }
  return ans;
}

dynamic getMethod({required element}) {
  if (element is EncryptionDecryptionTypes) {
    if (element == EncryptionDecryptionTypes.CeaseCipher) {
      return new CeaseCipher();
    } else if (element == EncryptionDecryptionTypes.Atbash_Cipher) {
      return new AtbashCipher();
    } else if (element == EncryptionDecryptionTypes.Rail_Fence_Cipher) {
      return new RailFenceCipher();
    } else if (element == EncryptionDecryptionTypes.Play_Fair_Cipher) {
      return new PlayFairCipher();
    }
  } else if (element is EncodeDecodeTypes) {
    if (element == EncodeDecodeTypes.Base64) {
      return Base64();
    }
    if (element == EncodeDecodeTypes.Base32) {
      return Base32();
    }
  } else {
    throw ControllerTypeException(
        message: "encrypt decrypt element is not right ${element.runtimeType}");
  }
}
