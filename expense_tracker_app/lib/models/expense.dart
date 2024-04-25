import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';  //library for generating universally unique identifiers
import 'package:intl/intl.dart';  //library for date formatting

final formatter = DateFormat.yMd();  //create 'formatter' object(instance) with the pattern 'yMd'

const uuid = Uuid();  //creates a constant instance 'uuid' of the "Uuid" class from the 'uuid' package

enum Category { food, travel, leisure, work }  //This enumeration will be used to categorize expenses.

const categoryIcons = {  //creates a constant map 'categoryIcons' that associates each 'Category' with a corresponding 'Icon' 
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.expensesList,
    required this.category,
  });

//named constructor 'forCategory' is used to create an 'ExpenseBucket' instance for a specific category.
  ExpenseBucket.forCategory(
    List<Expense> allExpenses,
    this.category,
  ) : expensesList = allExpenses.where((expense) => expense.category == category).toList();

  final List<Expense> expensesList;
  final Category category;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expensesList) {
      sum += expense.amount; // sum = sum + expense.amount
    }

    return sum;
  }
}
