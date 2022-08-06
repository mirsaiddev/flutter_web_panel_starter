import 'package:flutter/material.dart';
import 'package:flutter_web_panel_starter/providers/page_builder_provider.dart';
import 'package:provider/provider.dart';

import 'components/drawer_widget.dart';

class PageBuilder extends StatefulWidget {
  const PageBuilder({Key? key}) : super(key: key);

  @override
  State<PageBuilder> createState() => _PageBuilderState();
}

class _PageBuilderState extends State<PageBuilder> {
  @override
  Widget build(BuildContext context) {
    PageBuilderProvider pageBuilderProvider = Provider.of<PageBuilderProvider>(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Row(
          children: [
            const DrawerWidget(),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(30).subtract(EdgeInsets.only(bottom: 30)),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: pageBuilderProvider.getCurrentPage,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
