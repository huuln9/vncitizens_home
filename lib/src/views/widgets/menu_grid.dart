import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncitizens_home/src/controllers/configuration_controller.dart';
import 'package:vncitizens_home/src/views/widgets/my_banner.dart';

class MenuGrid extends GetView<ConfigurationController> {
  const MenuGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = controller.getConfiguration();
    List<dynamic> homeMenu =
        config['homeMenu'] != null ? List.from(config['menuGrid']) : [];

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: MyBanner(),
      ),
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: GridView.count(
          padding: const EdgeInsets.all(10),
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            for (var i = 0; i < homeMenu.length; i++)
              if (homeMenu[i]['enable'])
                IconButton(
                  icon: Column(
                    children: [
                      SizedBox(
                        child: Image.network(homeMenu[i]['icon']),
                        width: 60,
                        height: 60,
                      ),
                      const Padding(padding: EdgeInsets.only(top: 15)),
                      Text(homeMenu[i]['name'],
                          style: const TextStyle(fontSize: 13)),
                    ],
                  ),
                  onPressed: () => Navigator.of(context).pushNamed(
                    homeMenu[i]['route'],
                    arguments: [
                      homeMenu[i]['name'] + "'s List",
                      homeMenu[i]['tagId'],
                    ],
                  ),
                )
          ],
        ),
      ),
      // bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
