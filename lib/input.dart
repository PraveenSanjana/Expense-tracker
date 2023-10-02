// ignore_for_file: unused_local_variable

import 'dart:async';
import 'package:flutter_sensors/flutter_sensors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sensors/sensors.dart';



import 'calendar.dart';
import 'chart.dart';
import 'home.dart';
import 'profile.dart';

class IncomeExpensePage extends StatefulWidget {
  @override
  _IncomeExpensePageState createState() => _IncomeExpensePageState();
}

class _IncomeExpensePageState extends State<IncomeExpensePage> {
  String selectedType = "Income"; // Initially selected as "Income"
  DateTime selectedDate = DateTime.now(); // Initially set to the current date
  String selectedCategory = ""; // Selected category

  // List of available categories for income
  final List<Map<String, dynamic>> incomeCategories = [
    {"name": "Salary", "icon": Icons.monetization_on},
    {"name": "Allowance", "icon": Icons.attach_money},
    {"name": "Petty Cash", "icon": Icons.account_balance_wallet},
    {"name": "Other", "icon": Icons.category},
  ];

  // List of available categories for expense
  final List<Map<String, dynamic>> expenseCategories = [
    {"name": "Food", "icon": Icons.restaurant},
    {"name": "Household", "icon": Icons.home},
    {"name": "Apparel", "icon": Icons.shopping_cart},
    {"name": "Education", "icon": Icons.school},
    {"name": "Health", "icon": Icons.local_hospital},
    {"name": "Social Life", "icon": Icons.favorite},
    {"name": "Transport", "icon": Icons.directions_car},
    {"name": "Pets", "icon": Icons.pets},
    {"name": "Beauty", "icon": Icons.face},
    {"name": "Other", "icon": Icons.category},
  ];

  bool showIncomeForm = true; // Flag to show income form

  TextEditingController amountController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  bool isShaking = false; // Flag to track if the device is currently shaking
  DateTime lastShakeTime = DateTime.now(); // Timestamp of the last detected shake

  // ... Rest of your code ...

  void initializeAccelerometer() {
    var accelerometerSubscription = accelerometerEvents.listen((AccelerometerEvent event) {
      final double totalAcceleration =
          event.x * event.x + event.y * event.y + event.z * event.z;

      final double shakeThreshold = 20.0;
      final Duration cooldownDuration = Duration(seconds: 2); // Cooldown period in seconds

      // Check if the device is shaking and if enough time has passed since the last shake
      if (totalAcceleration > shakeThreshold &&
          DateTime.now().difference(lastShakeTime) > cooldownDuration) {
        // Device is shaking, handle shake detection
        handleShake();
      }
    });
  }

  void handleShake() {
    // Update the last shake timestamp
    lastShakeTime = DateTime.now();

    // Perform actions only if the app is not already in a shaking state
    if (!isShaking) {
      setState(() {
        isShaking = true; // Set the shaking flag to true
      });

      // Handle shake action, e.g., clear form fields
      clearFormFields();

      // Display a message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Shaking detected! Form fields cleared.'),
          duration: Duration(seconds: 2),
        ),
      );

