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
import 'package:switchboard/features/home/data/datasources/feed_datasource.dart';
import 'package:switchboard/features/home/data/datasources/feed_datasource_local.dart';
import 'package:switchboard/features/home/data/repositories/feed_repository_impl.dart';
import 'package:switchboard/features/home/domain/repositories/feed_repository.dart';
import 'package:switchboard/features/home/presentation/viewmodels/feed_viewmodel.dart';
import 'package:switchboard/features/guides/data/datasources/guide_datasource.dart';
import 'package:switchboard/features/guides/data/datasources/guide_datasource_local.dart';
import 'package:switchboard/features/guides/data/repositories/guide_repository_impl.dart';
import 'package:switchboard/features/guides/domain/repositories/guide_repository.dart';
import 'package:switchboard/features/guides/presentation/viewmodels/guide_viewmodel.dart';
import 'package:switchboard/features/resources/data/datasources/category_datasource.dart';
import 'package:switchboard/features/resources/data/datasources/category_datasource_local.dart';
import 'package:switchboard/features/resources/data/datasources/resource_datasource.dart';
import 'package:switchboard/features/resources/data/datasources/resource_datasource_local.dart';
import 'package:switchboard/features/resources/data/repositories/category_repository_impl.dart';
import 'package:switchboard/features/resources/data/repositories/resource_repository_impl.dart';
import 'package:switchboard/features/resources/domain/repositories/category_repository.dart';
import 'package:switchboard/features/resources/domain/repositories/resource_repository.dart';
import 'package:switchboard/features/resources/presentation/viewmodels/category_viewmodel.dart';
import 'package:switchboard/features/resources/presentation/viewmodels/resource_viewmodel.dart';
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
  _initCategories();
  _initFaqs();
  _initFeed();
  _initGuides();
  _initResources();
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

void _initCategories() {
  // Datasource
  serviceLocator.registerFactory<CategoryDatasource>(
    () => CategoryDatasourceLocal(),
  );

  // Repository
  serviceLocator.registerFactory<CategoryRepository>(
    () => CategoryRepositoryImpl(
      datasource: serviceLocator<CategoryDatasource>(),
    ),
  );

  // Viewmodel
  serviceLocator.registerLazySingleton<CategoryViewModel>(
    () => CategoryViewModel(serviceLocator<CategoryRepository>()),
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

void _initFeed() {
  // Datasource
  serviceLocator.registerFactory<FeedDatasource>(() => FeedDatasourceLocal());

  // Repository
  serviceLocator.registerFactory<FeedRepository>(
    () => FeedRepositoryImpl(datasource: serviceLocator<FeedDatasource>()),
  );

  // Viewmodel
  serviceLocator.registerLazySingleton<FeedViewModel>(
    () => FeedViewModel(serviceLocator<FeedRepository>()),
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

void _initResources() {
  // Datasource
  serviceLocator.registerFactory<ResourceDatasource>(
    () => ResourceDatasourceLocal(),
  );

  // Repository
  serviceLocator.registerFactory<ResourceRepository>(
    () => ResourceRepositoryImpl(
      datasource: serviceLocator<ResourceDatasource>(),
    ),
  );

  // Viewmodel
  serviceLocator.registerLazySingleton<ResourceViewModel>(
    () => ResourceViewModel(serviceLocator<ResourceRepository>()),
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
