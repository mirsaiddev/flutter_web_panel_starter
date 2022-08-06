import 'package:flutter/material.dart';
import 'package:flutter_web_panel_starter/theme/colors.dart';
import 'package:provider/provider.dart';

import '../../../providers/page_builder_provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    PageBuilderProvider pageBuilderProvider = Provider.of<PageBuilderProvider>(context);

    return SizedBox(
      width: 250,
      child: Drawer(
        elevation: 0,
        child: Container(
          height: size.height,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
                child: Center(
                    child: CircleAvatar(
                  radius: 40,
                  backgroundColor: MyColors.primary,
                )),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.0, bottom: 12),
                child: Text(
                  'Sayfalar',
                  style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 18),
                ),
              ),
              DrawerElement(pageName: 'home', title: 'Ana Sayfa', icon: Icons.home_outlined),
              DrawerElement(pageName: 'settings', title: 'Ayarlar', icon: Icons.settings),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerElement extends StatelessWidget {
  const DrawerElement({
    Key? key,
    required this.title,
    required this.pageName,
    required this.icon,
  }) : super(key: key);

  final String pageName, title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    PageBuilderProvider pageBuilderProvider = Provider.of<PageBuilderProvider>(context);

    bool selected = pageBuilderProvider.currentPage == pageName;
    bool hovered = pageBuilderProvider.hoveredPages.contains(pageName);

    return InkWell(
      onTap: () {
        pageBuilderProvider.setCurrentPage(pageName);
      },
      onHover: (value) {
        if (value) {
          pageBuilderProvider.addHoveredPage(pageName);
        } else {
          pageBuilderProvider.removeHoveredPage(pageName);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(left: 10, bottom: 4),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            color: selected
                ? MyColors.selectedTileColor
                : hovered
                    ? MyColors.primary.withOpacity(0.05)
                    : Colors.transparent),
        height: 50,
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            Icon(
              icon,
              color: selected ? MyColors.primary : Colors.black54,
              size: 20,
            ),
            const SizedBox(width: 6),
            Text(
              title,
              style: TextStyle(
                color: selected ? MyColors.primary : Colors.black54,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            if (selected)
              Container(
                width: 4,
                color: MyColors.primary,
              )
            else if (hovered)
              Container(
                width: 4,
                color: MyColors.primary.withOpacity(0.3),
              )
          ],
        ),
      ),
    );
  }
}
