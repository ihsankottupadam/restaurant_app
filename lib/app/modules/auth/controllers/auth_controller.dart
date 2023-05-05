import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:restaurant_app/app/routes/app_pages.dart';
import 'package:restaurant_app/core/util/util.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  late Rx<User?> _user;
  var verificationId = '';
  var phoneNumber = '';

  User? get user => _user.value;

  @override
  void onReady() {
    super.onReady();
    _user = Rx(_auth.currentUser);
    _user.bindStream(_auth.userChanges());
    ever(_user, _initScreen);
  }

  signInWithGoogle() async {
    try {
      final googleuser = await _googleSignIn.signIn();
      if (googleuser == null) return;
      final googleAuth = await googleuser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _auth.signInWithCredential(credential);
      await _googleSignIn.signOut();
    } on Exception catch (_) {
      Util.showError('Error signin');
    }
  }

  signOut() async {
    try {
      await _auth.signOut();
      if (await _googleSignIn.isSignedIn()) {
        await _googleSignIn.signOut();
      }
    } on FirebaseException catch (e) {
      log('Error signout');
    }
  }

  verifyPhone(String phoneNumber) async {
    this.phoneNumber = phoneNumber;
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (phoneAuthCredential) async {
        await _auth.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (error) {
        Util.showError('Something went wrong, try again');
      },
      codeSent: (verificationId, forceResendingToken) {
        this.verificationId = verificationId;
        Get.toNamed(Routes.OTP);
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId = verificationId;
      },
    );
  }

  Future<bool> verifyOtp(String otp) async {
    try {
      await _auth.signInWithCredential(PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp));
    } on FirebaseAuthException catch (e) {
      Util.showError(e.message.toString());
    }

    return user != null;
  }

  _initScreen(user) {
    if (user == null) {
      Get.offAllNamed(Routes.LOGIN);
    } else {
      Get.offAllNamed(Routes.HOME);
    }
  }
}
