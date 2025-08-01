import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';

class AuthService {

  final LocalAuthentication localAuth = LocalAuthentication();

  Future<bool> authenticateLocally() async{
    bool isAuthenticate = false;

    try {
      isAuthenticate = await localAuth.authenticate(localizedReason: 'We need to authenticate for using this app.',
        options: AuthenticationOptions(
          stickyAuth: true,
          useErrorDialogs: true,
        )
      );
    } on PlatformException catch (e) {
      if (e.code == auth_error.notEnrolled) {
        // Add handling of no hardware here.
      } else if (e.code == auth_error.lockedOut ||
          e.code == auth_error.permanentlyLockedOut) {
        // ...
      } else {
        // ...
      }
    }
    catch(e) {
      isAuthenticate = false;
      if (kDebugMode) {
        print('Error: $e');
      }
    }

    return isAuthenticate;
  }
}