import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebBByWere extends StatefulWidget {
  final String url;
  final String title;

  const WebBByWere({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  State<WebBByWere> createState() => _WebPlinkState();
}

class _WebPlinkState extends State<WebBByWere> {
  bool isLoading = true;
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 20.h,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: const BackButton(color: Colors.black),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Expanded(
                  child: WebViewWidget(
                    controller: controller,
                  ),
                ),
              ],
            ),
          ),
          isLoading
              ? const Positioned.fill(
                  child: CupertinoActivityIndicator(color: Colors.black),
                )
              : Container(),
        ],
      ),
    );
  }

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {},
        ),
      );
    super.initState();
  }
}
