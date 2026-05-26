import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../encoding_decoding/decode/decode_controller.dart';
import '../encoding_decoding/encode/encode_controller.dart';
import '../encoding_decoding/encode_decode/encode_decode_option_controller.dart';
import '../encrypt_decrypt/decryption/decryption_controller.dart';
import '../encrypt_decrypt/encryption/encryption_controller.dart';
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

Widget buildInputCard(
    controller, context, String titleText, methodsController, bool isEncoding) {
  return buildTerminalPanel(
    child: myInputfield(
      controller: controller,
      context: context,
      textTitle: titleText,
      hintText: 'AWAITING INPUT...',
      minLines: 3,
      maxLines: 6,
      keyboardType: TextInputType.multiline,
      onChanged: (value) => methodsController.onChange(controller: controller),
      suffixIcon: buildMobilePasteButton(
          controller: controller, onChange: methodsController.onChange),
      isEncode: true,
      isPlain: isEncoding,
      methodController: methodsController,
    ),
  );
}

Widget buildMethodsCard(methodsController, controller) {
  return buildTerminalPanel(
    title: 'ALGORITHMS',
    icon: Icons.tune,
    child: Container(
      padding: const EdgeInsets.all(8),
      child: methodsController.getOptionList(controller: controller),
    ),
  );
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

Widget buildHorizontalOutputCard(
    controller, context, methodsController, bool isEncoding) {
  final textTitle = _getOutputTitle(controller);
  return Column(
    children: [
      buildTerminalPanel(
        child: myInputfield(
          controller: controller,
          context: context,
          textTitle: textTitle,
          hintText: 'PROCESSING...',
          readonly: true,
          methodController: methodsController,
          suffixIcon: buildMobileCopyButton(controller, isEncoding),
          isEncode: false,
          minLines: 3,
          maxLines: 6,
          isPlain: !isEncoding,
        ),
      ),
      if (methodsController is EncodeDecodeOptionController &&
          controller is DecodeController)
        Obx(() => methodsController.showError.value
            ? const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text("ERROR: INVALID DATA FORMAT",
                    style: TextStyle(
                        color: terminalError, fontWeight: FontWeight.bold)),
              )
            : const SizedBox.shrink()),
    ],
  );
}

Widget buildHorizontalInfoCard(methodsController, {context}) {
  return buildTerminalPanel(
    title: 'DOCUMENTATION',
    icon: Icons.info_outline,
    child:
        Obx(() => description(context: context, controller: methodsController)),
  );
}

// Helper for consistent panel styling
Widget buildTerminalPanel(
    {String? title, IconData? icon, required Widget child}) {
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
                  title.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5),
                ),
              ],
            ),
          ),
        child,
      ],
    ),
  );
}

String _getOutputTitle(controller) {
  if (controller is EncryptionController) return "ENCRYPTED_DATA";
  if (controller is DecryptionController) return "DECRYPTED_DATA";
  if (controller is EncodeController) return "ENCODED_OUTPUT";
  if (controller is DecodeController) return "DECODED_OUTPUT";
  return "OUTPUT";
}
