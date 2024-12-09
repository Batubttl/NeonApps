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
  ContactInformation contactInformation;

  NeonAcademyMember({
    required this.fullName,
    required this.title,
    required this.horoscope,
    required this.memberLevel,
    required this.homeTown,
    required this.age,
    required this.contactInformation,
  });
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

void main() {
  var contact1 = ContactInformation(
      phoneNumber: "543-987-4796", email: "denizyilmaz@gmail.com");

  var contact2 = ContactInformation(
      phoneNumber: "567-784-3654", email: "firatakin@gmail.com");

  var contact3 = ContactInformation(
      phoneNumber: "597-123-6547", email: "ceyhunsozen@gmail.com");

  var member1 = NeonAcademyMember(
      fullName: "Deniz",
      title: "Flutter Developer",
      horoscope: "Aries",
      memberLevel: "A3",
      homeTown: "Mersin",
      age: 27,
      contactInformation: contact1);

  var member2 = NeonAcademyMember(
      fullName: "Fırat",
      title: "IOS Developer",
      horoscope: "Terazi",
      memberLevel: "A3",
      homeTown: "Manisa",
      age: 32,
      contactInformation: contact2);

  var member3 = NeonAcademyMember(
      fullName: "Ceyhun",
      title: "IOS Developer",
      horoscope: "Terazi",
      memberLevel: "A3",
      homeTown: "Sozen",
      age: 25,
      contactInformation: contact3);

  var members = [member1, member2, member3];
  print('Neon Academy Members \n');
  for (var member in members) {
    print(member);
    print("---------------------------");
  }
}
