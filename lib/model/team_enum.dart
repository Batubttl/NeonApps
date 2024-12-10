import 'package:neon_apps_full1/model/array.dart';

void printFlutterMembers(List<NeonAcademyMember> members) {
  var flutterTeam = members.where((m) => m.team == Team.flutterDev);
  print("Flutter Takım Üyeleri ");
  for (var member in flutterTeam) {
    print(member.fullName);
  }
}

void printTeamMessage(Team team) {
  switch (team) {
    case Team.flutterDev:
      print("Flutter Geliştirme Takımı Neon Academy'nin bel kemiğidir.");
      break;
    case Team.iosDev:
      print("iOS Geliştirme Takımı yenilikçi projeler yapıyor.");
      break;
    case Team.androidDev:
      print("Android Geliştirme Takımı geleceği inşa ediyor.");
      break;
    case Team.designTeam:
      print("UI/UX Tasarım Takımı Neon Academy'nin yüzüdür.");
      break;
  }
}

enum Team { flutterDev, iosDev, androidDev, designTeam }

void main() {
  printFlutterMembers(members);
  print("------------------");
  printTeamMessage(Team.designTeam);
}
