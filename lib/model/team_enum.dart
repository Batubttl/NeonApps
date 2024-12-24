import 'array.dart';

void printFlutterMembers(List<NeonAcademyMember> members) {
  var flutterTeam = members.where((m) => m.team == Team.flutterDev);
  print("Flutter Takım Üyeleri ");
  for (var member in flutterTeam) {
    print(member.fullName);
  }
}

void printTeamMessage(NeonAcademyMember member) {
  switch (member.team) {
    case Team.flutterDev:
      print("${member.fullName}  is a skilled Flutter developer");
      break;
    case Team.iosDev:
      print(" ${member.fullName} is a great codder.");
      break;
    case Team.androidDev:
      print(" ${member.fullName} is a great teammate.");
      break;
    case Team.designTeam:
      print("${member.fullName}is a talented designer.");
      break;
  }
}

void printOlderThanAge(
    int age, Team spesificTeam, List<NeonAcademyMember> members) {
  List<String> filteredMembers = members
      .where((member) => member.age > age && member.team == spesificTeam)
      .map((member) => member.fullName)
      .toList();

  if (filteredMembers.isNotEmpty) {
    print("Members in $spesificTeam older than $age :");
    for (var name in filteredMembers) {
      print(name);
    }
  }
}

enum Team { flutterDev, iosDev, androidDev, designTeam }

void printTeamCount(List<NeonAcademyMember> members, Team team) {
  var teamCounts = <Team, int>{};

  for (var member in members) {
    teamCounts[member.team] = (teamCounts[member.team] ?? 0) + 1;
  }

  print('${team.name} has ${teamCounts[team] ?? 0} members.');
}

void printPromoteMember(NeonAcademyMember member) {
  switch (member.team) {
    case Team.flutterDev:
      member.newTitle = "Senior Flutter Developer";
      break;
    case Team.iosDev:
      member.newTitle = "Senior iOS Developer";
      break;
    case Team.androidDev:
      member.newTitle = "Senior Android Developer";
      break;
    case Team.designTeam:
      member.newTitle = "Lead Designer";
      break;
  }
  print("${member.fullName} has been promoted to ${member.newTitle}");
}

double calculateAverageAge(List<NeonAcademyMember> members, Team team) {
  var teamMembers = members.where((member) => member.team == team).toList();
  if (teamMembers.isEmpty) {
    return 0;
  }

  int totalAge = teamMembers.fold(0, (sum, member) => sum + member.age);

  return totalAge / teamMembers.length;
}

List<String> getContactInfoByTeam(Team team) {
  List<String> contactInfoList = [];

  // Üyeleri kontrol et ve belirtilen takıma ait üyeleri seç
  for (var member in members) {
    if ((member.title) == team) {
      contactInfoList.add(
        'Name: ${member.fullName}, Phone: ${member.contactInformation.phoneNumber}, Email: ${member.contactInformation.email}',
      );
    }
  }

  return contactInfoList;
}

void printInfoTeamAge(NeonAcademyMember member) {
  switch (member.team) {
    case Team.flutterDev:
      if (member.age > 23) {
        print('${member.fullName} is a seasoned Flutter developer');
      } else {
        print('${member.fullName} is a rising star  in the Flutter World');
      }
      switch (member.team) {
        case Team.designTeam:
          if (member.age > 24) {
            print('${member.fullName} is a seasoned Design Team');
          } else {
            print('${member.fullName}is a rising star in the design world"');
          }
        case Team.flutterDev:
          throw UnimplementedError();
        case Team.iosDev:
          throw UnimplementedError();
        case Team.androidDev:
          throw UnimplementedError();
      }

      break;

    default:
  }
}

void main() {
  printFlutterMembers(members);
  print("------------------");
  printTeamMessage(member3);
  print("----------");
  printTeamCount(members, Team.flutterDev);
  printOlderThanAge(22, Team.flutterDev, members);
  printPromoteMember(member3);
  double flutterAverageAge = calculateAverageAge(members, Team.androidDev);
  print(
      'Flutter Development Team average age: ${flutterAverageAge.toStringAsFixed(2)}');
  var flutterDevContactInfo = getContactInfoByTeam(Team.flutterDev);

  // İletişim bilgilerini yazdır
  for (var contact in flutterDevContactInfo) {
    print(contact);
  }
  printInfoTeamAge(member4);
}
