import 'package:encrypt/encrypt.dart' as encrypt;

extension StringCasingExtension on String? {
  String encode() {
    var keyStr = 'This 32 char key have 256 bits..';
    final key = encrypt.Key.fromUtf8(keyStr);
    final iv = encrypt.IV.fromUtf8(keyStr.substring(0, 8));
    final encrypter = encrypt.Encrypter(encrypt.Salsa20(key));
    final encrypted = encrypter.encrypt(this!, iv: iv);
    return encrypted.base64;
  }

  String decode() {
    var keyStr = 'This 32 char key have 256 bits..';
    final key = encrypt.Key.fromUtf8(keyStr);
    final iv = encrypt.IV.fromUtf8(keyStr.substring(0, 8));
    final encrypter = encrypt.Encrypter(encrypt.Salsa20(key));
    final decrypted =
        encrypter.decrypt(encrypt.Encrypted.fromBase64(this!), iv: iv);
    return decrypted;
  }
}
