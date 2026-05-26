import 'package:flutter/material.dart';
import '../../utils/screen_layout.dart';
import '../../utils/string_constants.dart';
import '../encryption_decryption/encryption_decryption_options_controller.dart';
import 'package:get/get.dart';
import 'decryption_controller.dart';

class DecryptionView extends StatelessWidget{
  DecryptionView({super.key});
  final DecryptionController decryptionController = DecryptionController();
  final EncryptionDecryptionOptionsController methodsController = Get.put(EncryptionDecryptionOptionsController(),tag: TAG_DECRYPT);
  final titleText = "Enter Text to decrypt";
  @override
  Widget build(BuildContext context) {
    return screenLayout(
      context,
      child: Column(
        children: [
          const SizedBox(height: 10),

          // INPUT CARD
          buildInputCard(decryptionController, context, titleText,methodsController, false),

          const SizedBox(height: 20),

          // METHODS CARD
          buildMethodsCard(methodsController, decryptionController),

          const SizedBox(height: 20),
          buildHorizontalAddCard(decryptionController, methodsController),

          const SizedBox(height: 20),

          // OUTPUT CARD
          buildHorizontalOutputCard(decryptionController, context, methodsController, false),

          const SizedBox(height: 20),

          // INFO CARD
          buildHorizontalInfoCard(methodsController,context: context),

          const SizedBox(height: 32),
        ],
      ),

    );
  }
}