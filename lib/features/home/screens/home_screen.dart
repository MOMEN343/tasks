import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/core/managers/manager_font_family.dart';
import 'package:tasks/core/managers/manager_strings.dart';
import 'package:tasks/features/authentication/screens/login_screen.dart';
import 'package:tasks/features/home/managers/manager_font_size.dart';
import 'package:tasks/features/home/managers/manages_text_styles.dart';
import 'package:tasks/features/home/screens/add_event.dart';
import 'package:tasks/features/home/widgets/current_events.dart';
import 'package:tasks/features/home/widgets/event_card.dart';
import 'package:tasks/features/home/widgets/icon_container.dart';
import 'package:tasks/features/home/widgets/previous_events.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => AddEvent()));
        },
        backgroundColor: ManagerColors.secondary,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),

        child: Icon(Icons.add, color: Colors.white, size: 35),
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Stack(
            children: [
              Column(
                children: [
                  //top (user info and search bar)
                  Container(
                    color: ManagerColors.primary,
                    height: 169,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 20,
                      ),
                      child: Column(
                        spacing: 15,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //user image and name
                              Expanded(
                                child: Row(
                                  spacing: 10,
                                  children: [
                                    Container(
                                      width: 54,
                                      height: 54,

                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 2,
                                        ),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.asset(
                                          "assets/images/user_image.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            softWrap: true,
                                            maxLines: 2,
                                            ManagerStrings.welcomeBack,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily:
                                                  ManagerFontFamily.almarai,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            ManagerStrings.userName,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily:
                                                  ManagerFontFamily.almarai,
                                              fontWeight: FontWeight.w700,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            softWrap: true,
                                            maxLines: 2,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              //Icon Buttons
                              Row(
                                spacing: 5,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconContainer(
                                    icon: Icons.notifications_none_sharp,
                                  ),

                                  IconContainer(
                                    icon: Icons.account_balance_wallet_outlined,
                                  ),

                                  IconContainer(icon: Icons.settings_outlined),
                                ],
                              ),
                            ],
                          ),

                          SearchBar(
                            hintText: ManagerStrings.searchHere,
                            hintStyle: WidgetStatePropertyAll(
                              TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                            textStyle: WidgetStatePropertyAll(
                              TextStyle(color: Colors.white),
                            ),
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.white.withValues(alpha: 0.3),
                            ),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(10),
                              ),
                            ),
                            constraints: BoxConstraints(minHeight: 40),
                            leading: SvgPicture.asset(
                              "assets/images/search_icon.svg",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: [CurrentEvents(), PreviousEvents()],
                    ),
                  ),
                ],
              ),

              Positioned(
                top: 144,
                left: 20,
                right: 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: 8,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TabBar(
                    controller: tabController,

                    indicator: BoxDecoration(
                      color: ManagerColors.secondary,
                      borderRadius: BorderRadius.circular(10),
                    ),

                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding: EdgeInsetsGeometry.all(2),
                    dividerColor: Colors.transparent,

                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,

                    labelStyle: TextStyle(fontWeight: FontWeight.w700),

                    unselectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),

                    tabs: [
                      Tab(text: ManagerStrings.currentEvents),
                      Tab(text: ManagerStrings.previousEvents),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
