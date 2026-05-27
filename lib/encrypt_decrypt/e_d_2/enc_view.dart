import 'package:cipher_decoder/encrypt_decrypt/e_d_2/e_d_o_controller.dart';
import 'package:cipher_decoder/encrypt_decrypt/e_d_2/e_d_options_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../utils/common_functions.dart';

class Enc_View extends StatefulWidget {
  const Enc_View({super.key});

  @override
  State<Enc_View> createState() => _Enc_ViewState();
}

class _Enc_ViewState extends State<Enc_View> {
  EDOptionsController edoController2 = Get.put(EDOptionsController());
  @override
  Widget build(BuildContext context) {
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
                        child: Column(
                          children: [
                            const SizedBox(height: 250),

                            // 🎯 INPUT CARD
                            customTextFormField(controller: edoController2.plainTextController.value, hintText: 'Enter plainText', readOnly: false, onChange: (String str) =>
                                    {edoController2.onChange(isEncrypt: true)}),

                            const SizedBox(height: 5),

                            // 🎯 METHODS CARD
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Obx(() {
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: edoController2.options.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: EdgeInsets.symmetric(vertical: 5),
                                          padding: EdgeInsets.only(top: 10),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: terminalWhite,
                                                width: 0.5),
                                          ),
                                          child: EDOptionsView(
                                            index: index,
                                            isEncrypt: true,
                                          ),
                                        );
                                      },
                                    );
                                  })
                                ],
                              ),
                            ),

                            // const SizedBox(height: 20),
                            // buildHorizontalAddCard(encryptionController, methodsController),

                            const SizedBox(height: 20),

                            // 🎯 OUTPUT CARD
                            customTextFormField(
                              controller:
                                  edoController2.cipherTextController.value,
                              readOnly: true,
                              hintText: 'Enter CipherText',
                            ),

                            // const SizedBox(height: 20),
                            // 🎯 INFO CARD
                            // buildHorizontalInfoCard(methodsController,context: context),

                            const SizedBox(height: 32),
                          ],
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
