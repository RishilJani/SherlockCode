import 'package:flutter/material.dart';
import '../../utils/screen_layout.dart';
import '../encryption_decryption/encryption_decryption_options_controller.dart';
import 'package:get/get.dart';

class DecryptionView extends StatelessWidget {
  DecryptionView({super.key});
  final EncryptionDecryptionOptionsController methodsController = Get.find();
  final titleText = "Enter Text to decrypt";
  @override
  Widget build(BuildContext context) {
    return screenLayout(
      context,
      child: Column(
        children: [
          const SizedBox(height: 10),

          // INPUT CARD
          buildTerminalPanel(
              isEncrypt: false,
              title: "Decrypt",
              icon: Icons.arrow_forward_ios_rounded,
              readOnly: false),

          const SizedBox(height: 5),

          // METHODS CARD
          buildMethodsCard(isEncrypt: false),

          const SizedBox(height: 20),
          buildHorizontalAddCard(),

          const SizedBox(height: 20),

          // OUTPUT CARD
          // buildHorizontalOutputCard(decryptionController, context, methodsController, false),
          buildTerminalPanel(isEncrypt: true, readOnly: true, title: "Plain"),

          const SizedBox(height: 20),

          // INFO CARD
          // buildHorizontalInfoCard(methodsController,context: context),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
