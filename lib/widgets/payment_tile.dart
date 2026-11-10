import 'package:flutter/material.dart';
import '../models/payment.dart';


class PaymentTile extends StatelessWidget {
  final Payment payment;
  final VoidCallback onDelete;

  const PaymentTile({super.key, required this.payment, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(iconFor(payment.category)),
      ),
      title: Text(payment.title),
      subtitle: Text(payment.category),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
      children: [
      Text(
        formatIqd(payment.amount),
        style: Theme.of(context).textTheme.titleMedium,
      ),
    IconButton(onPressed: onDelete, icon: const Icon(Icons.delete_outline))
      ],
      )
    );
  }
}

IconData iconFor(String category){
  switch(category){
    case 'Generator':
      return Icons.power;
    case 'Mains':
      return Icons.electrical_services;
    case 'Fuel':
      return Icons.local_gas_station;
    case 'Repairs':
      return Icons.build;
    case 'Health':
      return Icons.local_hospital;
      default:
        return Icons.payment;
  }
}