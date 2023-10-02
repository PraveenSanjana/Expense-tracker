// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'chart.dart';
import 'home.dart';
import 'input.dart';
import 'profile.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TableCalendar(
                calendarFormat: _calendarFormat,
                focusedDay: _focusedDay,
                firstDay: DateTime(2000),
                lastDay: DateTime(2101),
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });

                  _showBottomSheet();
                },
              ),
            ),
          ),
        ],
      ),
       bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40),
        ),
        child: BottomAppBar(
          color: Color.fromARGB(255, 224, 224, 224),
          child: SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.home,
                      size: 35,
                    ),
                    onPressed: () {
                      // Handle Home button press or navigate to a Home page
                      // You can replace the following code with navigation logic to a Home page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.show_chart,
                    size: 37,
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
                    color: Color(0xFF2A9886),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          size: 32,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                        onPressed: () {
                          // Handle Plus button press or navigate to an IncomeExpense page
                          // You can replace the following code with navigation logic to an IncomeExpense page
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
                    size: 32,
                  ),
                  onPressed: () {
                    // Handle Calendar button press or navigate to a Calendar page
                    // You can replace the following code with navigation logic to a Calendar page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CalendarPage()),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.person,
                      size: 32,
                    ),
                    onPressed: () {
                      // Handle Profile button press or navigate to a Profile page
                      // You can replace the following code with navigation logic to a Profile page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage(userName: '',)),
                      );
                    },
                ),
            ),
            ],
            ),
          ),
        ),
       )
    );
  }

 void _showBottomSheet() {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18.0)),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the bottom sheet
                      },
                    ),
                    Text(
                      "${_selectedDay.toLocal()}".split(' ')[0], // Display selected date
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              _buildCategoryItem(Icons.monetization_on, "Salary", "150,000"),
              _buildCategoryItem(Icons.attach_money, "Allowance", "10000"),
              _buildCategoryItem(Icons.account_balance_wallet, "Petty Cash", "500"),
              _buildCategoryItem(Icons.category, "Other", "2000"),
              _buildCategoryItem(Icons.restaurant, "Food", "3000"),
            ],
          ),
        ),
      );
    },
  );
}



Widget _buildCategoryItem(IconData icon, String category, String amount) {
  return Container(
    width: 316,
    height: 53,
    margin: EdgeInsets.only(bottom: 16),
    decoration: BoxDecoration(
      color: Color(0xFFF6F6F6),
      borderRadius: BorderRadius.circular(18),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Icon(icon, color: const Color.fromARGB(255, 0, 0, 0)),
        ),
        Text(category),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(amount),
        ),
      ],
    ),
  );
}
}