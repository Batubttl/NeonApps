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