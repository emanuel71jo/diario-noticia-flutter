import 'package:diario_noticias/noticia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class WebViewNoticia extends StatelessWidget {

  final Noticia _noticia;

  WebViewNoticia(this._noticia);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: _noticia.url,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(.7),
        title: Text(_noticia.title),
      ),
      initialChild: Container(
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}