import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CheckoutScreen extends StatefulWidget {
  final Map product;

  CheckoutScreen({required this.product});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Handle successful payment
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment successful")));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Handle payment error
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment failed")));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Handle external wallet payment
  }

  void startPayment() {
    var options = {
      'key': 'rzp_test_lETgz3XKxitYMk',
      'amount': widget.product['price'] * 100, // Razorpay amount is in paise
      'name': widget.product['title'],
      'description': 'Payment for ${widget.product['title']}',
      'prefill': {
        'contact': '1234567890',
        'email': 'test@example.com'
      },
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Column(
        children: [
          ListTile(
            leading: Image.network(widget.product['thumbnail']),
            title: Text(widget.product['title']),
            subtitle: Text('\u{20B9} ${widget.product['price']}'),
          ),
          Spacer(),
         Container(),
         /* Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: startPayment,
              child: Text('Checkout'),
            ),
          ),*/
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.blue,
            offset: Offset(0, 0),
            blurRadius: 0,
          ),
        ]),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 45),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            onPressed: startPayment,
            child: const Text("Buy Now")),
      ),
    );
  }
}
