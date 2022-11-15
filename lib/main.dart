import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WebView',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'WebView'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url = "https://client.ck-app.site";
  String newUrl = '';

  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text(widget.title),
        //   actions: <Widget>[
        //     Padding(
        //         padding: const EdgeInsets.only(right: 20.0),
        //         child: GestureDetector(
        //           onTap: () {
        //             showDialog(
        //               context: context,
        //               builder: (BuildContext context) {
        //                 return AlertDialog(
        //                   content: TextField(
        //                     maxLength: 200,
        //                     keyboardType: TextInputType.url,
        //                     onChanged: (value) {
        //                       newUrl = value;
        //                     },
        //                   ),
        //                   actions: [
        //                     TextButton(
        //                       style: TextButton.styleFrom(
        //                           foregroundColor:
        //                               Theme.of(context).primaryColor),
        //                       child: const Text("GİT"),
        //                       onPressed: () {
        //                         url = newUrl;

        //                         try {
        //                           setState(() {
        //                             controller.loadUrl(url);
        //                           });
        //                         } catch (e) {
        //                           // return errorAlert(context);
        //                         }

        //                         Navigator.of(context).pop();
        //                       },
        //                     ),
        //                   ],
        //                 );
        //               },
        //             );
        //             // showModalBottomSheet(
        //             //     isScrollControlled: true,
        //             //     context: context,
        //             //     builder: (context) {
        //             //       return modalBottomSheetContent(context, vm);
        //             //     });
        //           },
        //           child: const Icon(Icons.more_vert),
        //         )),
        //   ],
        // ),
        body: WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              controller = webViewController;
            }),
      ),
    );
  }
}
