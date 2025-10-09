import "package:flutter/material.dart";
import "package:razorpay_flutter/razorpay_flutter.dart";
import "package:fluttertoast/fluttertoast.dart";

class RazorpayPage extends StatefulWidget {
  const RazorpayPage({super.key});

  @override
  State<RazorpayPage> createState() => _RazorpayPageState();
}

class _RazorpayPageState extends State<RazorpayPage> {
  late Razorpay _razorpay;
  TextEditingController amountController = new TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentFailure);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100,),
            Text("Welcome to Razorpay Payment Gateway Integration", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold,), textAlign: TextAlign.center,),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                cursorColor: Colors.white,
                autofocus: false,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Enter Amount to be paid",
                  labelStyle: TextStyle(color: Colors.white, fontSize: 15),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white, width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white, width: 1,
                    ),
                  ),
                  errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                ),
                controller: amountController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please an amount to be paid";
                  } return null;
                },
              )
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed: () {
                if (amountController.text.toString().isNotEmpty) {
                  setState(() {
                    double amount = double.parse(amountController.text.toString());
                    openCheckout(amount);
                  });
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text("Make Payment"),
              ),
            )
          ],
        )
      )
    );
  }

  void openCheckout(double amount) async {
    amount *= 100;

    final options = {
      "key": "rzp_test_1DP5mmOlF5G5ag",
      "amount": amount,
      "name": "Rex W.",
      "prefill": {
        "contact": "1234567890",
        "email": "test@gmail.com",
      },
      "external": {
        "wallets": ["paytm"],
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: "Payment Successful ${response.paymentId!}", toastLength: Toast.LENGTH_SHORT);
  }

  void handlePaymentFailure(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "Payment Failed ${response.message!}", toastLength: Toast.LENGTH_SHORT);
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "External Wallet ${response.walletName!}", toastLength: Toast.LENGTH_SHORT);
  }
}