      // Reset the shaking flag after a delay (e.g., 1 second)
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          isShaking = false;
        });
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0), // Remove app bar height
        child: AppBar(
          backgroundColor: Colors.transparent, // Make the app bar transparent
          elevation: 0, // Remove app bar shadow
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20), // Add top padding to the title
            child: Center(
              child: Text(
                selectedType,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: selectedType == "Income" ? Color(0xFF524B4B) : Color(0xFF524B4B),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedType = "Income";
                    showIncomeForm = true; // Show income form when Income button is clicked
                    clearFormFields();
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: selectedType == "Income" ? Color(0xFF258778) : Color(0xFFEEEEEE),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text("Income", style: TextStyle(color: selectedType == "Income" ? Colors.white : Color(0xFF8C8989))),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedType = "Expense";
                    showIncomeForm = false; // Hide income form when Expense button is clicked
                    clearFormFields();
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: selectedType == "Expense" ? Color(0xFFB53535) : Color(0xFFEEEEEE),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text("Expense", style: TextStyle(color: selectedType == "Expense" ? Colors.white : Color(0xFF8C8989))),
              ),
            ],
          ),
          SizedBox(height: 20),
          showIncomeForm ? _buildIncomeForm() : _buildExpenseForm(),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40), // Add top border curve
        ),
        child: BottomAppBar(
          color: Color.fromARGB(255, 224, 224, 224), // Background color of the navigation bar
          child: SizedBox(
            height: 80, // Adjust the height as needed
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0), // Add left padding to Home icon
                  child: IconButton(
                    icon: Icon(
                      Icons.home,
                      size: 35, // Increase the icon size
                    ),
                    onPressed: () {
                      // Navigate to HomePage.dart when Home icon is clicked
                      //Navigator.push(
                       // context,
                        //MaterialPageRoute(builder: (context) => HomePage()),
                      //);
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.show_chart,
                    size: 37, // Increase the icon size
                  ),
                  onPressed: () {
                    // Handle Graphs button press or navigate to a Graphs page
                    // You can replace the following code with navigation logic to a Graphs page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChartPage()),
                    );
                  },
                ),
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF2A9886), // Background color of the circle
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(0.0), // Add padding to the Plus icon
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          size: 32, // Increase the icon size
                          color: const Color.fromARGB(255, 255, 255, 255), // Plus mark color
                        ),
                        onPressed: () {
                          // Navigate to IncomeExpense.dart when Plus icon is clicked
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => IncomeExpensePage()),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.calendar_today,
                    size: 32, // Increase the icon size
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CalendarPage()),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0), // Add right padding to Profile icon
                  child: IconButton(
                    icon: Icon(
                      Icons.person,
                      size: 32, // Increase the icon size
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage(userName: '',)),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIncomeForm() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Date",
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null && pickedDate != selectedDate) {
                      setState(() {
                        selectedDate = pickedDate;
                      });
                    }
                  },
                ),
              ),
              readOnly: true,
              controller: TextEditingController(
                text: "${selectedDate.toLocal()}".split(' ')[0],
              ),
            ),
            TextFormField(
              controller: amountController,
              decoration: InputDecoration(
                labelText: "Amount",
              ),
              keyboardType: TextInputType.number,
            ),
            InkWell(
              onTap: () {
                _showCategoryPicker(incomeCategories);
              },
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: "Category",
                  suffixIcon: Icon(Icons.arrow_drop_down),
                ),
                child: Text(selectedCategory.isNotEmpty ? selectedCategory : "Select a category"),
              ),
            ),
            TextFormField(
              controller: noteController,
              decoration: InputDecoration(
                labelText: "Note",
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFFE5E5E5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    // Implement your save functionality here
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Center(
                    child: Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpenseForm() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Date",
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null && pickedDate != selectedDate) {
                      setState(() {
                        selectedDate = pickedDate;
                      });
                    }
                  },
                ),
              ),
              readOnly: true,
              controller: TextEditingController(
                text: "${selectedDate.toLocal()}".split(' ')[0],
              ),
            ),
            TextFormField(
              controller: amountController,
              decoration: InputDecoration(
                labelText: "Amount",
              ),
              keyboardType: TextInputType.number,
            ),
            InkWell(
              onTap: () {
                _showCategoryPicker(expenseCategories);
              },
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: "Category",
                  suffixIcon: Icon(Icons.arrow_drop_down),
                ),
                child: Text(selectedCategory.isNotEmpty ? selectedCategory : "Select a category"),
              ),
            ),
            TextFormField(
              controller: noteController,
              decoration: InputDecoration(
                labelText: "Note",
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    // Implement your save functionality here
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Center(
                    child: Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCategoryPicker(List<Map<String, dynamic>> categoryList) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0), // Remove content padding
          backgroundColor: Colors.grey[200], // Set background color to gray
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Category"),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.2,
                ),
                itemCount: categoryList.length,
                itemBuilder: (BuildContext context, int index) {
                  final category = categoryList[index];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedCategory = category["name"];
                      });
                      Navigator.of(context).pop();
                    },
                    child: Column(
                      children: [
                        Icon(category["icon"], size: 40),
                        SizedBox(height: 8),
                        Text(category["name"]),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  void clearFormFields() {
    amountController.clear();
    noteController.clear();
    selectedCategory = "";
  }
}

void main() {
  runApp(MaterialApp(
    home: IncomeExpensePage(),
  ));
}
