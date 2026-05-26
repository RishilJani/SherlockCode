import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/screen_layout.dart';
import '../encode_decode/encode_decode_option_controller.dart';
import 'encode_controller.dart';

// ignore: must_be_immutable
class EncodeView extends StatelessWidget {
  EncodeController encodeController = EncodeController();

  EncodeDecodeOptionController encodeDecodeOptionController = EncodeDecodeOptionController();
  EncodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cyberpunkDark,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF0A0A0A),
                Color(0xFF1A1A2E),
                cyberpunkDark,
                Color(0xFF16213E),
              ],
              stops: [0.0, 0.3, 0.7, 1.0],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),

                        // 🎯 INPUT CARD
                        buildInputCard(encodeController, context, "Enter text to encode",
                            encodeDecodeOptionController, true),

                        const SizedBox(height: 20),

                        // 🎯 METHODS CARD
                        buildMethodsCard(encodeDecodeOptionController, encodeController),

                        const SizedBox(height: 20),

                        // 🎯 OUTPUT CARD
                        buildHorizontalOutputCard( encodeController, context,encodeDecodeOptionController, true),

                        const SizedBox(height: 20),

                        // 🎯 INFO CARD
                        buildHorizontalInfoCard(encodeDecodeOptionController,context: context),

                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
