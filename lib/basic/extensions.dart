extension stringExtensions on String {
  bool get isPalindrome {
    String reversed = split('').reversed.join('');
    return this == reversed;
  }
}

extension intExtensions on int {
  bool get isPrime {
    if (this < 2) return false;
    for (int i = 2; i <= this ~/ 2; i++) {
      if (this % i == 0) {
        return false;
      }
    }
    return true;
  }
}

extension dateTimeExtensions on DateTime {
  int daysBetween(DateTime other) {
    return other.difference(this).inDays.abs();
  }
}

extension boolExtensions on bool {
  bool and(bool other) => this && other;
  bool or(bool other) => this || other;
}

extension setExtensions<T> on Set<T> {
  Set<T> get unique => toSet();
}

extension MapExtensions on Map<String, String> {
  Map<String, List<String>> groupBySurname() {
    Map<String, List<String>> grouped = {};
    forEach((key, value) {
      grouped.putIfAbsent(value, () => []).add(key);
    });
    return grouped;
  }
}

void main() {
  print("odun".isPalindrome);

  print(9.isPrime);
  DateTime date1 = DateTime(1968, 10, 18);
  DateTime date2 = DateTime(1968, 10, 19);
  print(date1.daysBetween(date2));

  Set<int> numbers = {1, 2, 2, 2, 5};
  print(numbers.unique);
  var family = {"John Doe": "Doe", "Jane Smith": "Smith", "Alice Doe": "Doe"};
  print(family.groupBySurname());
}
