import 'dart:convert';
import 'package:cryptography/cryptography.dart';
import 'package:convert/convert.dart';

class AesUtils {
  final int _keySize = 128;
  final int _iterationCount = 1000;

  generateKey(salt, passphrase) {
    Pbkdf2 pbkdf2 = Pbkdf2(
        macAlgorithm: new Hmac(sha1),
        iterations: _iterationCount,
        bits: _keySize);
    var key = pbkdf2.deriveBitsSync(utf8.encode(passphrase),
        nonce: Nonce(hex.decode(salt)));
    return key;
  }

  decrypt(salt, iv, passPhrase, cipherText) {
    var key = generateKey(salt, passPhrase);
    SecretKey secretKey = new SecretKey(key);
    var cipherParams = base64.decode(cipherText);
    Nonce nonce = new Nonce(hex.decode(iv));
    var decrypted =
        aesCbc.decryptSync(cipherParams, secretKey: secretKey, nonce: nonce);
    return decrypted;
  }

  encrypt(salt, iv, passPhrase, plainText) {
//    plainText = 'plainText';
    var key = generateKey(salt, passPhrase);
    SecretKey secretKey = new SecretKey(key);
    Nonce nonce = new Nonce(hex.decode(iv));
    var encrypted = aesCbc.encryptSync(utf8.encode(plainText),
        secretKey: secretKey, nonce: nonce);
    return encrypted;
  }

  String cryptPassword(String password) {
    const iv = "bd6c7e4747a2962e38cfdcdf586cd7b9";
    const salt = "967c96f344f88e3ccaa512b6ae4d4247";
    const passPhrase = "7061737323313233";
    var cipherText = this.encrypt(salt, iv, passPhrase, password);
    String aesPassword = (iv + "::" + salt + "::" + base64Encode(cipherText));
    var bytes = utf8.encode(aesPassword);
    return base64.encode(bytes);
  }
}
