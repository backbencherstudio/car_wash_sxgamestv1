import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class StripeServices {
  StripeServices._();
  static final StripeServices instance = StripeServices._();

  Future<void> initialize() async {
    Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY'].toString();
    await Stripe.instance.applySettings();
    debugPrint("\nStripe Initialized.\n");
  }

  Future<String?> createPaymentMethod({required String email}) async {
    try {
      final paymentMethod = await Stripe.instance.createPaymentMethod(
        params: PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(
            billingDetails: BillingDetails(email: email),
          ),
        ),
      );
      debugPrint("\npayment method id : ${paymentMethod.id}\n");
      return paymentMethod.id;
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Failed to create payment method",
        backgroundColor: Colors.red,
        fontSize: 14.sp,
      );
      throw Exception('\nFailed to create payment method: $e\n');
    }
  }
}
