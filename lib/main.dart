import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:laetus/authentication_service.dart';
import 'package:laetus/screens/home_page.dart';
import 'package:laetus/screens/sign_in_page.dart';
import 'package:laetus/screens/user_profile_screen.dart';
import 'package:provider/provider.dart';
//import 'package:cupertino_icons/cupertino_icons.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_pixels/image_pixels.dart';
import 'package:laetus/screens/color_selection_screen.dart';
// import 'dart:io';
// import 'dart:async';

// import './dropper.dart';

import './screens/color_selection_screen.dart';
import './screens/color_details_screen.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   HttpOverrides.global = new MyHttpOverrides();
//   await Firebase.initializeApp();
//   runApp(LaetusApp());
// }

// class LaetusApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         Provider<AuthenticationService>(
//           create: (_) => AuthenticationService(FirebaseAuth.instance),
//         ),
//         StreamProvider(
//           create: (context) =>
//               context.read<AuthenticationService>().authStateChanges,
//         ),
//       ],
//       child: MaterialApp(
//         home: AuthenticationWrapper(),
//       ),
//     );
//   }
// }

// class AuthenticationWrapper extends StatelessWidget {
//   const AuthenticationWrapper({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final firebaseUser = context.watch<User>();

//     if (firebaseUser != null) {
//       return MaterialApp(
//         initialRoute: ColorSelectionScreen.routeName,
//         routes: {
//           ColorSelectionScreen.routeName: (context) => ColorSelectionScreen(),
//           ColorDetailsScreen.routeName: (context) => ColorDetailsScreen(),
//         },
//       );
//       // return HomePage();
//     }
//     // return SignInPage();
//     return Scaffold(
//       body: Container(
//         child: SignInPage(
//           backgroundColor1: Color(0xFF444152),
//           backgroundColor2: Color(0xFF6f6c7d),
//           highlightColor: Color(0xff6b3850),
//           foregroundColor: Colors.white,
//           logo: new AssetImage("assets/images/LAETUS.png"),
//         ),
//       ),
//     );
//   }
// }

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }

// Test single screens
void main() {
  runApp(LaetusApp());
}

class LaetusApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserProfileScreen(),
    );
  }
}
