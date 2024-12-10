import 'package:neon_apps_full1/model/model.dart';
import 'team_enum.dart';

class ContactInformation {
  String phoneNumber;
  String email;
  ContactInformation({
    required this.phoneNumber,
    required this.email,
  });
  @override
  String toString() {
    return 'Phone : $phoneNumber, Email : $email';
  }
}

class NeonAcademyMember {
  String fullName;
  String title;
  String horoscope;
  String memberLevel;
  String homeTown;
  int age;
  Team team;

  ContactInformation contactInformation;

  NeonAcademyMember(
      {required this.fullName,
      required this.title,
      required this.horoscope,
      required this.memberLevel,
      required this.homeTown,
      required this.age,
      required this.contactInformation,
      required this.team});
  @override
  String toString() {
    return '''
    fullName: $fullName
    title : $title
    horoscope : $horoscope
    memberLevel : $memberLevel
    homeTown : $homeTown
    age : $age
    Contact Information : $contactInformation
    ''';
  }
}

// Üyeleri yazdıran fonksiyon
void printMembers(List<NeonAcademyMember> members) {
  print('Neon Academy Members \n');
  for (var member in members) {
    print(member);
    print("---------------------------");
  }
}

var contact1 = ContactInformation(
    phoneNumber: "543-987-4796", email: "denizyilmaz@gmail.com");

var contact2 = ContactInformation(
    phoneNumber: "567-784-3654", email: "firatakin@gmail.com");

var contact3 = ContactInformation(
    phoneNumber: "597-123-6547", email: "ceyhunsozen@gmail.com");

var contact4 = ContactInformation(
    phoneNumber: "567-456-3468", email: "eylulzengin@gmail.com");

var contact5 = ContactInformation(
    phoneNumber: "123-657-2729", email: "bakialtun@gmail.com");

var member1 = NeonAcademyMember(
    fullName: "Deniz",
    title: "Android Developer",
    horoscope: "Aries",
    memberLevel: "A3",
    homeTown: "Mersin",
    age: 27,
    team: Team.androidDev,
    contactInformation: contact1);

var member2 = NeonAcademyMember(
    fullName: "Fırat",
    title: "IOS Developer",
    horoscope: "Gemini",
    memberLevel: "A3",
    homeTown: "Manisa",
    age: 32,
    team: Team.iosDev,
    contactInformation: contact2);

var member3 = NeonAcademyMember(
    fullName: "Ceyhun",
    title: "IOS Developer",
    horoscope: "Lion",
    memberLevel: "A3",
    homeTown: "Sozen",
    age: 25,
    team: Team.iosDev,
    contactInformation: contact3);

var member4 = NeonAcademyMember(
    fullName: "Eylül",
    title: "Flutter Developer",
    horoscope: "Aries",
    memberLevel: "A1",
    homeTown: "Zengin",
    age: 21,
    team: Team.flutterDev,
    contactInformation: contact4);

var member5 = NeonAcademyMember(
    fullName: "Baki",
    title: "UI Designer",
    horoscope: "Libra",
    memberLevel: "C1",
    homeTown: "Altun",
    age: 25,
    team: Team.designTeam,
    contactInformation: contact5);

var members = [member1, member2, member3, member4, member5];

void main() {
  printMembers(members);

  //1- DELETE
  members.removeAt(2);
  print("After Deleting");
  printMembers(members);

  //2-RANK MEMBERS AGE
  members.sort((a, b) => b.age.compareTo(a.age));
  print("After Sort Age");
  printMembers(members);

  // 3- SORT MEMBERS NAME
  members.sort(
    (a, b) => a.fullName.compareTo(b.fullName),
  );
  print("After Sort Names");
  printMembers(members);

  // 4- IF MEMBERS OLDER THAN AGE 24
  print("After Update");
  var olderThan24 = members.where((m) => m.age > 24).toList();
  olderThan24.forEach((member) {
    print(member.fullName);
  });

  // 5- PRİNT FLUTTER DEVELOPERS
  var flutterDeveloper =
      members.where((m) => m.title == "Flutter Developer").toList();
  print("After Find Flutter Developer ");
  print('Flutter Developer count : ${flutterDeveloper.length}');

  //6-- Print Array Index
  var indexFirat = members.indexWhere((m) => m.fullName == "Fırat");
  print("After Find Index");
  print("Indeks Of Firat : $indexFirat");

  // 7-- ADD A NEW MENTOR
  var newMentor = NeonAcademyMember(
      fullName: "Ahmet",
      title: "Mentor",
      horoscope: "Yay",
      memberLevel: "C1",
      homeTown: "Samsun",
      age: 37,
      team: Team.flutterDev,
      contactInformation: ContactInformation(
          phoneNumber: "543-754-9895", email: "ahmetsamsun@gmail.com"));

  members.add(newMentor);
  print("After Add New Mentor");
  printMembers(members);
  // 8-- REMOVE A1 LEVEL DEVELOPER
  members.removeWhere((m) => m.memberLevel == "A1");
  print("After Remove A1 LEVELS");
  printMembers(members);

  //9--
  var oldestAge = members.reduce((a, b) => a.age > b.age ? a : b);
  print("After Find Oldest Member");
  print('Oldest Age : ${oldestAge} & Fullname : ${oldestAge.fullName}');
// 10
  var longestName =
      members.reduce((a, b) => a.fullName.length > b.fullName.length ? a : b);
  print("After Find Longest Name");
  print(
      'Longest name : ${longestName.fullName} & lenght of name : ${longestName.fullName.length}');

  // 11 -- Horocope Group
  var sameHoroscope = {};
  for (var member in members) {
    if (!sameHoroscope.containsKey(member.horoscope)) {
      sameHoroscope[member.horoscope] = [];
    }
    sameHoroscope[member.horoscope]?.add(member.fullName);
  }
  print("After Grouped by Horoscope");
  sameHoroscope.forEach((horoscope, names) {});
  print("Horoscope : ${sameHoroscope}");

  // 12-- GROUP BY HOMETOWNS
  var hometownCounts = {};
  for (var member in members) {
    hometownCounts[member.homeTown] =
        (hometownCounts[member.homeTown] ?? 0) + 1;
  }
  var mostCommonTown =
      hometownCounts.entries.reduce((a, b) => a.value > b.value ? a : b).key;
  print('\nMost common hometown: $mostCommonTown');
  // Task 14: Calculate the average age of all members
  var averageAge =
      members.map((m) => m.age).reduce((a, b) => a + b) / members.length;
  print('\nAverage age of members: $averageAge');

  //15--
  var contactInfoList = members.map((m) => m.contactInformation.email).toList();
  print('\nEmail addresses of all members:');
  contactInfoList.forEach((email) => print(email));

  // 16--
  members.sort((a, b) => b.memberLevel.compareTo(a.memberLevel));
  print('\nMembers sorted by memberLevel (highest to lowest):');

  // 17--
  var groupedByTitle = {};
  for (var member in members) {
    if (!groupedByTitle.containsKey(member.title)) {
      groupedByTitle[member.title] = [];
    }
    groupedByTitle[member.title]?.add(member.contactInformation.phoneNumber);
  }
  print('\nPhone numbers grouped by title:');
  groupedByTitle.forEach((title, phones) {
    print('$title: ${phones.join(', ')}');
  });
}
