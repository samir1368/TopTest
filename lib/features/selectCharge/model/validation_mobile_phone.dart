
bool isValidPhone(String phone) {
  bool phone09Valid = RegExp(r'^\+?09[0-9]{9}$').hasMatch(phone);
  bool phone98Valid = RegExp(r'^\+?98[0-9]{10}$').hasMatch(phone);
  if (phone09Valid || phone98Valid) {
    return true;
  } else {
    return false;
  }
}
