import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CartScreen extends StatefulWidget {
  final dynamic product;

  CartScreen({required this.product});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void openCheckout() {
    var options = {
      'key': 'rzp_test_lETgz3XKxitYMk',
      'amount': widget.product['price'] * 100,
      'name': widget.product['title'],
      'description': 'Purchase',
      'prefill': {'contact': '8888888888', 'email': 'test@example.com'},
      'external': {'wallets': ['paytm']}
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Payment Successful: ${response.paymentId}');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Payment Error: ${response.code} | ${response.message}');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External Wallet: ${response.walletName}');
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
            subtitle: Text('\$${widget.product['price']}'),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: openCheckout,
              child: Text('Checkout'),
            ),
          ),
        ],
      ),
    );
  }
}
