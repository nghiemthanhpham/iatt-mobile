// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:iatt/app/module/album/controllers/album_controller.dart';

class AlbumView extends GetView<AlbumController> {
  const AlbumView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          automaticallyImplyLeading: true,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            "Chỉnh sửa hình ảnh",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Obx(() => controller.progress.value < 100
              ? LinearProgressIndicator(
                  value: controller.progress.value / 100,
                  backgroundColor: Colors.grey[200],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                )
              : const SizedBox.shrink()
            ),
            Expanded(
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: WebUri('https://www.inanhtructuyen.com/app-album'),
                ),
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                    useShouldOverrideUrlLoading: true,
                    mediaPlaybackRequiresUserGesture: false,
                    javaScriptEnabled: true,
                    useOnLoadResource: true,
                    useOnDownloadStart: true,
                  ),
                  android: AndroidInAppWebViewOptions(
                    useHybridComposition: true,
                    domStorageEnabled: true,
                    databaseEnabled: true,
                  ),
                  ios: IOSInAppWebViewOptions(
                    allowsInlineMediaPlayback: true,
                  ),
                ),
                onWebViewCreated: (InAppWebViewController webViewController) {
                  controller.webViewController = webViewController;
                },
                onLoadStart: (InAppWebViewController controller, Uri? url) {
                  if (kDebugMode) {
                    print("DEBUG: Bắt đầu tải trang: ${url?.toString()}");
                  }
                },
                onLoadStop: (InAppWebViewController controller, Uri? url) {
                  if (kDebugMode) {
                    print("DEBUG: Đã tải xong trang: ${url?.toString()}");
                  }
                  controller.evaluateJavascript(source: """
                    console.log('Document ready state: ' + document.readyState);
                    console.log('Body content: ' + document.body.innerHTML.substring(0, 100));
                  """);
                },
                onLoadError: (InAppWebViewController controller, Uri? url, int code, String message) {
                  if (kDebugMode) {
                    print("DEBUG: Lỗi tải trang: $code - $message");
                  }
                },
                onProgressChanged: (InAppWebViewController controller, int progress) {
                  if (kDebugMode) {
                    print("DEBUG: Tiến trình tải: $progress%");
                  }
                  this.controller.progress.value = progress;
                },
                onReceivedHttpError: (controller, request, errorResponse) {
                  if (kDebugMode) {
                    print("DEBUG: HTTP Error: ${errorResponse.statusCode} - ${request.url}");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}