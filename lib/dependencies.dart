import 'package:get_it/get_it.dart';
import 'package:switchboard/features/apps/data/datasources/app_datasource.dart';
import 'package:switchboard/features/apps/data/datasources/app_datasource_local.dart';
import 'package:switchboard/features/apps/data/repositories/app_repository_impl.dart';
import 'package:switchboard/features/apps/domain/repositories/app_repository.dart';
import 'package:switchboard/features/apps/presentation/viewmodels/app_viewmodel.dart';
import 'package:switchboard/features/faq/data/datasources/faq_datasource.dart';
import 'package:switchboard/features/faq/data/datasources/faq_datasource_local.dart';
import 'package:switchboard/features/faq/data/repositories/faq_repository_impl.dart';
import 'package:switchboard/features/faq/domain/repositories/faq_repository.dart';
import 'package:switchboard/features/faq/presentation/viewmodels/faq_viewmodel.dart';
import 'package:switchboard/features/guides/data/datasources/guide_datasource.dart';
import 'package:switchboard/features/guides/data/datasources/guide_datasource_local.dart';
import 'package:switchboard/features/guides/data/repositories/guide_repository_impl.dart';
import 'package:switchboard/features/guides/domain/repositories/guide_repository.dart';
import 'package:switchboard/features/guides/presentation/viewmodels/guide_viewmodel.dart';
import 'package:switchboard/features/skills/data/datasources/skill_datasource.dart';
import 'package:switchboard/features/skills/data/datasources/skill_datasource_local.dart';
import 'package:switchboard/features/skills/data/repositories/skill_repository_impl.dart';
import 'package:switchboard/features/skills/domain/repositories/skill_repository.dart';
import 'package:switchboard/features/skills/presentation/viewmodels/skill_viewmodel.dart';
import 'package:switchboard/features/units/data/datasources/unit_datasource.dart';
import 'package:switchboard/features/units/data/datasources/unit_datasource_local.dart';
import 'package:switchboard/features/units/data/repositories/unit_repository_impl.dart';
import 'package:switchboard/features/units/domain/repositories/unit_repository.dart';
import 'package:switchboard/features/units/presentation/viewmodels/unit_viewmodel.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initApps();
  _initFaqs();
  _initGuides();
  _initSkills();
  _initUnits();
}

void _initApps() {
  // Datasource
  serviceLocator.registerFactory<AppDatasource>(() => AppDatasourceLocal());

  // Repository
  serviceLocator.registerFactory<AppRepository>(
    () => AppRepositoryImpl(datasource: serviceLocator<AppDatasource>()),
  );

  // Viewmodel
  serviceLocator.registerLazySingleton<AppViewModel>(
    () => AppViewModel(serviceLocator<AppRepository>()),
  );
}

void _initFaqs() {
  // Datasource
  serviceLocator.registerFactory<FaqDatasource>(() => FaqDatasourceLocal());

  // Repository
  serviceLocator.registerFactory<FaqRepository>(
    () => FaqRepositoryImpl(datasource: serviceLocator<FaqDatasource>()),
  );

  // Viewmodel
  serviceLocator.registerLazySingleton<FaqViewModel>(
    () => FaqViewModel(serviceLocator<FaqRepository>()),
  );
}

void _initSkills() {
  // Datasource
  serviceLocator.registerFactory<SkillDatasource>(() => SkillDatasourceLocal());

  // Repository
  serviceLocator.registerFactory<SkillRepository>(
    () => SkillRepositoryImpl(datasource: serviceLocator<SkillDatasource>()),
  );

  // Viewmodel
  serviceLocator.registerLazySingleton<SkillViewModel>(
    () => SkillViewModel(serviceLocator<SkillRepository>()),
  );
}

void _initGuides() {
  // Datasource
  serviceLocator.registerFactory<GuideDatasource>(() => GuideDatasourceLocal());

  // Repository
  serviceLocator.registerFactory<GuideRepository>(
    () => GuideRepositoryImpl(datasource: serviceLocator<GuideDatasource>()),
  );

  // Viewmodel
  serviceLocator.registerLazySingleton<GuideViewModel>(
    () => GuideViewModel(serviceLocator<GuideRepository>()),
  );
}

void _initUnits() {
  // Datasource
  serviceLocator.registerFactory<UnitDatasource>(() => UnitDatasourceLocal());

  // Repository
  serviceLocator.registerFactory<UnitRepository>(
    () => UnitRepositoryImpl(datasource: serviceLocator<UnitDatasource>()),
  );

  // Viewmodel
  serviceLocator.registerLazySingleton<UnitViewModel>(
    () => UnitViewModel(serviceLocator<UnitRepository>()),
  );
}
