import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/features/authentication/widgets/login_button.dart';
import 'package:tasks/features/home/managers/manager_font_size.dart';
import 'package:tasks/features/home/managers/manages_text_styles.dart';
import 'package:tasks/features/home/widgets/count_container.dart';
import 'package:tasks/features/home/widgets/text_form_feild.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<StatefulWidget> createState() => _AddEvent();
}

class _AddEvent extends State<AddEvent> with SingleTickerProviderStateMixin {
  TabController? tabController;
  int count = 0;
  // Color tabBar2Color = Colors.white.withValues(alpha: 0.4);
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          backgroundColor: ManagerColors.primary,
          leading: Align(
            alignment: Alignment.center,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(5),
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back, color: Colors.white, size: 22),
              ),
            ),
          ),

          title: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "مناسبة جديدة",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ManagerFontSize.larg,
                ),
              ),
              Text(
                "أضف تفاصيل مناسبتك الخاصة",
                style: ManagerTextStyles.subCardTitle.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(24),
            child: TabBar(
              controller: tabController,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              padding: EdgeInsets.only(bottom: 10),
              labelPadding: EdgeInsets.symmetric(horizontal: 10),

              tabs: [
                Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                AnimatedBuilder(
                  animation: tabController!,
                  builder: (context, child) {
                    final value = tabController!.animation?.value ?? 0;

                    return Container(
                      height: 4,
                      decoration: BoxDecoration(
                        color: Color.lerp(
                          Colors.white.withValues(alpha: 0.4),
                          Colors.white,
                          value,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),

        body: TabBarView(
          controller: tabController,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        spacing: 10,
                        children: [
                          Card(
                            color: Colors.white,
                            elevation: 1,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                spacing: 10,
                                children: [
                                  Row(
                                    spacing: 10,
                                    children: [
                                      Container(
                                        width: 42,
                                        height: 42,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          color: ManagerColors.secondary,
                                        ),
                                        child: Icon(
                                          Icons.image_rounded,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "صورة المناسبة",
                                            style: ManagerTextStyles.title,
                                          ),
                                          Text(
                                            "أرفق صورة توضح طبيعة النشاط بشكل أفضل",
                                            style:
                                                ManagerTextStyles.subCardTitle,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  DottedBorder(
                                    options: RoundedRectDottedBorderOptions(
                                      color: ManagerColors.grey,
                                      strokeWidth: 1.5,
                                      dashPattern: [8, 5],
                                      radius: Radius.circular(12),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      height: 119,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 42,
                                            height: 42,
                                            decoration: BoxDecoration(
                                              color: ManagerColors.secondary
                                                  .withValues(alpha: 0.1),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Icon(
                                              Icons.file_upload_outlined,
                                              color: ManagerColors.secondary,
                                            ),
                                          ),
                                          Text(
                                            "اضغط لرفع صورة",
                                            style: ManagerTextStyles
                                                .subCardTitle
                                                .copyWith(
                                                  fontSize:
                                                      ManagerFontSize.small,
                                                ),
                                          ),
                                          Text(
                                            "PNG, JPEG حتى 10MB",
                                            style:
                                                ManagerTextStyles.subCardTitle,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Card(
                            color: Colors.white,
                            elevation: 1,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                spacing: 10,
                                children: [
                                  Container(
                                    width: 42,
                                    height: 42,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: ManagerColors.secondary,
                                    ),
                                    child: Icon(
                                      Icons.file_copy,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "طباعة المدعويين",
                                              style: ManagerTextStyles.title,
                                            ),

                                            Container(
                                              width: 63,
                                              height: 18,
                                              padding: EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                color: ManagerColors.secondary,
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              child: Row(
                                                spacing: 4,
                                                children: [
                                                  Container(
                                                    width: 14,
                                                    height: 14,

                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            50,
                                                          ),
                                                      color: Colors.white,
                                                    ),

                                                    child: Icon(
                                                      Icons.check,
                                                      size: 10,
                                                      color: ManagerColors
                                                          .secondary,
                                                    ),
                                                  ),

                                                  Text(
                                                    "تفعيل الميزة",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 7,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "فعّل اشتراك طباعة المدعوين، واحصل بعد الفرح على نسخة.",
                                              style: ManagerTextStyles
                                                  .subCardTitle,
                                            ),

                                            RichText(
                                              text: TextSpan(
                                                style: ManagerTextStyles
                                                    .subCardTitle,
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        "مطبوعة من قائمة المدعويين مع جميع تفاصيلهم مقابل",
                                                  ),
                                                  TextSpan(
                                                    text: "200 ريال",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color:
                                                          ManagerColors.primary,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Card(
                            color: Colors.white,
                            elevation: 1,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                spacing: 10,
                                children: [
                                  Row(
                                    spacing: 10,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "عدد المدعوين",
                                            style: ManagerTextStyles.title,
                                          ),
                                          Text(
                                            "يمكنك تعديل عدد المدعوين لاحقًا من لوحة المناسبة",
                                            style:
                                                ManagerTextStyles.subCardTitle,
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 53,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            color: ManagerColors.secondary
                                                .withValues(alpha: 0.1),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "$count",
                                              style: TextStyle(
                                                color: ManagerColors.secondary,
                                                fontSize: 32,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    spacing: 10,
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              if (count > 0) count--;
                                            });
                                          },
                                          child: Container(
                                            height: 43,
                                            decoration: BoxDecoration(
                                              color: ManagerColors.primary,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: SizedBox(
                                          height: 43,
                                          child: TextField(
                                            onChanged: (value) {
                                              setState(() {
                                                if (int.parse(value) <= 300) {
                                                  count = int.parse(value);
                                                }
                                              });
                                            },
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                              hintText: "$count",
                                              hintStyle: TextStyle(
                                                color: Color(0xFFD3D3D3),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: Color(0xFFD3D3D3),
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: Color(0xFFD3D3D3),
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: Color(0xFFD3D3D3),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              if (count < 300) count++;
                                            });
                                          },
                                          child: Container(
                                            height: 43,
                                            decoration: BoxDecoration(
                                              color: ManagerColors.primary,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),

                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    spacing: 10,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              count = 50;
                                            });
                                          },
                                          child: CountContainer(count: 50),
                                        ),
                                      ),

                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              count = 100;
                                            });
                                          },
                                          child: CountContainer(count: 100),
                                        ),
                                      ),

                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              count = 200;
                                            });
                                          },
                                          child: CountContainer(count: 200),
                                        ),
                                      ),

                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              count = 300;
                                            });
                                          },
                                          child: CountContainer(count: 300),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  LoginButton(
                    textButton: "التالي",
                    onPressed: () {
                      tabController!.animateTo(1);
                      // setState(() {
                      //   tabBar2Color = Colors.white;
                      // });
                    },
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        spacing: 15,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "تفاصيل المناسبة",
                                style: ManagerTextStyles.title,
                              ),
                              Text(
                                "قم بإضافة اسم المناسبة وتاريخها وموقع إقامتها",
                                style: ManagerTextStyles.subCardTitle,
                              ),
                            ],
                          ),

                          Form(
                            key: formkey,
                            child: Column(
                              spacing: 15,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  spacing: 5,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "إسم المناسبة",
                                      style: ManagerTextStyles.label,
                                    ),
                                    TextFormFeildStyle(
                                      validator: (v) {},
                                      hintText: "مثال : حفل زواج أحمد وفاطمة",
                                      width: double.infinity,
                                    ),
                                  ],
                                ),

                                Row(
                                  spacing: 10,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        spacing: 5,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "التاريخ",
                                            style: ManagerTextStyles.label,
                                          ),
                                          TextFormFeildStyle(
                                            hintText: "mm/dd/yyyy",
                                            validator: (v) {},
                                            width:
                                                (MediaQuery.of(
                                                  context,
                                                ).size.width) /
                                                2,
                                            suffixIcon: IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.calendar_today_outlined,
                                                color: ManagerColors.primary,
                                                size: 18,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Expanded(
                                      child: Column(
                                        spacing: 5,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "وقت بدء المناسبة",
                                            style: ManagerTextStyles.label,
                                          ),
                                          TextFormFeildStyle(
                                            validator: (v) {},
                                            hintText: "--:-- --",
                                            width:
                                                (MediaQuery.of(
                                                  context,
                                                ).size.width) /
                                                2,
                                            suffixIcon: IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.access_time_rounded,
                                                color: ManagerColors.primary,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                Column(
                                  spacing: 5,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "الموقع وتفاصيله",
                                      style: ManagerTextStyles.label,
                                    ),
                                    TextFormFeildStyle(
                                      validator: (v) {},
                                      hintText:
                                          "يرجى كتابة تفاصيل موقع المناسبة وتحديد مكان انعقادها بشكل واضح.",
                                      hight: 109,
                                      width: double.infinity,
                                      maxLines: 5,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  LoginButton(textButton: "تأكيد الإضافة", onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
