import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app2/view/RegisterIntro.dart';

import '../component/Colors.dart';
import '../component/myStrings.dart';
import '../gen/assets.gen.dart';
import 'HomeScreen.dart';
import 'ProfileScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

class _MainScreenState extends State<MainScreen> {
  int selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          width: size.width - 30,
          backgroundColor: SolidColors.scaffoldBg,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 70),
                child: Assets.img.logo.image(height: 90),
              ),
              SizedBox(
                height: size.height / 1.5,
                child: ListView.builder(
                    itemCount: MyStrings.drawerStrings.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Divider(
                              thickness: .5,
                              color: SolidColors.divider,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: InkWell(
                                overlayColor: MaterialStateProperty.all(
                                    SolidColors.primeryColor2),
                                onTap: () {},
                                child: Text(
                                  MyStrings.drawerStrings[index],
                                  style: textTheme.bodyLarge!.copyWith(
                                      color: Colors.black, fontSize: 13),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          actions: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
              child: InkResponse(
                  onTap: () {
                    _key.currentState!.openDrawer();
                  },
                  child: Icon(CupertinoIcons.line_horizontal_3)),
            ),
            Expanded(child: Assets.img.logo.image(height: 36)),
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Icon(CupertinoIcons.search),
            )
          ],
        ),
        body: Stack(
          children: [
            Positioned.fill(

                //appBar

                child: IndexedStack(
              index: selectedPageIndex,
              children: [
                HomeScreen(size: size, textTheme: textTheme),
                RegisterIntro(),
                ProfileScreen(size: size, textTheme: textTheme),
              ],
            )),

            //bottom gradient container
            Positioned(
              bottom: 0,
              child: Container(
                width: size.width,
                height: size.height / 9,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: GradientColors.downside,
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
              ),
            ),
            //bottum Navigation Bar
            BottomNavigationBar(
              size: size,
              onPressed: (int index) {
                setState(() {
                  selectedPageIndex = index;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({
    super.key,
    required this.size,
    required this.onPressed,
  });

  final Size size;

  final void Function(int index) onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 40,
      right: 40,
      child: Center(
        child: Stack(
          children: [
            Container(
              width: size.width / 1.3,
              height: size.height / 12.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: const LinearGradient(
                    colors: GradientColors.bottomNavigation,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 35,
              right: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      onPressed(0);
                    },
                    icon: Assets.img.icons.home.image(scale: 2.3),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return RegisterIntro();
                      }));
                    },
                    icon: Assets.img.icons.edit.image(scale: 2.3),
                  ),
                  IconButton(
                    onPressed: () {
                      onPressed(2);
                    },
                    icon: Assets.img.icons.user.image(scale: 2.3),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
