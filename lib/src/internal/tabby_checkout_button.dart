import 'package:flutter/material.dart';
import 'package:tabby_flutter_inapp_sdk/tabby_flutter_inapp_sdk.dart';
import 'package:url_launcher/url_launcher.dart';

import 'fixtures.dart';

class TabbyPresentationSnippet extends StatefulWidget {
  const TabbyPresentationSnippet({
    required this.price,
    required this.currency,
    required this.lang,
    this.borderColor = const Color(0xFFD6DED6),
    this.backgroundColor = const Color(0xFFFFFFFF),
    this.textColor = const Color(0xFF292929),
    Key? key,
  }) : super(key: key);
  final String price;
  final Currency currency;
  final Lang lang;
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;

  @override
  State<TabbyPresentationSnippet> createState() =>
      _TabbyPresentationSnippetState();
}

class _TabbyPresentationSnippetState extends State<TabbyPresentationSnippet> {
  @override
  Widget build(BuildContext context) {
    final localStrings = getLocalStrings(
      price: widget.price,
      currency: widget.currency,
      lang: widget.lang,
    );

    return GestureDetector(
      onTap: () async => launchUrl(
        Uri.parse(
          '${snippetWebUrls[widget.lang]}'
          '?price=${widget.price}&currency=${widget.currency.name}&source=sdk',
        ),
        mode: LaunchMode.inAppWebView,
      ),
      child: Container(
        constraints: const BoxConstraints(minWidth: 300, maxWidth: 720),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          border: Border.all(
            color: widget.borderColor,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        child: Row(
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: localStrings[0],
                  style: TextStyle(
                    color: widget.textColor,
                    fontFamily: widget.lang == Lang.ar ? 'Arial' : 'Inter',
                    fontSize: 15,
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(
                      text: localStrings[1],
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: localStrings[2],
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: localStrings[3]),
                    TextSpan(
                      text: localStrings[4],
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.only(start: 16),
              child: Image(
                image: AssetImage('assets/images/tabby-badge.png',
                    package: 'tabby_flutter_inapp_sdk'),
                width: 70,
                height: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
