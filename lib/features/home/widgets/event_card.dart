import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/core/managers/manager_font_family.dart';
import 'package:tasks/core/managers/manager_strings.dart';
import 'package:tasks/features/home/managers/manager_font_size.dart';
import 'package:tasks/features/home/managers/manages_text_styles.dart';

class EventCard extends StatelessWidget {
  final String image;
  final String name;
  final String eventDate;
  final bool eventEnded;

  const EventCard({
    super.key,
    required this.image,
    required this.name,
    required this.eventDate,
    this.eventEnded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,

      child: Column(
        spacing: 10,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(15),
                child: Image.asset("assets/images/$image"),
              ),
              Positioned(
                top: 12,
                right: 10,
                child: IntrinsicWidth(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DefaultTextStyle(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ManagerFontSize.smaller,
                        fontWeight: FontWeight.w400,
                        fontFamily: ManagerFontFamily.almarai,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.event_outlined,
                            color: Colors.white,
                            size: 16,
                          ),
                          Text(ManagerStrings.eventDate),
                          Text("$eventDate"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              if (eventEnded)
                Positioned(
                  top: 12,
                  left: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 11, vertical: 3),

                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      ManagerStrings.endedEvent,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ManagerFontSize.smaller,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Column(
              spacing: 10,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ManagerStrings.weddingParty(name),
                      style: ManagerTextStyles.cardTitle,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 18,
                          color: ManagerColors.primary,
                        ),

                        Text(
                          ManagerStrings.eventLocation,
                          style: ManagerTextStyles.subCardTitle,
                        ),
                      ],
                    ),
                  ],
                ),

                IconTheme(
                  data: IconThemeData(color: ManagerColors.primary),
                  child: DefaultTextStyle(
                    style: TextStyle(color: ManagerColors.primary),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              spacing: 4,
                              children: [
                                Icon(Icons.people_alt_outlined, size: 24),
                                Text(
                                  ManagerStrings.attendanceCount,
                                  style: TextStyle(
                                    fontSize: ManagerFontSize.larg,
                                  ),
                                ),
                                Text(ManagerStrings.attendance),
                              ],
                            ),
                          ),

                          Expanded(
                            child: Column(
                              spacing: 4,
                              children: [
                                Icon(
                                  Icons.account_balance_wallet_outlined,
                                  size: 24,
                                ),
                                Text(
                                  ManagerStrings.budget,
                                  style: TextStyle(
                                    fontSize: ManagerFontSize.larg,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                  child: SvgPicture.asset(
                                    "assets/images/ryal.svg",
                                    height: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            child: Column(
                              spacing: 4,
                              children: [
                                Icon(Icons.calendar_today_rounded, size: 24),
                                Text(
                                  ManagerStrings.invitedCount,
                                  style: TextStyle(
                                    fontSize: ManagerFontSize.larg,
                                  ),
                                ),
                                Text(ManagerStrings.invited),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                MaterialButton(
                  onPressed: () {},
                  color: ManagerColors.primary,
                  textColor: Colors.white,

                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                  child: Text(
                    ManagerStrings.showDetails,
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
