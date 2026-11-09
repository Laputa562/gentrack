
import 'package:flutter/material.dart';
import 'package:lab/models/payment.dart';
import '../widgets/payment_list.dart';
import '../widgets/summary_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GenTrack'),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint('Settings Tapped');
            },
            icon: const Icon(Icons.settings),
          ),
          TextButton(
            onPressed: () {
              debugPrint('See all');
            },
            child: const Text('See all'),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final card = SummaryCard(total: totalOf(samplePayments));
          final list = PaymentList(payments: samplePayments);
          if (constraints.maxWidth < 600) {
            return Column(
              children: [card, Expanded(child: list)],
            );
          }
          return Row(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [SizedBox(width: 300, child: card), Expanded(child: list)],
          );
        },
      ),
    );
  }
}
