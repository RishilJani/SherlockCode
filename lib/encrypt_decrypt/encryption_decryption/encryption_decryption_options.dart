import 'package:cipher_decoder/encrypt_decrypt/encryption_decryption/encryption_decryption_model.dart';
import 'package:cipher_decoder/encrypt_decrypt/encryption_decryption/encryption_decryption_options_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../utils/common_functions.dart';
import '../../utils/string_constants.dart';
import '../encryption/encryption_controller.dart';

// ignore:must_be_immutable
class EncryptionDecryptionOptions extends StatefulWidget {
  EncryptionDecryptionOptions(
      {super.key,
      required this.controller,
      this.index,
      required this.encryptionDecryptionOptionController}) {
    txt =
        'PROTOCOL_${controller is EncryptionController ? 'ENCRYPT' : 'DECRYPT'}';
  }

  final dynamic controller;
  int? index;
  EncryptionDecryptionOptionsController encryptionDecryptionOptionController;
  String txt = '';

  @override
  State<EncryptionDecryptionOptions> createState() =>
      _EncryptionDecryptionOptionsState();
}

class _EncryptionDecryptionOptionsState
    extends State<EncryptionDecryptionOptions>
    with SingleTickerProviderStateMixin {
  late AnimationController _glowController;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _glowController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);
    _glowAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    int n = widget.encryptionDecryptionOptionController.options.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: terminalWhite,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Text(
                  '${n > 1 ? '${widget.index! + 1}. ' : ''}${widget.txt.toUpperCase()}',
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
            if (n > 1)
              _customActionIcon(
                icon: Icons.delete_outline,
                color: terminalError,
                onTap: () => widget.encryptionDecryptionOptionController
                    .removeWidget(
                        index: widget.index, controller: widget.controller),
              ),
          ],
        ),

        const SizedBox(height: 12.0),

        // Terminal Method Selector Button
        AnimatedBuilder(
          animation: _glowAnimation,
          builder: (context, child) {
            return GestureDetector(
              onTap: () => _showMethodDialog(),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: terminalBlack,
                  border: Border.all(
                    color: terminalWhite,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: terminalWhite.withValues(
                          alpha: _glowAnimation.value * 0.3),
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
                          widget.encryptionDecryptionOptionController
                              .options[widget.index!].title!
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
            );
          },
        ),

        Obx(() {
          EncryptionDecryptionModel obj = widget
              .encryptionDecryptionOptionController.options[widget.index!];
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: obj.requiresKey
                ? Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: myInputfield(
                      key: Key("key"),
                      context: context,
                      textTitle: "KEY_INPUT:",
                      hintText: "ENTER_KEY",
                      controller: obj.keyController!,
                      onChanged: (value) => widget
                          .encryptionDecryptionOptionController
                          .keyUpdateWidget(
                              index: widget.index,
                              controller: widget.controller),
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
        const SizedBox(height: 12),
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
                    EncryptionDecryptionModel model =
                        getMethod(element: method);
                    bool isSelected = widget
                            .encryptionDecryptionOptionController
                            .options[widget.index!]
                            .title ==
                        model.title;
                    return InkWell(
                      onTap: () {
                        widget.encryptionDecryptionOptionController
                            .updateWidget(
                                methodObj: model,
                                index: widget.index,
                                controller: widget.controller);
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
                              model.title!.toUpperCase(),
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

  @override
  void dispose() {
    _glowController.dispose();
    super.dispose();
  }
}
