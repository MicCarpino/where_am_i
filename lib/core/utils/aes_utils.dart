import 'dart:convert';
import 'package:cryptography/cryptography.dart';
import 'package:convert/convert.dart';

class AesUtils {
  int _keySize = 128;
  int _iterationCount = 1000;

  AesUtils(this._keySize,this._iterationCount);

  generateKey( salt,  passphrase){
    Pbkdf2 pbkdf2 = Pbkdf2(macAlgorithm: new Hmac(sha1), iterations: _iterationCount, bits: _keySize);
    var key = pbkdf2.deriveBitsSync(utf8.encode(passphrase), nonce: Nonce(hex.decode(salt)));
    return key;
  }

  decrypt(salt, iv, passPhrase, cipherText) {
    var key = generateKey(salt, passPhrase);
    SecretKey secretKey = new SecretKey(key);
    var cipherParams = base64.decode(cipherText);
    Nonce nonce = new Nonce(hex.decode(iv));
    var decrypted = aesCbc.decryptSync(
        cipherParams,
        secretKey: secretKey,
        nonce: nonce);
    return decrypted;
  }

  encrypt(salt, iv, passPhrase, plainText) {
//    plainText = 'plainText';
    var key = generateKey(salt, passPhrase);
    SecretKey secretKey = new SecretKey(key);
    Nonce nonce = new Nonce(hex.decode(iv));
    var encrypted = aesCbc.encryptSync(
        utf8.encode(plainText),
        secretKey: secretKey,
        nonce: nonce);
    return encrypted;
  }


}
