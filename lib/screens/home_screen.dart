
import 'package:flutter/material.dart';
import 'package:lab/models/payment.dart';
import '../widgets/category_chips.dart';
import '../widgets/payment_list.dart';
import '../widgets/summary_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Payment> _payments = samplePayments;

  String _category = 'All';

  void selectCategory(String category) {
    setState(() {
      _category = category;
    });
  }

  void _addPayment() {
    setState(() {
      _payments.insert(
        0,
        Payment(
          title: 'Fuse',
          amount: 2000,
          category: 'Generator',
          date: DateTime.now(),
        ),
      );
    });

    debugPrint('Added payment: ${_payments.length}');
  }

  void _deletePayment(Payment payment) {
    setState(() {
      _payments.remove(payment);
    });
  }

  List<Payment> _filtered() {
    if (_category == 'All') {
      return _payments;
    }

    final result = <Payment>[];

    for (final e in _payments) {
      if (e.category == _category) {
        result.add(e);
      }
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final visible = _filtered();

    final card = SummaryCard(total: totalOf(visible));

    final list = PaymentList(
      payments: visible,
      onDelete: _deletePayment,
    );

    final chips = CategoryChips(
      selected: _category,
      onSelected: selectCategory,
    );

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
      floatingActionButton: FloatingActionButton(
        onPressed: _addPayment,
        child: const Icon(Icons.add),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return Column(
              children: [
                card,
                chips,
                Expanded(child: list),
              ],
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 300, child: card),
              Expanded(child: list),
            ],
          );
        },
      ),
    );
  }
}