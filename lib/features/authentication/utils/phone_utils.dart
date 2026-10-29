String maskPhoneNumber(String phoneNumber) {
  if (phoneNumber.length < 11) {
    return phoneNumber;
  }

  return '${phoneNumber.substring(0, 4)}****${phoneNumber.substring(10)}';
}
