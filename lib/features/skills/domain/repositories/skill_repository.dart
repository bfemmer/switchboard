import 'package:switchboard/core/utils/result.dart';
import 'package:switchboard/features/skills/data/models/skill.dart';

abstract interface class SkillRepository {
  Future<Result<List<Skill>>> list();
}
