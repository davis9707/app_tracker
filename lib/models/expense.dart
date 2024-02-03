import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();
final uuid = const Uuid();

// Predefined allowed values for categories
enum Category { food, travel, leisure, work, study }
// Adding Icons to category

const categoryIcons = {
  Category.food: Icons.dinner_dining,
  Category.leisure: Icons.beach_access,
  Category.travel: Icons.flight,
  Category.study: Icons.book,
  Category.work: Icons.work
};

class Expense {
  // constructor
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();
  // values for the expense
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

// class ExpenseBucket {
//   final Category category;
//   final List<Expense>
// }
