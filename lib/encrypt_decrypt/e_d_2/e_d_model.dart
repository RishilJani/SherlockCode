import 'package:cipher_decoder/utils/string_constants.dart';

abstract class EDModel2 {
  String title;
  String? description;
  bool requiresKey;

  EDModel2({required this.title, this.description , this.requiresKey = false});

  String encrypt({required String plainText, dynamic key});

  String decrypt({required String cipherText, dynamic key});
}

class CeaserCipher2 extends EDModel2 {
  CeaserCipher2()
      : super(title: EN_CEASER_CIPHER, description: CEASER_CIPHER_DESC, requiresKey: true);

  @override
  String encrypt({required String plainText, dynamic key}) {
    int optionalKey = key;

    if (optionalKey % 26 == 0) {
      return plainText;
    }

    final shift = optionalKey % 26;
    final buffer = StringBuffer();

    for (var code in plainText.codeUnits) {
      if (code >= 65 && code <= 90) {
        // Uppercase A–Z
        buffer.writeCharCode(65 + (code - 65 + shift) % 26);
      } else if (code >= 97 && code <= 122) {
        // Lowercase a–z
        buffer.writeCharCode(97 + (code - 97 + shift) % 26);
      } else if (code >= '0'.codeUnitAt(0) && code <= '9'.codeUnitAt(0)) {
        buffer.writeCharCode(
            '0'.codeUnitAt(0) + (code - '0 '.codeUnitAt(0) + shift) % 10);
      } else {
        // Non-alphabetic
        buffer.writeCharCode(code);
      }
    }

    return buffer.toString();
  }

  @override
  String decrypt({required String cipherText, dynamic key}) {
    return encrypt(plainText: cipherText, key: 26 - (key % 26));
  }
}
