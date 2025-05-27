import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class StripeServices {
  StripeServices._();
  static final StripeServices instance = StripeServices._();

  final String stripeSecurityKey =
      "pk_test_51R7YCuFKXEtfT5CGd9p48VbqDaf5azpaHB4rada6f7AzL7eTXG00GNPsRcPOQDdyLTduywLmHc9cUSm3QkAwzXa400zTadXSnn";

  ///create payment intent
  Future<String?> createPaymentIntent(
  //{
    // required int amount,
    // required String currency,
 // }
  ) async
  {
    try {
      Map<String, dynamic> body = {
        "amount": (10 * 100).toString(), // Convert to cents
        "currency": 'USD',
        "payment_method_types[]": "card", // Required by Stripe
      };

      final response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        body: jsonEncode(body),
        headers: {
          "Authorization": "Bearer $stripeSecurityKey",
          "Content-Type": "application/x-www-form-urlencoded",
        },
      );

      if (response.statusCode == 200) {
        debugPrint("\nresponse : ${response.body}\n");
        final decodedResponse = jsonDecode(response.body);
        return decodedResponse['client_secret']; // return only the needed part
      } else {
        return null;
      }
    } catch (error) {
      throw Exception('Failed to process payment : $error');
    }
  }


  Future<void> createPaymentMethod() async {
    try{
      Stripe.publishableKey = stripeSecurityKey;
      final paymentMethod = await Stripe.instance.createPaymentMethod(
          params: PaymentMethodParams.card(paymentMethodData: PaymentMethodData(
            billingDetails: BillingDetails(
              email: 'shakinhabib2000@gmail.com'
            )
          ),),
      );
      debugPrint("\npayment method id : ${paymentMethod.id}\n");
    }catch(e){
      throw Exception('Failed to create payment method: $e');
    }
  }

}
