import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void showAuthError(BuildContext context, AuthException error) {
  final message = switch (error.code) {
    'otp_expired' => 'انتهت صلاحية رمز التحقق، اطلب رمزًا جديدًا.',
    'invalid_credentials' => 'بيانات الدخول غير صحيحة.',
    'weak_password' => 'كلمة المرور ضعيفة، اختر كلمة مرور أقوى.',
    'otp_disabled' => 'رقم الهاتف غير مسجل لدينا.',
    'sms_send_failed' => 'تعذّر إرسال رمز التحقق، يرجى المحاولة مرة أخرى.',
    'same_password' => 'أدخل كلمة مرور جديدة',
    _ => 'حدث خطأ، يرجى المحاولة مرة أخرى.',
  };

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, textDirection: TextDirection.rtl),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
    ),
  );
}
