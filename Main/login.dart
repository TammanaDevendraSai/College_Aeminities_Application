import 'package:flutter/material.dart';
import 'package:college_aeminities_application/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 200), // Adjust the height as needed
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showLogin = true;
                      });
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          vertical: 20), // Adjust button height
                      minimumSize: Size(double.infinity, 0),
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(25), // Add more border radius
                      ), // Adjust button width
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showLogin = false;
                      });
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          vertical: 20), // Adjust button height
                      minimumSize: Size(double.infinity, 0),
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(25), // Add more border radius
                      ), // Adjust button width
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child:
                        _showLogin ? _buildLoginWidget() : _buildSignUpWidget(),
                  ),
                ),
              ),
            ),
            // SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginWidget() {
    return Visibility(
        visible: _showLogin,
        child: SizedBox(
            height: 230,
            child: Container(
                key: ValueKey<bool>(_showLogin),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(
                      0.5), // Adjust the opacity for the glass effect
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(
                          0.2), // Adjust the opacity for the shadow effect
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                // height: 600,
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        decoration: InputDecoration(hintText: 'Username'),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(hintText: 'Password'),
                        obscureText: true,
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ), // Increase font size
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 10), // Adjust button height
                            backgroundColor: Colors.green, // Background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  25), // Add more border radius
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))));
  }

  Widget _buildSignUpWidget() {
    return Visibility(
        visible: !_showLogin,
        child: SizedBox(
            height: 430,
            child: Container(
                key: ValueKey<bool>(_showLogin),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(
                      0.5), // Adjust the opacity for the glass effect
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(
                          0.2), // Adjust the opacity for the shadow effect
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        decoration: InputDecoration(hintText: 'Username'),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        decoration: InputDecoration(hintText: 'Password'),
                        obscureText: true,
                      ),
                      SizedBox(height: 5),
                      TextField(
                        decoration:
                            InputDecoration(hintText: 'Confirm Password'),
                        obscureText: true,
                      ),
                      SizedBox(height: 5),
                      TextField(
                        decoration: InputDecoration(hintText: 'Mobile Number'),
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: 5),
                      TextField(
                        decoration: InputDecoration(hintText: 'Year'),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 5),
                      TextField(
                        decoration: InputDecoration(hintText: 'Roll Number'),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Add your signup logic here
                          },
                          child: Text(
                            'Sign Up',
                            style:
                                TextStyle(fontSize: 18), // Increase font size
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 10), // Adjust button height
                            backgroundColor: Colors.green, // Background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  25), // Add more border radius
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
