// ignore_for_file: prefer_final_fields, unused_local_variable, avoid_print

import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class GoogleSignInService {
  static GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  static Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      final googleKey = await account!.authentication;
      //print(account);
      //print('============ ID TOKEN ===============');
      //print(googleKey.idToken);

      //TODO: Llamar un servicio REST a nuestro backend
      final signInWithGoogleEndpoint = Uri(
          scheme: 'https',
          host: 'auth-backen-idtoken-google.onrender.com',
          path: '/google');

      final session = await http
          .post(signInWithGoogleEndpoint, body: {'token': googleKey.idToken});
      print('===== BACKEND =====');
      print(session.body);

      return account;

      // TODO: idToken
    } catch (e) {
      print('Error en Google Signin');
      print(e);
      return null;
    }
  }

  static Future signOut() async {
    await _googleSignIn.signOut();
  }
}
