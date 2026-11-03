import 'package:flutter/material.dart';
import 'package:lab/screens/home_screen.dart';
import 'package:lab/theme/app_theme.dart';
import 'models/payment.dart';

void main() {
  // Printed in the Debug Console when the app starts.
  for (final e in samplePayments) {
    print(e);
  }
  print('Total: ${formatIqd(totalOf(samplePayments))}');
  runApp(const GenTrackApp());
}

class GenTrackApp extends StatelessWidget {
  const GenTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    final total = totalOf(samplePayments);
    return MaterialApp(
      title: 'GenTrack',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      home: const HomeScreen()
    );
  }
}