import 'package:cipher_decoder/encrypt_decrypt/encryption_decryption/encryption_decryption_model.dart';
import 'package:cipher_decoder/encrypt_decrypt/encryption_decryption/encryption_decryption_options_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../utils/common_functions.dart';
import '../../utils/string_constants.dart';
import 'encryption_decryption_controller.dart';

class EncryptionDecryptionOptions extends StatelessWidget {
  EncryptionDecryptionOptions(
      {super.key,
      required this.controller,
      this.index,
      required this.edOptionController,
      this.isEncrypt = true});

  final dynamic controller;
  final int? index;
  final bool isEncrypt;
  late final EncryptionDecryptionOptionsController edOptionController;

  @override
  Widget build(BuildContext context) {
    int n = edOptionController.options.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: [
              // for title
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: terminalWhite,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Text(
                    '${n > 1 ? '${index! + 1}. ' : ''}Protocol',
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                      color: terminalBlack,
                      fontFamily: 'monospace',
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
              if (n > 1) const SizedBox(width: 8),
              if (n > 1) // for delete button
                _customActionIcon(
                  icon: Icons.delete_outline,
                  color: terminalError,
                  onTap: () => edOptionController.removeWidget(
                      index: index, controller: controller),
                ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        // Terminal Method Selector Button
        GestureDetector(
          onTap: () => _showMethodDialog(),
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: terminalBlack,
              border: Border.all(
                color: terminalWhite,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: terminalWhite,
                  blurRadius: 10,
                  spreadRadius: 1,
                )
              ],
              borderRadius: BorderRadius.circular(4),
            ),
            child: Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      edOptionController.options[index!].model.title
                          .toUpperCase(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: terminalWhite,
                        fontFamily: 'monospace',
                        letterSpacing: 2,
                      ),
                    ),
                    const Icon(Icons.code, color: terminalWhite, size: 18),
                  ],
                )),
          ),
        ),

        Obx(() {
          EncryptionDecryptionController obj =
              edOptionController.options[index!];
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: obj.model.requiresKey
                ? Container(
                    margin:
                        const EdgeInsets.only(left: 20, bottom: 10, right: 20),
                    child: myInputfield(
                      key: Key("key"),
                      context: context,
                      textTitle: "KEY_INPUT:",
                      hintText: "ENTER_KEY",
                      controller: obj.model.keyController!,
                      onChanged: (value) => edOptionController.onChange(
                          controller: controller, isEncrypt: isEncrypt),
                      inputFormatters: [
                        obj is! PlayFairCipher
                            ? FilteringTextInputFormatter.allow(
                                RegExp(r"[0-9]"))
                            : FilteringTextInputFormatter.allow(
                                RegExp(r"[a-zA-Z]")),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          );
        }),
        const SizedBox(height: 5),
      ],
    );
  }

  Widget _customActionIcon(
      {required IconData icon,
      required Color color,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 32,
        width: 38,
        decoration: BoxDecoration(
          color: terminalBlack,
          border: Border.all(color: color, width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(icon, color: color, size: 18),
      ),
    );
  }

  void _showMethodDialog() {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: terminalBlack,
            border: Border.all(color: terminalWhite, width: 1),
            borderRadius: BorderRadius.circular(4),
            boxShadow: const [
              BoxShadow(color: Color(0x30FFFFFF), blurRadius: 20)
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '// SELECT_ALGORITHM',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: terminalWhite,
                    fontFamily: 'monospace',
                    letterSpacing: 2),
              ),
              const Divider(color: terminalWhite, height: 32),
              Flexible(
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 1,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 5,
                  children: encryptionDecryptionMethods.map((method) {
                    EncryptionDecryptionController cont =
                        getMethodObject(element: method);
                    bool isSelected =
                        edOptionController.options[index!].model.title ==
                            cont.model.title;
                    return InkWell(
                      onTap: () {
                        edOptionController.updateWidget(
                            methodController: cont,
                            index: index,
                            controller: controller,
                            isEncrypt: isEncrypt);
                        Get.back();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: isSelected ? terminalWhite : terminalBlack,
                          border: Border.all(color: terminalWhite, width: 1),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              cont.model.title.toUpperCase(),
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w900,
                                color:
                                    isSelected ? terminalBlack : terminalWhite,
                                fontFamily: 'monospace',
                                letterSpacing: 1,
                              ),
                            ),
                            if (isSelected)
                              Icon(Icons.check_circle_outline,
                                  color: terminalBlack, size: 16),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Get.back(),
                child: const Text('CANCEL'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
