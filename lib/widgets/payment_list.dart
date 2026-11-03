import 'package:flutter/material.dart';
import 'package:lab/widgets/payment_tile.dart';
import 'package:lab/widgets/summary_card.dart';

import '../models/payment.dart';

class PaymentList extends StatelessWidget{
  final List<Payment> payments;
  const PaymentList({
    super.key,
    required this.payments,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
                'Recent Payments',
                style: Theme.of(context).textTheme.titleMedium
            )
        ),
        Expanded(child: ListView(children: [

          for (final e in samplePayments)
            PaymentTile(payment: e)

        ],))
      ],
);  }
}