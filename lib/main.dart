import 'package:chat_using_websocket/controller/auth/auth_provider.dart';
import 'package:chat_using_websocket/core/theme/theme.dart';
import 'package:chat_using_websocket/firebase_options.dart';
import 'package:chat_using_websocket/view/pages/home_page.dart';
import 'package:chat_using_websocket/view/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: themeData,
      debugShowCheckedModeBanner: false,
      // home
      home: ref.watch(isUserLoginProvider).when(
            data: (data) => data == null ? const LoginPage() : const HomePage(),
            error: (error, stackTrace) => const LoginPage(),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
