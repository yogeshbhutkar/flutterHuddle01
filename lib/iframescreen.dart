// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class IframeScreen extends StatefulWidget {
  const IframeScreen({super.key});

  @override
  State<IframeScreen> createState() => _IframeScreenState();
}

class _IframeScreenState extends State<IframeScreen> {
  final IFrameElement _iFrameElement = IFrameElement();

  @override
  void initState() {
    _iFrameElement.style.height = '100%';
    _iFrameElement.style.width = '100%';
    _iFrameElement.src = 'https://iframe.huddle01.com/ttf-ydzq-bjy/audio';
    _iFrameElement.style.border = 'none';

// ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iFrameElement,
    );

    super.initState();
  }

  final Widget _iframeWidget = HtmlElementView(
    viewType: 'iframeElement',
    key: UniqueKey(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: _iframeWidget,
          )
        ],
      ),
    );
  }
}
