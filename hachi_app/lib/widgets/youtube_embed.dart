import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class YouTubeEmbed extends StatefulWidget {
  final String url;

  const YouTubeEmbed({super.key, required this.url});

  @override
  State<YouTubeEmbed> createState() => _YouTubeEmbedState();
}

class _YouTubeEmbedState extends State<YouTubeEmbed> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  void _initializeController() {
    debugPrint('YouTubeEmbed: Initializing for URL: ${widget.url}');

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      // Use Desktop User Agent to bypass mobile app restrictions
      ..setUserAgent(
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36',
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            debugPrint('YouTubeEmbed: Page finished loading: $url');
            if (mounted) {
              setState(() {
                _isLoading = false;
              });
            }
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint(
              'YouTubeEmbed Error: ${error.description}, Code: ${error.errorCode}',
            );
          },
          onNavigationRequest: (NavigationRequest request) async {
            // Intercept ALL navigation that is not related to the embed itself.
            // The embed URL contains '/embed/'.
            // The initial load might be 'about:blank' or the data URL.

            // If the URL does NOT contain '/embed/' and is a valid http/https URL,
            // we assume it's an external link (like clicking the logo, title, or 'watch on youtube').
            if (!request.url.contains('/embed/') &&
                (request.url.startsWith('http://') ||
                    request.url.startsWith('https://'))) {
              debugPrint(
                'YouTubeEmbed: Intercepting external navigation to: ${request.url}',
              );
              final Uri uri = Uri.parse(request.url);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
                return NavigationDecision.prevent;
              }
            }

            return NavigationDecision.navigate;
          },
        ),
      );

    // Extract Video ID
    final RegExp regExp = RegExp(
      r'(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/\s]{11})',
      caseSensitive: false,
      multiLine: false,
    );
    final Match? match = regExp.firstMatch(widget.url);
    final String? videoId = match?.group(1);

    if (videoId != null) {
      debugPrint('YouTubeEmbed: Extracted Video ID: $videoId');
      // Load Embed HTML
      final String embedUrl =
          'https://www.youtube.com/embed/$videoId?rel=0&enablejsapi=1';
      final html =
          '''
        <!DOCTYPE html>
        <html>
        <head>
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <style>
            body { margin: 0; padding: 0; background-color: black; display: flex; justify-content: center; align-items: center; height: 100vh; }
            iframe { width: 100%; height: 100%; border: none; }
          </style>
        </head>
        <body>
          <iframe 
            src="$embedUrl" 
            frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
            allowfullscreen
          ></iframe>
        </body>
        </html>
      ''';
      // Set baseUrl to hachi.com.vn to satisfy potential domain restrictions
      _controller.loadHtmlString(html, baseUrl: 'https://hachi.com.vn/');
    } else {
      debugPrint(
        'YouTubeEmbed: Could not extract ID, falling back to original URL',
      );
      // Fallback: Load original URL
      String finalUrl = widget.url;
      if (finalUrl.startsWith('//')) {
        finalUrl = 'https:$finalUrl';
      }
      _controller.loadRequest(Uri.parse(finalUrl));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.url.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      height: 220, // Standard height for video embeds
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            const Center(child: CircularProgressIndicator(color: Colors.white)),
        ],
      ),
    );
  }
}
