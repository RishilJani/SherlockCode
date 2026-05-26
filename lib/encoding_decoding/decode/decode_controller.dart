import 'package:flutter/material.dart';
import '../encode_decode/encode_decode_model.dart';

class DecodeController {TextEditingController plainTextController = TextEditingController();
  TextEditingController cipherTextController = TextEditingController();
  TextEditingController keyController = TextEditingController(text: '0');

  String? decodeUsing({required EncodeDecodeModel method, String? decode}){
    if(decode != null){
      return method.decode(encodedText: decode);
    }else{
      plainTextController.text = method.decode(encodedText: cipherTextController.text);
      return null;
    }
  }
}