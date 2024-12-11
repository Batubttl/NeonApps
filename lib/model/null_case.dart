import 'package:neon_apps_full1/model/array.dart';

void increaseMotivation(NeonAcademyMember member, int increaseBy) {
  if (member.motivationLevel == null) {
    member.motivationLevel = 1;
  } else {
    member.motivationLevel = member.motivationLevel! + increaseBy;
  }
}

void printMotivationLevelMessage(
  NeonAcademyMember member,
) {
  if (member.motivationLevel == null) {
    print("${member.fullName} has  no motivation");
  } else if (member.motivationLevel! > 5) {
    print("${member.fullName} has a highly motivation");
  } else {
    print("${member.fullName} has a normal motivation");
  }
}

String? categorizeMotivation(int? motivationLevel) {
  if (motivationLevel == null) {
    return "Not motivated all";
  } else if (motivationLevel > 5) {
    return "Highly motivated normal";
  } else {
    return "Moderately motivated";
  }
}

int getMotivationLevel(NeonAcademyMember member) {
  return member.motivationLevel ?? 0; // Null-aware operatörü kullanıldı
}

bool isMotivationSufficient(NeonAcademyMember member, int targetLevel) {
  return (member.motivationLevel ?? 0) >= targetLevel;
}

void main(List<String> args) {
  printMotivationLevelMessage(member5);
  int targetLevel = 5;
  print(isMotivationSufficient(member1, targetLevel));
}
