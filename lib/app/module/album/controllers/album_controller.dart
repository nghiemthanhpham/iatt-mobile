import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class AlbumController extends GetxController {
  InAppWebViewController? webViewController;
  RxInt progress = 0.obs;

  void loadUrl(String url) {
    if (webViewController != null) {
      webViewController!.loadUrl(urlRequest: URLRequest(url: WebUri(url)));
    }
  }

  void reload() {
    webViewController?.reload();
  }
}
