import 'package:benta/core/Errors/failure.dart';
import 'package:dio/dio.dart';
import 'package:benta/core/utils/widgets/api_key.dart';

class BillingData {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String address;
  final String city;
  final String country;

  BillingData({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.city,
    this.country = 'EG',
  });

  Map<String, dynamic> toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "phone_number": phoneNumber,
      "street": address,
      "city": city,
      "country": country,
      "apartment": "NA", // مضافة هنا
      "floor": "NA",
      "building": "NA",
      "shipping_method": "NA",
      "postal_code": "NA",
      "state": "NA",
    };
  }
}

class PaymobManager {
  final Dio _dio = Dio();

  Future<String> getPaymentKey({
    required double amount,
    required String currency,
    BillingData? billingData,
  }) async {
    try {
      String authToken = await _getAuthToken();
      int orderId = await _getOrderId(
        authenticationToken: authToken,
        currency: currency,
        amount: (100 * amount).toString(),
      );
      String paymentKey = await _getPaymentKeyToken(
        authenticationToken: authToken,
        orderId: orderId.toString(),
        amount: (100 * amount).toString(),
        currency: currency,
        billingData: billingData,
      );
      return paymentKey;
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e);
    } catch (e) {
      print('Unexpected error: $e');
      throw Exception('حدث خطأ غير متوقع أثناء تنفيذ العملية.');
    }
  }

  Future<String> _getAuthToken() async {
    try {
      final response = await _dio.post(
        'https://accept.paymobsolutions.com/api/auth/tokens',
        data: {"api_key": ApiKey.apiKey},
      );
      return response.data['token'];
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }

  Future<int> _getOrderId({
    required String authenticationToken,
    required String currency,
    required String amount,
  }) async {
    try {
      final response = await _dio.post(
        'https://accept.paymobsolutions.com/api/ecommerce/orders',
        data: {
          'auth_token': authenticationToken,
          'amount_cents': amount,
          'currency': currency,
          "delivery_needed": "false",
          'items': [],
        },
      );
      return response.data['id'];
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }

  Future<String> _getPaymentKeyToken({
    required String authenticationToken,
    required String orderId,
    required String amount,
    required String currency,
    BillingData? billingData,
  }) async {
    try {
      final billingJson =
          billingData?.toJson() ??
          {
            "first_name": "Clifford",
            "last_name": "Nicolas",
            "email": "claudette09@exa.com",
            "phone_number": "+86(8)9135210487",
            "apartment": "NA",
            "floor": "NA",
            "street": "NA",
            "building": "NA",
            "shipping_method": "NA",
            "postal_code": "NA",
            "city": "NA",
            "country": "NA",
            "state": "NA",
          };

      final response = await _dio.post(
        'https://accept.paymob.com/api/acceptance/payment_keys',
        data: {
          "auth_token": authenticationToken,
          "amount_cents": amount,
          "expiration": 3600,
          "order_id": orderId,
          "currency": currency,
          "integration_id": ApiKey.cardPaymentMethodIntegrationID,
          "billing_data": billingJson,
        },
      );
      return response.data['token'];
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }
}
