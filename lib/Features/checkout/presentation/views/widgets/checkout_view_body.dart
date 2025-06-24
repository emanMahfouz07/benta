import 'package:benta/Features/Auth/presentation/views/widgets/custom_text_field.dart';
import 'package:benta/Features/checkout/presentation/views/widgets/payment_bottom_sheet.dart';
import 'package:benta/core/utils/paymob_manager.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:benta/core/utils/widgets/custom_all_use_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutViewBody extends StatefulWidget {
  final double totalPrice;
  const CheckoutViewBody({super.key, required this.totalPrice});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  bool isLoading = false; // Loading state

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40.h),
            // Display the total amount being charged
            Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Amount:', style: Styles.style16),
                  Text(
                    '${widget.totalPrice.toStringAsFixed(2)} EGP',
                    style: Styles.style16.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: 'First Name',
                    controller: firstNameController,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: CustomTextField(
                    hintText: 'Last Name',
                    controller: lastNameController,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 14.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.grey.shade200,
                  ),
                  child: Row(
                    children: [
                      Text('🇪🇬 +20', style: Styles.style16),
                      SizedBox(width: 8.w),
                      Icon(Icons.arrow_drop_down, color: Colors.black54),
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: CustomTextField(
                    hintText: 'Phone',
                    controller: phoneController,
                    textInputType: TextInputType.phone,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: 'Email',
              controller: emailController,
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            CustomTextField(hintText: 'City', controller: cityController),
            const SizedBox(height: 16),
            CustomTextField(hintText: 'Address', controller: addressController),
            const SizedBox(height: 32),

            // Show loading indicator or button
            isLoading
                ? Container(
                  height: 50.h,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                        SizedBox(width: 12),
                        Text('Processing...', style: Styles.style16),
                      ],
                    ),
                  ),
                )
                : CustomAllUseButton(
                  title: 'Continue to Payment',
                  onPressed: () {
                    // Validate form fields
                    if (firstNameController.text.isEmpty ||
                        lastNameController.text.isEmpty ||
                        phoneController.text.isEmpty ||
                        emailController.text.isEmpty ||
                        cityController.text.isEmpty ||
                        addressController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please fill all required fields'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    // Create BillingData object from form fields
                    final billingData = BillingData(
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      email: emailController.text,
                      phoneNumber: '+20${phoneController.text}',
                      address: addressController.text,
                      city: cityController.text,
                    );

                    _pay(context, widget.totalPrice, billingData);
                  },
                ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Future<void> _pay(
    BuildContext context,
    double amount,
    BillingData billingData,
  ) async {
    setState(() {
      isLoading = true;
    });

    try {
      String paymentKey = await PaymobManager().getPaymentKey(
        amount: amount,
        currency: 'EGP',
        billingData: billingData,
      );

      setState(() {
        isLoading = false;
      });

      showPaymentSheet(context, paymentKey);
    } catch (error) {
      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Payment failed: ${error.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    cityController.dispose();
    super.dispose();
  }
}
