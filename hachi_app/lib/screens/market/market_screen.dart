import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/constants.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            if (mounted) {
              setState(() {
                _isLoading = false;
              });
            }
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) async {
            final url = Uri.parse(request.url);

            // Define schemes that should ALWAYS be launched externally
            final externalSchemes = {
              'tel',
              'mailto',
              'sms',
              'zalo',
              'fb-messenger',
            };

            // Define hosts that should be launched externally (deep link wrappers)
            final externalHosts = {'zalo.me', 'm.me', 'www.messenger.com'};

            bool shouldLaunchExternally =
                externalSchemes.contains(url.scheme) ||
                externalHosts.contains(url.host);

            // Special check for Facebook links that might be messages
            if (url.host.contains('facebook.com') &&
                url.path.contains('messages')) {
              shouldLaunchExternally = true;
            }

            if (shouldLaunchExternally) {
              try {
                // Try to launch with external application mode
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  // Fallback for some intents
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                }
                return NavigationDecision
                    .prevent; // Prevent WebView from loading this
              } catch (e) {
                debugPrint('Could not launch $url: $e');
                return NavigationDecision.prevent;
              }
            }

            // For standard http/https that are NOT in our external list, allow WebView
            if (url.scheme == 'http' || url.scheme == 'https') {
              return NavigationDecision.navigate;
            }

            // Catch-all for other schemes (intent://, etc.)
            try {
              await launchUrl(url, mode: LaunchMode.externalApplication);
              return NavigationDecision.prevent;
            } catch (e) {
              debugPrint('Could not launch catch-all $url: $e');
              return NavigationDecision.prevent;
            }
          },
        ),
      )
      ..loadRequest(
        Uri.parse('https://hachi.com.vn/san-pham-den-led-trong-cay/'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(controller: _controller),
            if (_isLoading)
              const Center(
                child: CircularProgressIndicator(color: AppColors.primaryGreen),
              ),
          ],
        ),
      ),
    );
  }
}
