
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_hub/core/errors/exeptions.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';


class FirebaseAuthService
{
  Future<void> deleteUser()async
  {
    FirebaseAuth.instance.currentUser!.delete();
  }
  Future<User> createUserWithEmailAndPassword({required String email, required String password}) async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code.toString()}');
      if (e.code == 'weak-password') {
        throw CustomException('كلمة المرور ضعيفة جدا');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('لقد تم استخدام هذا البريد الإلكترونى من قبل');
      }
      else if(e.code=='network-request-failed')
        {
          throw CustomException('تأكد من اتصالك بالإنترنت');
        }
      else if(e.code=='invalid-email')
        {
          throw CustomException('البريد الإلكترونى غير صحيح');
        }
      else
        {
          throw CustomException('حدث خطأ أثناء إنشاء الحساب برجاء المحاولة مرة أخرى');
        }
    } catch (e) {
      log('Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} ');
     throw CustomException('حدث خطأ أثناء إنشاء الحساب برجاء المحاولة مرة أخرى');
    }

  }
  //sign in method
  Future<User> signInWithEmailAndPassword({required String email, required String password}) async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code is ${e.code.toString()}');
      if (e.code == 'user-not-found') {
        throw CustomException('كلمة المرور او البريد الإلكترونى غير صحيح');
      } else if (e.code == 'wrong-password') {
        throw CustomException('كلمة المرور او البريد الإلكترونى غير صحيح');
      }
      else if(e.code=='network-request-failed')
      {
        throw CustomException('تأكد من اتصالك بالإنترنت');
      }
      else if(e.code=='invalid-email')
      {
        throw CustomException('البريد الإلكترونى غير صحيح');
      }
      else if(e.code=='invalid-credential')
      {
        throw CustomException('كلمة المرور او البريد الإلكترونى غير صحيح');
      }
      else
      {
        throw CustomException('حدث خطأ أثناء تسجيل الدخول برجاء المحاولة مرة أخرى');
      }
    } catch (e) {
      log('Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} ');
      throw CustomException('حدث خطأ أثناء تسجيل الدخول برجاء المحاولة مرة أخرى');
    }

  }
  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    var result=await FirebaseAuth.instance.signInWithCredential(credential);
    return result.user!;
  }
  Future<User> signInWithFacebook() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);
    final LoginResult loginResult =
    await FacebookAuth.instance.login(nonce: nonce);
    OAuthCredential facebookAuthCredential;

    if (Platform.isIOS) {
      switch (loginResult.accessToken!.type) {
        case AccessTokenType.classic:
          final token = loginResult.accessToken as ClassicToken;
          facebookAuthCredential = FacebookAuthProvider.credential(
            token.authenticationToken!,
          );
          break;
        case AccessTokenType.limited:
          final token = loginResult.accessToken as LimitedToken;
          facebookAuthCredential = OAuthCredential(
            providerId: 'facebook.com',
            signInMethod: 'oauth',
            idToken: token.tokenString,
            rawNonce: rawNonce,
          );
          break;
      }
    } else {
      facebookAuthCredential = FacebookAuthProvider.credential(
        loginResult.accessToken!.tokenString,
      );
    }

    return (await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential))
        .user!;
  }



  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = math.Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<User> signInWithApple() async {

    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    var result=await FirebaseAuth.instance.signInWithCredential(oauthCredential);
    return result.user! ;
  }
  bool isUserLoggedIn()
  {
    return FirebaseAuth.instance.currentUser!=null;
  }


}