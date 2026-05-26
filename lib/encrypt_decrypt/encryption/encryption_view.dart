import 'package:flutter/material.dart';
import '../../utils/screen_layout.dart';
import '../../utils/string_constants.dart';
import '../encryption_decryption/encryption_decryption_options_controller.dart';
import 'encryption_controller.dart';
import 'package:get/get.dart';

class EncryptionView extends StatelessWidget{
  EncryptionView({super.key});

  final EncryptionController encryptionController = EncryptionController();
  final EncryptionDecryptionOptionsController methodsController = Get.put(EncryptionDecryptionOptionsController(),tag: TAG_ENCRYPT);
  final String titleText = "Enter Text to encrypt";
  @override
  Widget build(BuildContext context) {
    return screenLayout(context, child: Column(
      children: [
        const SizedBox(height: 10),

        // 🎯 INPUT CARD
        buildInputCard(encryptionController, context, titleText,
            methodsController, false),

        const SizedBox(height: 20),

        // 🎯 METHODS CARD
        buildMethodsCard(methodsController, encryptionController),

        const SizedBox(height: 20),
        buildHorizontalAddCard(encryptionController, methodsController),


        const SizedBox(height: 20),

        // 🎯 OUTPUT CARD
        buildHorizontalOutputCard(
            encryptionController, context, methodsController, false),

        const SizedBox(height: 20),

        // 🎯 INFO CARD
        buildHorizontalInfoCard(methodsController,context: context),

        const SizedBox(height: 32),
      ],
    ));
  }

}