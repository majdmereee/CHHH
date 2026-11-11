import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const NizamApp());
}

class NizamApp extends StatelessWidget {
  const NizamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'نظام',
      home: NizamMainScreen(),
    );
  }
}

class NizamMainScreen extends StatefulWidget {
  const NizamMainScreen({super.key});

  @override
  State<NizamMainScreen> createState() => _NizamMainScreenState();
}

class _NizamMainScreenState extends State<NizamMainScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.black)
      ..loadFlutterAsset('assets/index.html');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: WebViewWidget(controller: _controller),
      ),
    );
  }
}
