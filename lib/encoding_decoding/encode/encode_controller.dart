
import 'package:flutter/material.dart';

import '../encode_decode/encode_decode_model.dart';

class EncodeController{
  TextEditingController plainTextController = TextEditingController();
  TextEditingController cipherTextController = TextEditingController();
  TextEditingController keyController = TextEditingController(text: '1');

  String? encodeUsing({required EncodeDecodeModel method, String? encode}){
    if(encode != null){
      return method.encode(plainText: encode);
    }else{
      cipherTextController.text = method.encode(plainText: plainTextController.text);
      return null;
    }
  }
}