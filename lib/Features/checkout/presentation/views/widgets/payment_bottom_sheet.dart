import 'package:benta/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

void showPaymentSheet(BuildContext context, String paymentToken) {
  final paymentUrl =
      'https://accept.paymob.com/api/acceptance/iframes/915620?payment_token=$paymentToken';
  final controller =
      WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onPageFinished: (url) async {
              print('✅ Finished loading: $url');

              if (url.contains('success=true')) {
                // Wait 2 seconds before navigating
                await Future.delayed(const Duration(seconds: 2));

                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }

                // Then navigate to thank you screen
                context.pushReplacement(AppRouter.kCongratsView);
              }
            },
          ),
        )
        ..loadRequest(Uri.parse(paymentUrl));

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    enableDrag: false, // This is key - disable bottom sheet dragging
    isDismissible: true, // Allow tapping outside to dismiss
    builder: (BuildContext bottomSheetContext) {
      return Padding(
        padding: EdgeInsets.only(top: 24),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.85,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // Header with close button
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade200),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Complete Payment',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.close),
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
              ),
              // WebView content
              Expanded(child: WebViewWidget(controller: controller)),
            ],
          ),
        ),
      );
    },
  );
}
