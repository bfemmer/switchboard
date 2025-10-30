import 'package:switchboard/features/skills/data/models/skill.dart';

abstract interface class SkillDatasource {
  Future<List<Skill>> list();
}
