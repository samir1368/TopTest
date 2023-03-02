
String toPersianWords(int number) {
  final Map<int, String> persianNumbers = {
    0: 'صفر',
    1: 'یک',
    2: 'دو',
    3: 'سه',
    4: 'چهار',
    5: 'پنج',
    6: 'شش',
    7: 'هفت',
    8: 'هشت',
    9: 'نه',
    10: 'ده',
    11: 'یازده',
    12: 'دوازده',
    13: 'سیزده',
    14: 'چهارده',
    15: 'پانزده',
    16: 'شانزده',
    17: 'هفده',
    18: 'هجده',
    19: 'نوزده',
    20: 'بیست',
    30: 'سی',
    40: 'چهل',
    50: 'پنجاه',
    60: 'شصت',
    70: 'هفتاد',
    80: 'هشتاد',
    90: 'نود',
    100: 'صد',
    200: 'دویست',
    300: 'سیصد',
    400: 'چهارصد',
    500: 'پانصد',
    600: 'ششصد',
    700: 'هفتصد',
    800: 'هشتصد',
    900: 'نهصد'
  };

  final List<int> divisors = [1000000000, 1000000, 1000, 1];
  final List<String> words = ['میلیارد', 'میلیون', 'هزار', ''];

  String result = '';

  for (int i = 0; i < divisors.length; i++) {
    int divisor = divisors[i];

    if (number >= divisor) {
      int quotient = number ~/ divisor;
      int remainder = number % divisor;

      if (quotient > 0) {
        String current = '';

        if (quotient >= 100) {
          int hundreds = quotient ~/ 100;
          current += persianNumbers[hundreds * 100]! + ' ';
          quotient %= 100;
        }

        if (quotient >= 20) {
          int tens = quotient ~/ 10;
          current += (persianNumbers[tens * 10]! + ' ');
          quotient %= 10;
        }

        if (quotient > 0) {
          current += persianNumbers[quotient]! + ' ';
        }

        current += words[i];

        if (result.isNotEmpty) {
          result += ' و ';
        }

        result += current;
      }

      number = remainder;
    }
  }

  return result;
}
