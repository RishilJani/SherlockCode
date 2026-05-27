import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../encrypt_decrypt/encryption_decryption/encryption_decryption_options.dart';
import '../encrypt_decrypt/encryption_decryption/encryption_decryption_options_controller.dart';
import 'colors.dart';
import 'common_functions.dart';

Widget screenLayout(context, {required Widget child}) {
  return Scaffold(
    backgroundColor: terminalBlack,
    body: GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: terminalBlack,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: child)),
            ],
          ),
        ),
      ),
    ),
  );
}

// Widget buildInputCard(context, String titleText,
//     EncryptionDecryptionOptionsController edOptionsController, bool isEncrypt) {
//   return buildTerminalPanel(
//       child: customTextFormField(
//           controller: isEncrypt
//               ? edOptionsController.plainTextController.value
//               : edOptionsController.cipherTextController.value,
//           hintText: 'Input...',
//           minLines: 3,
//           maxLines: 6,
//           keyboardType: TextInputType.multiline,
//           onChange: (String value) => edOptionsController.onChange(isEncrypt: isEncrypt),
//           readOnly: true
//       ),
//       // child: myInputfield(
//       //   controller: controller,
//       //   context: context,
//       //   textTitle: titleText,
//       //   hintText: 'AWAITING INPUT...',
//       //   minLines: 3,
//       //   maxLines: 6,
//       //   keyboardType: TextInputType.multiline,
//       //   onChanged: (value) => methodsController.onChange(controller: controller),
//       //   suffixIcon: buildMobilePasteButton(
//       //       controller: controller, onChange: methodsController.onChange),
//       //   isEncode: true,
//       //   isPlain: isEncoding,
//       //   methodController: methodsController,
//       // ),
//       );
// }

Widget buildMethodsCard(
    EncryptionDecryptionOptionsController methodsController, controller) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8),
    decoration: BoxDecoration(
      color: terminalBlack,
      borderRadius: BorderRadius.circular(4),
      boxShadow: const [
        BoxShadow(color: Color(0x15FFFFFF), blurRadius: 8, spreadRadius: 0),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: methodsController.options.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: terminalWhite, width: 0.5),
                ),
                child: EncryptionDecryptionOptions(
                  controller: controller,
                  edOptionController: methodsController,
                  index: index,
                ),
              );
            },
          );
        })
      ],
    ),
  );

  // return buildTerminalPanel(
  //   title: 'ALGORITHMS',
  //   child: Container(
  //     padding: const EdgeInsets.all(8),
  //     child: methodsController.getOptionList(controller: controller),
  //   ),
  // );
}

Widget buildHorizontalAddCard(controller, methodsController) {
  return InkWell(
    onTap: () => methodsController.addWidget(controller: controller),
    child: Container(
      height: 48,
      decoration: BoxDecoration(
        color: terminalBlack,
        border: Border.all(color: terminalWhite, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, size: 18, color: terminalWhite),
          SizedBox(width: 10),
          Text(
            'ADD MODULE',
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w900, letterSpacing: 2),
          ),
        ],
      ),
    ),
  );
}

// Output
// Widget buildHorizontalOutputCard(
//     controller, context, methodsController, bool isEncoding) {
//   final textTitle = _getOutputTitle(controller);
//   return Column(
//     children: [
//       buildTerminalPanel(
//         child: myInputfield(
//           controller: controller,
//           context: context,
//           textTitle: textTitle,
//           hintText: 'PROCESSING...',
//           readonly: true,
//           methodController: methodsController,
//           suffixIcon: buildMobileCopyButton(controller, isEncoding),
//           isEncode: false,
//           minLines: 3,
//           maxLines: 6,
//           isPlain: !isEncoding,
//         ),
//       ),
//       // if (methodsController is EncodeDecodeOptionController &&
//       //     controller is DecodeController)
//       //   Obx(() => methodsController.showError.value
//       //       ? const Padding(
//       //           padding: EdgeInsets.only(top: 8),
//       //           child: Text("ERROR: INVALID DATA FORMAT",
//       //               style: TextStyle(
//       //                   color: terminalError, fontWeight: FontWeight.bold)),
//       //         )
//       //       : const SizedBox.shrink()),
//     ],
//   );
// }

Widget buildHorizontalInfoCard(methodsController, {context}) {
  return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: terminalBlack,
        border: Border.all(color: terminalWhite, width: 1),
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(color: Color(0x15FFFFFF), blurRadius: 8, spreadRadius: 0),
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: terminalWhite, width: 1)),
          ),
          child: Row(
            children: [
              Icon(Icons.info_outline, size: 14, color: terminalWhite),
              const SizedBox(width: 8),
              Text(
                'DOCUMENTATION',
                style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5),
              ),
              Obx(() =>
                  description(context: context, controller: methodsController))
            ],
          ),
        )
      ]));
}

// Helper for consistent panel styling
Widget buildTerminalPanel(
    {String? title,
    IconData? icon,
    bool isEncrypt = true,
    bool readOnly = false}) {
  EncryptionDecryptionOptionsController edOptionsController = Get.find();
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8),
    decoration: BoxDecoration(
      color: terminalBlack,
      border: Border.all(color: terminalWhite, width: 1),
      borderRadius: BorderRadius.circular(4),
      boxShadow: const [
        BoxShadow(color: Color(0x15FFFFFF), blurRadius: 8, spreadRadius: 0),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: const BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: terminalWhite, width: 1)),
            ),
            child: Row(
              children: [
                if (icon != null) Icon(icon, size: 14, color: terminalWhite),
                if (icon != null) const SizedBox(width: 8),
                Text(
                  title.capitalize.toString(),
                  style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5),
                ),
              ],
            ),
          ),
        customTextFormField(
            controller: isEncrypt
                ? edOptionsController.plainTextController.value
                : edOptionsController.cipherTextController.value,
            hintText: 'Input...',
            minLines: 3,
            maxLines: 6,
            keyboardType: TextInputType.multiline,
            onChange: (String value) =>
                edOptionsController.onChange(isEncrypt: isEncrypt),
            readOnly: readOnly),
      ],
    ),
  );
}

// String _getOutputTitle(controller) {
//   if (controller is EncryptionController) return "ENCRYPTED_DATA";
//   if (controller is DecryptionController) return "DECRYPTED_DATA";
//   // if (controller is EncodeController) return "ENCODED_OUTPUT";
//   // if (controller is DecodeController) return "DECODED_OUTPUT";
//   return "OUTPUT";
// }
