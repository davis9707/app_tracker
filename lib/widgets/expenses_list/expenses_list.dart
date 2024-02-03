import 'package:expense_tracker/widgets/expenses_list/expense_detail.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => GestureDetector(
          onTap: () {
            Navigator.of(ctx).push(MaterialPageRoute(
              builder: (context) => ExpenseDetail(expense: expenses[index]),
            ));
          },
          child: Dismissible(
              key: ValueKey(expenses[index]),
              background: Container(
                  color: Theme.of(context).colorScheme.error.withOpacity(0.75),
                  margin: EdgeInsets.symmetric(
                      horizontal:
                          Theme.of(context).cardTheme.margin!.horizontal)),
              onDismissed: (direction) {
                onRemoveExpense(expenses[index]);
              },
              child: ExpenseItem(expense: expenses[index]))),
    );
  }
}
