import 'package:switchboard/core/utils/result.dart';
import 'package:switchboard/features/skills/data/datasources/skill_datasource.dart';
import 'package:switchboard/features/skills/data/models/skill.dart';
import 'package:switchboard/features/skills/domain/repositories/skill_repository.dart';

class SkillRepositoryImpl implements SkillRepository {
  final SkillDatasource datasource;

  SkillRepositoryImpl({required this.datasource});

  @override
  Future<Result<List<Skill>>> list() async {
    try {
      final result = await datasource.list();
      return Result.ok(result);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
