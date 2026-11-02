import 'package:flutter/material.dart';
import '../models/payment.dart';


class SummaryCard extends StatelessWidget{
  final int total;

  const SummaryCard({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.orange.shade100,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.bolt,
            size: 40,
            color: Colors.orange,
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Total Paid'),
              Text(
                formatIqd(totalOf(samplePayments)),
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${samplePayments.length} Payments'
              ),
            ],
          ),
        ],
      ),
    );
  }
}