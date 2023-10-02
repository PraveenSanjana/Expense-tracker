import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'calendar.dart';
import 'home.dart';
import 'input.dart';
import 'profile.dart';

void main() {
  runApp(MaterialApp(
    home: ChartPage(),
  ));
}

class ChartPage extends StatefulWidget {
  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> with SingleTickerProviderStateMixin {
  bool isMonthlyView = true;
  DateTime selectedDate = DateTime.now();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      initialIndex: 0,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(''),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isMonthlyView = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: isMonthlyView ? Color(0xFF258778) : const Color.fromARGB(255, 255, 255, 255),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text('Monthly'),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isMonthlyView = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: !isMonthlyView ? Colors.blue : Colors.grey,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text('Summary'),
              ),
            ],
          ),
          if (isMonthlyView)
            Center(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          setState(() {
                            selectedDate = DateTime(
                              selectedDate.year,
                              selectedDate.month - 1,
                            );
                          });
                        },
                        icon: Icon(Icons.arrow_back),
                      ),
                      SizedBox(width: 16),
                      Text(
                        "${_getMonthName(selectedDate.month)}, ${selectedDate.year}",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 16),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            selectedDate = DateTime(
                              selectedDate.year,
                              selectedDate.month + 1,
                            );
                          });
                        },
                        icon: Icon(Icons.arrow_forward),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          if (isMonthlyView)
            Expanded(
              child: Column(
                children: <Widget>[
                  TabBar(
                    controller: _tabController,
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
                      controller: _tabController,
                      children: [
                        _buildIncomeTab(),
                        _buildExpensesTab(),
                      ],
                    ),
                  ),
                ],
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
      ),
    );
  }

  Widget _buildIncomeTab() {
    return Column(
      children: [
        Container(
          height: 300,
          child: PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 40,
              sections: _generatePieSectionsIncome(),
            ),
            swapAnimationDuration: Duration(milliseconds: 150),
          ),
        ),
        SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: pieDataIncome.length,
            itemBuilder: (context, index) {
              final data = pieDataIncome[index];
              return _buildCategoryRow(data['color'], data['category'], data['percentage']);
            },
          ),
        ),
      ],
    );
  }

  List<Map<String, dynamic>> pieDataIncome = [
    {"color": Colors.blue, "category": "Salary", "percentage": "40%"},
    {"color": Colors.green, "category": "Allowance", "percentage": "20%"},
    {"color": Colors.red, "category": "Petty Cash", "percentage": "10%"},
    {"color": Colors.orange, "category": "Other", "percentage": "30%"},
  ];

  List<PieChartSectionData> _generatePieSectionsIncome() {
    final List<Color> pieColors = pieDataIncome.map((data) => data['color'] as Color).toList();
    final List<double> piePercentages = [0.4, 0.2, 0.1, 0.3];

    return List.generate(4, (index) {
      return PieChartSectionData(
        color: pieColors[index],
        value: piePercentages[index],
        title: '',
        radius: 60,
        titleStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: const Color(0xffffffff),
        ),
      );
    });
  }

  Widget _buildExpensesTab() {
    return Column(
      children: [
        Container(
          height: 300,
          child: PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 40,
              sections: _generatePieSectionsExpenses(),
            ),
            swapAnimationDuration: Duration(milliseconds: 150),
          ),
        ),
        SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: pieDataExpenses.length,
            itemBuilder: (context, index) {
              final data = pieDataExpenses[index];
              return _buildCategoryRow(data['color'], data['category'], data['percentage']);
            },
          ),
        ),
      ],
    );
  }

  List<Map<String, dynamic>> pieDataExpenses = [
    {"color": Colors.purple, "category": "Pets", "percentage": "5%"},
    {"color": Colors.green, "category": "Household", "percentage": "40%"},
    {"color": Colors.blue, "category": "Education", "percentage": "15%"},
    {"color": Colors.pink, "category": "Beauty", "percentage": "20%"},
    {"color": Colors.red, "category": "Food", "percentage": "20%"},
  ];

  List<PieChartSectionData> _generatePieSectionsExpenses() {
    final List<Color> pieColors = pieDataExpenses.map((data) => data['color'] as Color).toList();
    final List<double> piePercentages = [0.05, 0.4, 0.15, 0.2, 0.2];

    return List.generate(5, (index) {
      return PieChartSectionData(
        color: pieColors[index],
        value: piePercentages[index],
        title: '',
        radius: 60,
        titleStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: const Color(0xffffffff),
        ),
      );
    });
  }

  String _getMonthName(int month) {
    final List<String> monthNames = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return monthNames[month - 1];
  }

  Widget _buildCategoryRow(Color color, String category, String percentage) {
    return Container(
      width: 318,
      height: 46,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 12,
                height: 12,
                color: color,
              ),
              SizedBox(width: 16),
              Text(
                category,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Text(
              percentage,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
