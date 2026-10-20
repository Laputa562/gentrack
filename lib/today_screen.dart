import 'package:flutter/material.dart';


class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  int _readings = 0;
  int _faults = 0;

  void _logReading({bool fault = false}) => setState(() {
    _readings++;
    if (fault) _faults++;
  });



  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('GenTrack — Today'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.electric_meter, size: 96),
            Text('$_readings readings', style: text.headlineMedium),

            Text('$_faults faults reported', style: text.titleMedium),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _logReading,
        icon: const Icon(Icons.add),
        label: const Text('Log reading'),
      ),
      persistentFooterButtons: [
        TextButton(
          onPressed: () => _logReading(fault: true),
          child: const Text('Log fault'),
        ),
      ],
    );
  }
}