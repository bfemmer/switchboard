import 'package:flutter/foundation.dart';
import 'package:switchboard/core/utils/command.dart';
import 'package:switchboard/core/utils/result.dart';
import 'package:switchboard/features/skills/data/models/skill.dart';
import 'package:switchboard/features/skills/domain/repositories/skill_repository.dart';

class SkillViewModel extends ChangeNotifier {
  final SkillRepository _skillRepository;

  List<Skill> _skills = [];
  List<Skill> get skills => _skills;

  late Command0<void> load;

  SkillViewModel(this._skillRepository) {
    load = Command0(_load);
  }

  Future<Result> _load() async {
    try {
      Result<List<Skill>> fetchedDataResult = await _skillRepository.list();

      switch (fetchedDataResult) {
        case Ok<List<Skill>>():
          _skills = fetchedDataResult.value;

        case Error<List<Skill>>():
      }

      return fetchedDataResult;
    } finally {
      notifyListeners();
    }
  }
}
