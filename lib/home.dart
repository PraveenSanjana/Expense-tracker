import 'package:expense_tracker/calendar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'chart.dart';
import 'input.dart';
import 'profile.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String firstName = "John"; // Replace with the user's first name
  final String profileImagePath = 'assets/images/profile.png'; // Replace with the actual image path

  late DateTime currentDate;

  // Sample income and expense data for demonstration
  final List<Map<String, dynamic>> incomeData = [
    {
      'icon': Icons.monetization_on,
      'category': 'Salary',
      'date': '01-09-2023',
      'amount': '10,0000.00',
    },
    {
      'icon': Icons.account_balance_wallet,
      'category': 'Pety cash',
      'date': '02-09-2023',
      'amount': '5,000.00',
    },
    {
      'icon': Icons.account_balance_wallet,
      'category': 'Petty cash',
      'date': '04-09-2023',
      'amount': '6,000.00',
    },
    {
      'icon': Icons.category,
      'category': 'other',
      'date': '05-09-2023',
      'amount': '10,000.00',
    },
    {
      'icon': Icons.category,
      'category': 'Other',
      'date': '07-09-2023',
      'amount': '9,000.00',
    },
    {
      'icon': Icons.attach_money,
      'category': 'Allowance',
      'date': '09-09-2023',
      'amount': '1,000.00',
    },
    
  ];

  final List<Map<String, dynamic>> expenseData = [
    {
      'icon': Icons.restaurant,
      'category': 'Food',
      'date': '02-09-2023',
      'amount': '5000.00',
    },
    {
      'icon': Icons.home,
      'category': 'Household',
      'date': '03-09-2023',
      'amount': '20000.00',
    },
    {
      'icon': Icons.school,
      'category': 'Education',
      'date': '01-09-2023',
      'amount': '10,000.00',
    },
    {
      'icon': Icons.pets,
      'category': 'pets',
      'date': '01-09-2023',
      'amount': '10,000.00',
    },
  ];

  @override
  void initState() {
    super.initState();
    currentDate = DateTime.now();
  }

  void _navigateToPreviousMonth() {
    setState(() {
      currentDate = DateTime(currentDate.year, currentDate.month - 1, currentDate.day);
    });
  }

  void _navigateToNextMonth() {
    setState(() {
      currentDate = DateTime(currentDate.year, currentDate.month + 1, currentDate.day);
    });
  }

  String _getFormattedMonthYear(DateTime date) {
    return DateFormat('MMMM yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs (Income and Expenses)
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(28.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello, $firstName', // Display the user's first name
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Manage your budget here',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 30, // Adjust the size of the profile image as needed
                    backgroundImage: AssetImage(profileImagePath),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    // Add padding to the right of the back arrow
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        _navigateToPreviousMonth();
                      },
                    ),
                  ),
                  Text(
                    _getFormattedMonthYear(currentDate), // Display formatted month and year
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0), // Add padding to the left of the forward arrow
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward),
                      onPressed: () {
                        _navigateToNextMonth();
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topCenter, // Align text to the top center
                child: Stack(
                  children: [
                    Positioned(
                      top: 0, // Adjust the vertical position
                      left: 12, // Adjust the horizontal position
                      child: Container(
                        width: 337,
                        height: 108,
                        decoration: BoxDecoration(
                          color: Color(0xFF8DCAC1), // Background color of the outer rectangle
                          borderRadius: BorderRadius.circular(19),
                        ),
                      ),
                    ),
                    Container(
                      width: 390,
                      height: 180,
                      margin: EdgeInsets.all(4), // Margin to create a border effect
                      decoration: BoxDecoration(
                        color: Color(0xFF2A9886), // Background color of the inner rectangle
                        borderRadius: BorderRadius.circular(19), // Slightly smaller radius for inner rectangle
                      ),
                    ),
                    Positioned.fill(
                      top: 25, // Adjust the vertical position
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              'Total Balance',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFEBE2E2),
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Rs 32,000.00', // Replace with your dynamic balance value
                              style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFFFCFC),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      left: 16,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white, // Circle background color
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_upward,
                            size:30,
                            color: Colors.green, // Arrow color
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      right: 16,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white, // Circle background color
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_downward,
                            size:30,
                            color: Colors.red, // Arrow color
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      left: 64,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Income', // Display Income text
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFE4E2E2),
                            ),
                          ),
                          Text(
                            'Rs 10,000.00', // Replace with your dynamic income value
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFE4E2E2),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      right: 64,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Expenses', // Display Expense text
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFE4E2E2),
                            ),
                          ),
                          Text(
                            'Rs 5,000.00', // Replace with your dynamic expense value
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFE4E2E2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              
              TabBar(
                 indicatorColor: Colors.black, 
                labelColor: Color(0xFF000000),
                unselectedLabelColor: Color(0xFFB9B9B9),
                labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
                
                tabs: [
                  Tab(text: 'Income'), 
                  Tab(text: 'Expenses'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // Income List View
                    ListView.builder(
                      itemCount: incomeData.length,
                      itemBuilder: (context, index) {
                        final entry = incomeData[index];
                        return ListTile(
                          leading: Icon(entry['icon']),
                         title: Text(
        entry['category'],
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold, // Adjust the font size as needed
        ),
      ),
                          trailing: Text(
        entry['amount'],
        style: TextStyle(
          fontSize: 17, 
          fontWeight: FontWeight.bold,// Adjust the font size as needed
        ),
      ),// Display amount on the right side
                           subtitle: Text(
        '${entry['date']}',
        style: TextStyle(
          fontSize: 14, // Adjust the font size as needed
        ),
      ),
                        );
                      },
                    ),
                    // Expenses List View
                    ListView.builder(
                      itemCount: expenseData.length,
                      itemBuilder: (context, index) {
                        final entry = expenseData[index];
                        return ListTile(
                          leading: Icon(entry['icon']),
                          title: Text(
        entry['category'],
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold, // Adjust the font size as needed
        ),
      ),
                          trailing: Text(
        entry['amount'],
        style: TextStyle(
          fontSize: 17, 
          fontWeight: FontWeight.bold,// Adjust the font size as needed
        ),
      ),  // Display amount on the right side
                           subtitle: Text(
        '${entry['date']}',
        style: TextStyle(
          fontSize: 14, // Adjust the font size as needed
        ),
      ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
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



      ),
    );
  }
}