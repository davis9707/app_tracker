import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseDetail extends StatelessWidget {
  const ExpenseDetail({super.key, required this.expense});
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back), // Add the return icon here
            onPressed: () {
              Navigator.pop(context); // Navigate back when the icon is pressed
            },
          ),
          title: Text('Expense Detail'),
        ),
        body: Container(
            height: 100,
            child: Card(
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          expense.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: <Widget>[
                            Text('${expense.amount.toStringAsFixed(2)}'),
                            const Spacer(),
                            Row(
                              children: [
                                Icon(categoryIcons[expense.category]),
                                const SizedBox(width: 8),
                                Text(expense.formattedDate),
                              ],
                            )
                          ],
                        )
                      ],
                    )))));
  }
}
