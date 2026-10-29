import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:tasks/core/managers/manager_colors.dart';
import 'package:tasks/core/managers/manager_strings.dart';
import 'package:tasks/core/widgets/login_button.dart';
import 'package:tasks/features/home/managers/manager_font_size.dart';
import 'package:tasks/features/home/managers/manages_text_styles.dart';
import 'package:tasks/features/home/widgets/count_container.dart';
import 'package:tasks/features/home/widgets/text_form_feild.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<StatefulWidget> createState() => _AddEvent();
}

class _AddEvent extends State<AddEvent> with SingleTickerProviderStateMixin {
  TabController? tabController;
  int count = 0;
  GlobalKey<FormState> formkey = GlobalKey();
  final ImagePicker picker = ImagePicker();
  XFile? selectedImage;
  Uint8List? selectedImageBytes;
  String? uploadedImageUrl;
  String? uploadedImagePath;
  DateTime? selectedEventDate;
  bool isLoading = false;
  final titleController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
  }

  Future<void> pickImage() async {
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    final bytes = await image.readAsBytes();

    setState(() {
      selectedImage = image;
      selectedImageBytes = bytes;
    });
  }

  Future<String> uploadSelectedImage() async {
    if (selectedImageBytes == null || selectedImage == null) {
      throw Exception('يرجى اختيار صورة أولاً');
    }

    final supabase = Supabase.instance.client;
    final user = supabase.auth.currentUser;

    if (user == null) {
      throw Exception('يجب تسجيل الدخول أولاً');
    }

    final extension = selectedImage!.name.split('.').last;
    final filePath =
        '${user.id}/${DateTime.now().millisecondsSinceEpoch}.$extension';
    uploadedImagePath = filePath;
    await supabase.storage
        .from('event-images')
        .uploadBinary(
          filePath,
          selectedImageBytes!,
          fileOptions: FileOptions(contentType: selectedImage!.mimeType),
        );

    return supabase.storage.from('event-images').getPublicUrl(filePath);
  }

  Future<void> pickEventDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateUtils.dateOnly(DateTime.now()),
      lastDate: DateTime(2100),
    );

    if (pickedDate == null) return;

    setState(() {
      selectedEventDate = pickedDate;
      dateController.text =
          '${pickedDate.day.toString().padLeft(2, '0')}-'
          '${pickedDate.month.toString().padLeft(2, '0')}-'
          '${pickedDate.year}';
    });
  }

  Future<void> pickEventTime() async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime == null) return;

    timeController.text =
        '${pickedTime.hour.toString().padLeft(2, '0')}:'
        '${pickedTime.minute.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    tabController?.dispose();
    titleController.dispose();
    dateController.dispose();
    timeController.dispose();
    addressController.dispose();
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
                ManagerStrings.newEvent,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ManagerFontSize.larg,
                ),
              ),
              Text(
                ManagerStrings.addYourEventDetails,
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
                                            ManagerStrings.eventImage,
                                            style: ManagerTextStyles.title,
                                          ),
                                          Text(
                                            ManagerStrings
                                                .eventImageDescription,
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
                                    child: InkWell(
                                      onTap: () {
                                        pickImage();
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 119,
                                        decoration: BoxDecoration(),
                                        child: selectedImageBytes != null
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Image.memory(
                                                  selectedImageBytes!,
                                                  width: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                            : Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 42,
                                                    height: 42,
                                                    decoration: BoxDecoration(
                                                      color: ManagerColors
                                                          .secondary
                                                          .withValues(
                                                            alpha: 0.1,
                                                          ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            10,
                                                          ),
                                                    ),
                                                    child: Icon(
                                                      Icons
                                                          .file_upload_outlined,
                                                      color: ManagerColors
                                                          .secondary,
                                                    ),
                                                  ),
                                                  Text(
                                                    ManagerStrings.uploadImage,
                                                    style: ManagerTextStyles
                                                        .subCardTitle
                                                        .copyWith(
                                                          fontSize:
                                                              ManagerFontSize
                                                                  .small,
                                                        ),
                                                  ),
                                                  Text(
                                                    ManagerStrings.imageFormats,
                                                    style: ManagerTextStyles
                                                        .subCardTitle,
                                                  ),
                                                ],
                                              ),
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
                                              ManagerStrings.guestPrinting,
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
                                                    ManagerStrings
                                                        .enableFeature,
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
                                              ManagerStrings
                                                  .guestPrintingDescription,
                                              style: ManagerTextStyles
                                                  .subCardTitle,
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                style: ManagerTextStyles
                                                    .subCardTitle,
                                                children: [
                                                  TextSpan(
                                                    text: ManagerStrings
                                                        .printedGuestList,
                                                  ),
                                                  TextSpan(
                                                    text: ManagerStrings
                                                        .twoHundredRiyals,
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
                                            ManagerStrings.guestCount,
                                            style: ManagerTextStyles.title,
                                          ),
                                          Text(
                                            ManagerStrings
                                                .guestCountDescription,
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
                    textButton: ManagerStrings.next,
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
                                ManagerStrings.eventDetails,
                                style: ManagerTextStyles.title,
                              ),
                              Text(
                                ManagerStrings.eventDetailsDescription,
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
                                      ManagerStrings.eventName,
                                      style: ManagerTextStyles.label,
                                    ),
                                    TextFormFeildStyle(
                                      controller: titleController,
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'يرجى إدخال عنوان المناسبة';
                                        }

                                        if (value.trim().length < 3) {
                                          return 'يجب ألا يقل عنوان المناسبة عن 3 أحرف';
                                        }

                                        if (value.trim().length > 50) {
                                          return 'يجب ألا يزيد عنوان المناسبة عن 50 حرفًا';
                                        }

                                        return null;
                                      },
                                      hintText: ManagerStrings.eventNameHint,
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
                                            ManagerStrings.date,
                                            style: ManagerTextStyles.label,
                                          ),
                                          TextFormFeildStyle(
                                            controller: dateController,
                                            hintText: ManagerStrings.dateHint,

                                            validator: (value) {
                                              if (selectedEventDate == null) {
                                                return 'يرجى اختيار تاريخ المناسبة';
                                              }

                                              if (selectedEventDate!.isBefore(
                                                DateUtils.dateOnly(
                                                  DateTime.now(),
                                                ),
                                              )) {
                                                return 'لا يمكن اختيار تاريخ سابق لليوم';
                                              }

                                              return null;
                                            },
                                            width:
                                                (MediaQuery.of(
                                                  context,
                                                ).size.width) /
                                                2,
                                            suffixIcon: IconButton(
                                              onPressed: pickEventDate,

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
                                            ManagerStrings.eventStartTime,
                                            style: ManagerTextStyles.label,
                                          ),
                                          TextFormFeildStyle(
                                            controller: timeController,

                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'يرجى اختيار وقت المناسبة';
                                              }

                                              return null;
                                            },

                                            hintText: ManagerStrings
                                                .eventStartTimeHint,
                                            width:
                                                (MediaQuery.of(
                                                  context,
                                                ).size.width) /
                                                2,
                                            suffixIcon: IconButton(
                                              onPressed: pickEventTime,

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
                                      ManagerStrings.locationAndDetails,
                                      style: ManagerTextStyles.label,
                                    ),
                                    TextFormFeildStyle(
                                      controller: addressController,
                                      validator: (v) {
                                        return null;
                                      },
                                      hintText:
                                          ManagerStrings.locationAndDetailsHint,
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
                  LoginButton(
                    textButton: ManagerStrings.confirmAddition,
                    isLoading: isLoading,
                    onPressed: () async {
                      if (isLoading) return;
                      if (!formkey.currentState!.validate()) {
                        return;
                      }
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        final imageUrl = await uploadSelectedImage();

                        final supabase = Supabase.instance.client;
                        final user = supabase.auth.currentUser;

                        if (user == null) {
                          throw Exception('يجب تسجيل الدخول أولاً');
                        }
                        try {
                          await supabase.from('events').insert({
                            'title': titleController.text.trim(),
                            'image_url': imageUrl,
                            'address': addressController.text.trim(),
                            'event_date': selectedEventDate!
                                .toIso8601String()
                                .split('T')[0],
                            'event_time': timeController.text.trim(),
                            'attendance_count': 0,
                            'budget': 0,
                            'invited_count': count,
                            'gifts_count': 0,
                            'total_gift_amount': 0.0,
                            'average_gift_value': 0.0,
                            'user_id': user.id,
                          });
                        } catch (e) {
                          if (uploadedImagePath != null) {
                            try {
                              await Supabase.instance.client.storage
                                  .from('event-images')
                                  .remove([uploadedImagePath!]);
                              uploadedImagePath = null;
                            } catch (deleteError) {
                              debugPrint('فشل حذف الصورة: $deleteError');
                            }
                          }

                          rethrow;
                        }
                        uploadedImagePath = null;
                        if (!mounted) return;

                        Navigator.of(context).pop(true);
                      } catch (e) {
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('فشلت إضافة المناسبة: $e')),
                        );
                      } finally {
                        if (mounted) {
                          setState(() {
                            isLoading = false;
                          });
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
