import 'package:flutter/material.dart';
import '../models/payment.dart';


class SummaryCard extends StatelessWidget{
  final int total;

  const SummaryCard({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.secondaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            Icons.bolt,
            size: 40,
            color: colors.onSecondaryContainer,
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total Paid',
              style: text.bodyMedium?.copyWith(color: colors.onSecondaryContainer),
                ),
              Text(
                formatIqd(total),
                style: text.headlineMedium?.copyWith(color: colors.onSecondaryContainer,
                    fontWeight: FontWeight.bold
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