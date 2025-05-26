import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:music_service_module/presentation/screens/home/home_screen.dart';
import 'package:music_service_module/presentation/screens/home/home_viewmodel.dart';
import 'package:provider/provider.dart';

import 'core/di/service_locator.dart';
import 'core/theme/material_theme.dart';
import 'core/theme/text_theme.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = createTextTheme(
      context,
      "Syne",
      "Lobster",
    );
    final materialTheme = MaterialTheme(textTheme);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) {
          final vm = getIt<HomeViewModel>();
          vm.loadServices();
          return vm;
        }),
      ],
      child: MaterialApp(
        title: 'Your App',
        debugShowCheckedModeBanner: false,
        theme: materialTheme.light(),
        // Light theme
        darkTheme: materialTheme.light(),
        // Dark theme
        themeMode: ThemeMode.system,
        home: const HomeScreen(),
      ),
    );
  }
}
