import 'package:flutter/material.dart';
import 'package:taskapp/src/common/app_config.dart';
import 'package:taskapp/src/utils/custom_color.dart';

class DashboardScreenOne extends StatelessWidget {
  const DashboardScreenOne({super.key});
  final bool tBlackColor = true;
  @override
  Widget build(BuildContext context) {
    var txtTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.menu,
          //For Dark Color
          color: tBlackColor ? CustomColor.whiteColor : CustomColor.blackColor,
        ),
        title: Text(AppConfig.appName,
            style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          Container(
            decoration:
                const BoxDecoration(border: Border(left: BorderSide(width: 4))),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppConfig.searchDashboard,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        )),
                const Icon(Icons.mic, size: 25),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_shopping_cart_outlined),
        onPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              "Heading",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              "Sub-heading",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              "Paragraph",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Elevated Button"),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text("Outlined Button"),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Image(image: AssetImage("assets/images/books.png")),
            ),
          ],
        ),
      ),
    );
  }
}
