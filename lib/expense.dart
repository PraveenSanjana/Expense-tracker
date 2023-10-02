// expense.dart

class Expense {
  String date;
  double amount;
  String category;
  String note;

  Expense({required this.date, required this.amount, required this.category, this.note = ""});

  // Create a factory constructor to convert a Map to an Expense object
  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      date: json['date'],
      amount: json['amount'],
      category: json['category'],
      note: json['note'],
    );
  }

  // Convert an Expense object to a Map
  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'amount': amount,
      'category': category,
      'note': note,
    };
  }
}
