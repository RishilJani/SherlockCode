import 'package:flutter/material.dart';
import '../../utils/common_functions.dart';
import '../../utils/screen_layout.dart';
import '../encryption_decryption/encryption_decryption_options_controller.dart';
import 'package:get/get.dart';

class EncryptionView extends StatelessWidget {
  EncryptionView({super.key});

  final EncryptionDecryptionOptionsController edOptionsController = Get.find();
  final String titleText = "Enter Text to encrypt";

  @override
  Widget build(BuildContext context) {
    return screenLayout(context,
        child: Column(
          children: [
            const SizedBox(height: 10),

            // 🎯 INPUT CARD
            buildTerminalPanel(
                isEncrypt: true,
                title: "Encrypt",
                icon: Icons.arrow_forward_ios_rounded,
                readOnly: false,
              suffixIcon: buildMobilePasteButton(onChange: edOptionsController.onChange, isEncrypt: true,)
            ),

            const SizedBox(height: 5),

            // 🎯 METHODS CARD
            buildMethodsCard(isEncrypt: true),

            // const SizedBox(height: 20),
            buildHorizontalAddCard(),

            const SizedBox(height: 20),

            // 🎯 OUTPUT CARD
            buildTerminalPanel(
                isEncrypt: false,
                readOnly: true,
                title: "Cipher",
                icon: Icons.arrow_forward_ios_rounded),

            const SizedBox(height: 20),

            // 🎯 INFO CARD
            // buildHorizontalInfoCard(edOptionsController,context: context),

            const SizedBox(height: 32),
          ],
        ));
  }
}
