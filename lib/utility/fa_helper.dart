import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FaHelper {
  static dynamic getIconFromName(String name) {
    return icons[name];
  }

  static Map<String, dynamic> icons = {
    "peoplePulling": FontAwesomeIcons.peoplePulling,
    "personHarassing": FontAwesomeIcons.personHarassing,
    "school": FontAwesomeIcons.school,
    "skullCrossbones": FontAwesomeIcons.skullCrossbones,
    "handsHolding": FontAwesomeIcons.handsHolding,
    "heartPulse": FontAwesomeIcons.heartPulse,
    "lifeRing": FontAwesomeIcons.lifeRing,
    "moneyBill": FontAwesomeIcons.moneyBill,
    "peopleGroup": FontAwesomeIcons.peopleGroup,
    "gavel": FontAwesomeIcons.gavel,
    "info": FontAwesomeIcons.info,
    "briefcase": FontAwesomeIcons.briefcase,
    "truckMedical": FontAwesomeIcons.truckMedical,
    "children": FontAwesomeIcons.children,
    "handsHoldingChild": FontAwesomeIcons.handsHoldingChild,
    "handFist": FontAwesomeIcons.handFist,
    "handHoldingHand": FontAwesomeIcons.handHoldingHand,
    "church": FontAwesomeIcons.church,
    "personPraying": FontAwesomeIcons.personPraying,
    "personRunning": FontAwesomeIcons.personRunning,
    "peopleRobbery": FontAwesomeIcons.peopleRobbery,
    "starOfLife": FontAwesomeIcons.starOfLife,
    "star": FontAwesomeIcons.star,
    "faceSadCry": FontAwesomeIcons.faceSadCry,
    "peopleCarryBox": FontAwesomeIcons.peopleCarryBox,
    "circleInfo": FontAwesomeIcons.circleInfo,
  };
}
