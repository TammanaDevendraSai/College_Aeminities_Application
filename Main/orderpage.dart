import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OrderScreen(),
    );
  }
}

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<Map<String, dynamic>> _cartItems = [];
  bool _showItemsList = false; // Flag to control visibility of items list

  void _addToCart(String item, double price) {
    setState(() {
      // Check if the item already exists in the cart
      var existingItemIndex =
          _cartItems.indexWhere((element) => element['name'] == item);
      if (existingItemIndex != -1) {
        // If it exists, increment its quantity
        _cartItems[existingItemIndex]['quantity'] += 1;
      } else {
        // If it doesn't exist, add it to the cart with quantity 1
        _cartItems.add({"name": item, "price": price, "quantity": 1});
        _showItemsList = true; // Show items list when item is added
      }
    });
  }

  void _removeFromCart(int index) {
    setState(() {
      // Decrease the quantity of the item
      _cartItems[index]['quantity'] -= 1;
      // If the quantity becomes zero, remove the item from the cart
      if (_cartItems[index]['quantity'] == 0) {
        _cartItems.removeAt(index);
        // Hide items list if cart becomes empty
        if (_cartItems.isEmpty) {
          _showItemsList = false;
        }
      }
    });
  }

  void _emptyCart() {
    setState(() {
      _cartItems.clear(); // Empty the cart
      _showItemsList = false; // Hide the items list
    });
  }

  double _calculateTotal() {
    double total = 0;
    for (var item in _cartItems) {
      total += (item["price"] * item['quantity']); // Multiply by quantity
    }
    return total;
  }

  void _handleDismiss(String item, double price) async {
    // Add a slight delay to simulate a smoother transition
    await Future.delayed(Duration(milliseconds: 200));
    _addToCart(item, price);
  }

  Widget _buildItem(String name, bool isVeg, double price) {
    IconData icon;
    Color iconColor;
    double iconSize = 40.0;
    double avatarRadius = 24.0;
    if (isVeg) {
      icon = Icons.eco;
      iconColor = Colors.green;
    } else {
      icon = Icons.whatshot;
      iconColor = Colors.red;
    }
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0), // Add border radius to item
        color: Color.fromARGB(
            255, 182, 181, 181), // Add a background color to item
      ),
      child: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.startToEnd,
        confirmDismiss: (_) async {
          // Add a slight delay to simulate a smoother transition
          await Future.delayed(Duration(milliseconds: 200));
          return true; // Return true to confirm dismiss
        },
        onDismissed: (_) {
          _addToCart(name, price);
        },
        background: Container(
          decoration: BoxDecoration(
            color: isVeg ? Colors.green : Colors.red,
            borderRadius: BorderRadius.only(
              topLeft:
                  Radius.circular(50.0), // Add border radius to the left side
              bottomLeft:
                  Radius.circular(50.0), // Add border radius to the left side
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.add_shopping_cart,
            color: Colors.white,
            size: iconSize,
          ),
        ),
        secondaryBackground: Container(
          color: isVeg ? Colors.green : Colors.red,
          padding: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.add_shopping_cart,
            color: Colors.white,
            size: iconSize,
          ),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 8.0),
          leading: Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: CircleAvatar(
              backgroundColor: iconColor,
              radius: avatarRadius,
              child: Icon(
                icon,
                color: Colors.white,
                size: iconSize,
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0.5),
                child: Text(
                  name,
                  style: TextStyle(
                    // color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 18.0), // Add left padding to the price
                child: Text(
                  '₹${price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  var names = [
    "Samosa",
    "Cream-bun",
    "Lays(red)",
    "Lays(green)",
    "Lays(blue)",
    "50-50 biscuit",
    "5-Star",
    "Dairy-Milk",
    "Crispello",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30, left: 10, right: 10),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  child: Image.asset(
                    'images/crispello_ad.jpg',
                    width: double.infinity, // Adjust width as needed
                    height: 200, // Adjust height as needed
                    fit: BoxFit.cover, // Adjust fit as needed
                  ),
                ),
                SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Items Bucket:',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Column(
                    children: [
                      for (int i = 0; i < names.length; i++)
                        _buildItem(names[i], i.isEven, 10.00 + (i * 5)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (_showItemsList)
            GestureDetector(
              onVerticalDragUpdate: (details) {
                if (details.primaryDelta! < -10) {
                  // Check if drag is upwards
                  DraggableScrollableActuator.reset(context);
                }
              },
              child: DraggableScrollableSheet(
                initialChildSize: 0.1,
                minChildSize: 0.1,
                maxChildSize: 0.6,
                builder: (
                  BuildContext context,
                  ScrollController scrollController,
                ) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, -3),
                        ),
                      ],
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.0),
                      ),
                    ),
                    child: ListView(
                      controller: scrollController,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 10.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total: ₹${_calculateTotal().toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color:
                                      Colors.orange, // Orange background color
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    // Add any action if needed
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PaymentPage(
                                          totalAmount: _calculateTotal(),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal: 20.0,
                                    ),
                                    child: Text(
                                      'Place Order',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          child: Text(
                            'Items in Cart:',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        for (int i = 0; i < _cartItems.length; i++)
                          ListTile(
                            title: Text(
                              '${_cartItems[i]["name"]} - ${_cartItems[i]['quantity']} x ₹${_cartItems[i]["price"].toStringAsFixed(2)}',
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.remove_circle_outline),
                              onPressed: () {
                                _removeFromCart(i);
                              },
                            ),
                          ),
                        SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          child: TextButton(
                            onPressed: _emptyCart,
                            child: Text('Empty Cart'),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

class PaymentPage extends StatelessWidget {
  final double totalAmount;

  const PaymentPage({Key? key, required this.totalAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Payment'),
      // ),
      body: Container(
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
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total to Pay:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '₹${totalAmount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Choose a payment method:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: _buildPaymentMethodButton(
                          context,
                          'Google Pay',
                          Icons.payment,
                          'images/google_pay.jpeg', // Image path for Google Pay
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: _buildPaymentMethodButton(
                          context,
                          'PhonePe',
                          Icons.payment,
                          'images/phonepe.jpeg', // Image path for PhonePe
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: _buildPaymentMethodButton(
                          context,
                          'Paytm',
                          Icons.payment,
                          'images/paytm.jpeg', // Image path for Paytm
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            // Indicator for payment success
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodButton(
      BuildContext context, String text, IconData iconData, String imagePath) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey[200],
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.0,
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(width: 10.0),
          Text(
            text,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
