import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:college_aeminities_application/orderpage.dart';
import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Food(),
    Events(),
    Details(),
    Files(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Home Page'),
        backgroundColor: Color.fromARGB(1, 185, 113, 237),
        // backgroundColor:Colors.transparent, // Remove background color of the title bar
        elevation: 0,
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, left: 5), // Add top padding
              child: Text(
                'Hello,Ishu....',
                // Add your text here
                style: GoogleFonts.fredoka(
                  fontSize: 32,
                ),
                // style: TextStyle(
                //   fontSize: 24,
                //   fontWeight: FontWeight.bold, // Add bold font weight
                //   fontStyle: FontStyle.italic, // Add italic font style
                //   fontFamily: 'Roboto', // Specify custom font family
                //   color: Color.fromARGB(255, 52, 51, 51), // Adjust font color
                // ),
              ),
            ),
            SizedBox(width: 8),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
                right: 20), // Adjust the right padding as needed
            child: IconButton(
              icon: Icon(Icons.account_circle,
                  size: 44,
                  color: Color.fromARGB(255, 52, 51,
                      51)), // Increase the size of the profile icon
              onPressed: () {
                // Add your profile button onPressed logic here
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserDetails()),
                );
              },
            ),
          ),
        ],
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
                color: Colors.grey,
                width: 1.0), // Add border to the top side of the container
          ),
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.fastfood,
                  color: _selectedIndex == 0 ? Colors.green : Colors.orange),
              label: 'Food',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event,
                  color: _selectedIndex == 1 ? Colors.green : Colors.orange),
              label: 'Events',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.airplay,
                  color: _selectedIndex == 2 ? Colors.green : Colors.orange),
              label: 'Details',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.drive_file_move_rtl,
                  color: _selectedIndex == 3 ? Colors.green : Colors.orange),
              label: 'Files',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green, // Set the color of the selected
          unselectedItemColor: Colors.orange,
          onTap: _onItemTapped,
          iconSize: 35,
          showSelectedLabels:
              true, // Set to true to show labels for selected items
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class UserDetails extends StatelessWidget {
  final Map<String, dynamic> userData = {
    'name': 'IshuRoy Lunavath',
    'rollNo': '208R1A6617',
    'image': 'https://via.placeholder.com/150', // URL to user image
    'gender': 'M',
    'branch': 'CSE(AIML)',
    'section': 'A',
    'sgpa': '8.0',
    'cgpa': '8.0',
    'bloodGroup': 'O+',
    'address': 'DEAD Street, Yamapuri, Yamalokam',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(
            1, 185, 113, 237), // Making app bar color transparent
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: Row(
          children: [
            // SizedBox(width: 10),
            IconButton(
              icon: Icon(Icons.close, size: 26),
              onPressed: () {
                // Close action
                Navigator.of(context).pop();
              },
            ),
            // SizedBox(width: 10),
            // Text("Close"),
            // Add spacing between icon and text
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(1, 185, 113, 237),
                Colors.white,
              ],
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 150,
                // color: Color(0xffef4949),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 10, left: 20), // Add top padding here
                        child: Container(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            radius: 80,
                            backgroundImage: AssetImage(
                              'images/user.png', // Dynamic image URL
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: 26, color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                    //text: 'Name: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(text: '${userData['name']}'),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                    //text: 'Roll No: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(text: '${userData['rollNo']}'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Basic Info:',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Gender: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: '${userData['gender']}'),
                        ],
                      ),
                    ),
                    Divider(height: 30, thickness: 1),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Branch: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: '${userData['branch']}'),
                        ],
                      ),
                    ),
                    Divider(height: 30, thickness: 1),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Section: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: '${userData['section']}'),
                        ],
                      ),
                    ),
                    Divider(height: 30, thickness: 1),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'SGPA: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: '${userData['sgpa']}'),
                        ],
                      ),
                    ),
                    Divider(height: 30, thickness: 1),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'CGPA: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: '${userData['cgpa']}'),
                        ],
                      ),
                    ),
                    Divider(height: 30, thickness: 1),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Blood Group: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: '${userData['bloodGroup']}'),
                        ],
                      ),
                    ),
                    Divider(height: 30, thickness: 1),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Address: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: '${userData['address']}'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Food extends StatefulWidget {
  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food> {
  // bool _isHovering = false;
  PageController _pageController = PageController();
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _stopTimer();
    _pageController.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.page! < 3) {
        _pageController.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        _pageController.jumpToPage(0);
      }
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(1, 185, 113, 237),
                Colors.white,
              ],
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  ),
                ),
              ),
              Container(
                height: 200,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: 4,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          'images/image_$index.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 2),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    4,
                    (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == index
                            ? Colors.pink // Active dot color
                            : const Color.fromARGB(
                                255, 166, 127, 127), // Inactive dot color
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          color: Colors.transparent,
                          height: 170,
                          child: Row(
                            children: [
                              _buildImageCard(
                                imagePath: 'images/snacks.png',
                                title: 'Snacks',
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OrderPage(),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(width: 20),
                              _buildImageCard(
                                imagePath: 'images/tiffin.jpeg',
                                title: 'Tiffins',
                                onPressed: () {
                                  // Add onPressed logic for Tiffins image
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20), // Add some spacing between the rows
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          color: Colors.transparent,
                          height: 170,
                          child: Row(
                            children: [
                              _buildImageCard(
                                imagePath: 'images/Fastfood.jpeg',
                                title: 'Meals',
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OrderPage(),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(width: 20),
                              _buildImageCard(
                                imagePath: 'images/other.png',
                                title: 'Others',
                                onPressed: () {
                                  // Add onPressed logic for Tiffins image
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageCard(
      {required String imagePath,
      required String title,
      required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          Container(
            width: 180,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
              border: Border.all(
                color: Colors.grey,
                width: 5,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.9),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Events extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(1, 185, 113, 237),
                  Colors.white,
                ],
              ),
            ),
            child: CalendarPage(),
          ),
        ),
      ),
    );
  }
}

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  Map<DateTime, List<String>> _events = {
    DateTime.now(): ['Event 1', 'Event 2'],
    DateTime.utc(2022, 2, 15): ['Event 3'],
    DateTime.utc(2024, 2, 29): ['Pegasus'], // Add event on February 29, 2024
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Upcoming events:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: 155,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0), // Add left padding
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                EventCard(
                  image: 'images/event_1.png', // Replace with actual image path
                  title: 'Tech-Expo', // Replace with actual event title
                  date: '10-03-2023', // Replace with actual event date
                ),
                EventCard(
                  image: 'images/event_2.png', // Replace with actual image path
                  title: 'Ignitt-IT', // Replace with actual event title
                  date: '23-03-2024', // Replace with actual event date
                ),
                EventCard(
                  image: 'images/event_3.png', // Replace with actual image path
                  title: 'Tech-Genesis', // Replace with actual event title
                  date: '18-03-2024', // Replace with actual event date
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Past events:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 54, 53, 53),
            ),
          ),
        ),
        SizedBox(
          height: 155,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0), // Add left padding
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                EventCard(
                  image: 'images/event_4.png', // Replace with actual image path
                  title: 'Alumini Meet 2k23', // Replace with actual event title
                  date: '20-09-2023', // Replace with actual event date
                ),
                EventCard(
                  image: 'images/event_5.png', // Replace with actual image path
                  title: 'Project Expo', // Replace with actual event title
                  date: '30-12-2023', // Replace with actual event date
                ),
                EventCard(
                  image: 'images/event_6.png', // Replace with actual image path
                  title:
                      'National youth day', // Replace with actual event title
                  date: '20-11-2023', // Replace with actual event date
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Events Calendar:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: TableCalendar(
              firstDay: DateTime.utc(2022, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                leftChevronIcon: Icon(Icons.chevron_left, color: Colors.black),
                rightChevronIcon:
                    Icon(Icons.chevron_right, color: Colors.black),
              ),
              availableGestures: AvailableGestures.horizontalSwipe,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                });

                if (_events[selectedDay] != null &&
                    _events[selectedDay]!.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          EventsPage(events: _events[selectedDay]!),
                    ),
                  );
                } else {
                  _showNoEventsPopup(context);
                }
              },
              onHeaderTapped: (_) {
                _showYearPickerDialog(context);
              },
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, date, _) {
                  if (_events[date] != null && _events[date]!.isNotEmpty) {
                    return Container(
                      margin: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.blue,
                            width: 10.0,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '${date.day}',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        '${date.day}',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _showYearPickerDialog(BuildContext context) async {
    final DateTime? pickedYear = await showDatePicker(
      context: context,
      initialDate: _focusedDay,
      firstDate: DateTime.utc(2022, 1, 1),
      lastDate: DateTime.utc(2030, 12, 31),
      initialDatePickerMode: DatePickerMode.year,
    );

    if (pickedYear != null) {
      setState(() {
        _focusedDay = pickedYear;
      });
    }
  }

  void _showNoEventsPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('No Events'),
          content: Text('There are no events for the selected date.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class EventsPage extends StatelessWidget {
  final List<String> events;

  const EventsPage({Key? key, required this.events}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EventDetailsPage(eventName: events[index]),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20.0), // Increased border radius
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        events[index] == 'Tech-Expo'
                            ? 'images/event_1.png'
                            : 'images/event_2.png', // Change to actual image path or use different images based on event name
                        width: double.infinity,
                        height: 150,
                        fit: BoxFit
                            .cover, // Image fitted to cover the entire space
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      events[index],
                      style: TextStyle(fontSize: 14.0), // Reduced font size
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class EventDetailsPage extends StatelessWidget {
  final String eventName;

  const EventDetailsPage({Key? key, required this.eventName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(eventName),
      ),
      body: Center(
        child: Text(
            'Event details for $eventName'), // Placeholder for event details
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String image;
  final String title;
  final String date;

  const EventCard(
      {Key? key, required this.image, required this.title, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Card tapped!');
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          width: 200,
          // height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  image,
                  width: double.infinity,
                  height: 100, // Increased image height
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 14, // Reduced font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    date,
                    style: TextStyle(
                      fontSize: 12, // Reduced font size
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(1, 185, 113, 237),
                Colors.white,
              ],
            ),
          ),
          child: DetailsPage(),
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(1, 185, 113, 237),
                Colors.white,
              ],
            ),
          ),
          child: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  _buildImageCard(
                    imagePath: 'images/stud_login.jpeg',
                    title: 'Student ERP',
                    onPressed: () {
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => OrderPage(),
                      //   ),
                      // );
                    },
                  ),
                  SizedBox(height: 20),
                  _buildImageCard(
                    imagePath: 'images/stud_fee.jpeg',
                    title: 'Fee Payment',
                    onPressed: () {
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => OrderPage(),
                      //   ),
                      // );
                    },
                  ),
                  SizedBox(height: 20),
                  _buildImageCard(
                    imagePath: 'images/stud_place.jpeg',
                    title: 'Placements',
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlacementDetailsPage(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  _buildImageCard(
                    imagePath: 'images/stud_atte.jpeg',
                    title: 'Attendence Tracker',
                    onPressed: () {
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => OrderPage(),
                      //   ),
                      // );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageCard(
      {required String imagePath,
      required String title,
      required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          Container(
            width: 320,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
              border: Border.all(
                color: Colors.grey,
                width: 5,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.9),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StudentLoginPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Login'),
      ),
      body: Center(
        child: Text('Student Login Page'),
      ),
    );
  }
}

class PlacementDetailsPage extends StatefulWidget {
  _PlacementDetailsPageState createState() => _PlacementDetailsPageState();
}

class _PlacementDetailsPageState extends State<PlacementDetailsPage> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  Map<DateTime, List<String>> _events = {
    DateTime.now(): ['Event 1', 'Event 2'],
    DateTime.utc(2022, 2, 15): ['Event 3'],
    DateTime.utc(2024, 2, 29): ['UBER'], // Add event on February 29, 2024
  };

  initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Placement Details'),
      // ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(1, 185, 113, 237),
                Colors.white,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Upcoming Drives',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              DriveBar(companies: ['Infosys', 'Capgemini', 'Accenture']),
              SizedBox(height: 3),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Past Drives',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              DriveBar(companies: ['Amazon', 'Google', 'Microsoft']),
              SizedBox(height: 3),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Placement Calendar',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 2),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: TableCalendar(
                    firstDay: DateTime.utc(2022, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      leftChevronIcon:
                          Icon(Icons.chevron_left, color: Colors.black),
                      rightChevronIcon:
                          Icon(Icons.chevron_right, color: Colors.black),
                    ),
                    availableGestures: AvailableGestures.horizontalSwipe,
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                      });

                      if (_events[selectedDay] != null &&
                          _events[selectedDay]!.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Events_Page(events: _events[selectedDay]!),
                          ),
                        );
                      } else {
                        _showNoEventsPopup(context);
                      }
                    },
                    onHeaderTapped: (_) {
                      _showYearPickerDialog(context);
                    },
                    calendarBuilders: CalendarBuilders(
                      defaultBuilder: (context, date, _) {
                        if (_events[date] != null &&
                            _events[date]!.isNotEmpty) {
                          return Container(
                            margin: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.blue,
                                  width: 10.0,
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '${date.day}',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Center(
                            child: Text(
                              '${date.day}',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showYearPickerDialog(BuildContext context) async {
    final DateTime? pickedYear = await showDatePicker(
      context: context,
      initialDate: _focusedDay,
      firstDate: DateTime.utc(2022, 1, 1),
      lastDate: DateTime.utc(2030, 12, 31),
      initialDatePickerMode: DatePickerMode.year,
    );

    if (pickedYear != null) {
      setState(() {
        _focusedDay = pickedYear;
      });
    }
  }

  _showNoEventsPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('No Scheduled Drives'),
          content: Text('There are no placement drives for the selected date.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class DriveBar extends StatelessWidget {
  final List<String> companies;

  DriveBar({required this.companies});

  Widget build(BuildContext context) {
    return Column(
      children: companies.map((company) {
        return GestureDetector(
          onTap: () {
            // Navigate to CompanyDetailsPage when a company is tapped
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CompanyDetailsPage(
                  companyName: company,
                  companyInformation:
                      'Some information about $company', // You can replace this with actual company information
                ),
              ),
            );
          },
          child: Container(
            height: 40, // Adjust the height as needed
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Color(0x9f8d0a2f7),
              border: Border.all(color: Color.fromARGB(255, 99, 97, 97)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: 16.0), // Add left padding to text
                  child: Text(company, style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: 5.0), // Add right padding to icon
                  child:
                      Icon(Icons.arrow_right, size: 35), // Add ">" symbol here
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class CompanyDetailsPage extends StatelessWidget {
  final String companyName;
  final String companyInformation;

  CompanyDetailsPage(
      {required this.companyName, required this.companyInformation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(companyName),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Company Name: $companyName',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Information:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              companyInformation,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class StudentFeePaymentPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Fee Payment'),
      ),
      body: Center(
        child: Text('Student Fee Payment Page'),
      ),
    );
  }
}

class AttendanceViewerPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Viewer'),
      ),
      body: Center(
        child: Text('Attendance Viewer Page'),
      ),
    );
  }
}

class Events_Page extends StatelessWidget {
  final List<String> events;

  Events_Page({required this.events});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(events[index]),
          );
        },
      ),
    );
  }
}

class Files extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FilePage(),
    );
  }
}

class FilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(1, 185, 113, 237),
              Colors.white,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RectangularBox(name: 'SSC/CBSE/ICSE Memo', documentPath: ''),
            RectangularBox(
                name: '12th Memo', documentPath: 'tempfiles/nagaraju.pdf'),
            RectangularBox(name: 'TC & Bonafide', documentPath: ''),
            RectangularBox(name: 'Caste Certificate', documentPath: ''),
            RectangularBox(name: 'Income Certificate', documentPath: ''),
            RectangularBox(
                name: 'Study/Conuduct Certificate', documentPath: ''),
            RectangularBox(name: 'I BTECH I Sem Result', documentPath: ''),
            RectangularBox(name: 'I BTECH II Sem Result', documentPath: ''),
          ],
        ),
      ),
    );
  }
}

class RectangularBox extends StatelessWidget {
  final String name;
  final String documentPath;

  const RectangularBox(
      {Key? key, required this.name, required this.documentPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (documentPath.isNotEmpty) {
          // If document exists, open it on another page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DocumentViewerPage(documentPath: documentPath),
            ),
          );
        } else {
          // If document doesn't exist, show popup to upload
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('No Document'),
                content: Text(
                    'There are no documents available for $name. Would you like to upload one?'),
                actions: [
                  TextButton(
                    onPressed: () async {
                      // Add code to handle document upload
                      FilePickerResult? result;
                      try {
                        result = await FilePicker.platform.pickFiles();
                      } catch (e) {
                        print('Error picking file: $e');
                      }

                      if (result != null && result.files.isNotEmpty) {
                        String? filePath = result.files.first.path;
                        if (filePath != null) {
                          print('File picked: $filePath');
                          // You can handle the uploaded file here
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('File uploaded successfully!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        } else {
                          print('No file selected');
                        }
                      } else {
                        print('File picking canceled or no file selected');
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('File uploaded successfully!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      Navigator.of(context).pop();
                    },
                    child: Text('Upload'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                ],
              );
            },
          );
        }
      },
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          // color: Color.fromARGB(1, 185, 113, 237),
          color: Color(0x9f8d0a2f7),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            Icon(
              Icons.chevron_right,
              color: Colors.black,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class DocumentViewerPage extends StatelessWidget {
  final String documentPath;

  const DocumentViewerPage({Key? key, required this.documentPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Document Viewer'),
        ),
        body: SfPdfViewer.asset(documentPath));
  }
}
