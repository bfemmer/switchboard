import 'package:flutter/material.dart';
import 'package:switchboard/core/utils/command.dart';
import 'package:switchboard/core/utils/result.dart';
import 'package:switchboard/features/resources/data/models/resource.dart';
import 'package:switchboard/features/resources/data/models/video.dart';
import 'package:switchboard/features/resources/domain/repositories/resource_repository.dart';

class ResourceViewModel extends ChangeNotifier {
  final ResourceRepository _resourceRepository;

  List<Resource> _resources = [];
  List<Resource> get resources => _resources;

  List<Video> _videos = [];
  List<Video> get videos => _videos;
  List<Video> get canVideos =>
      videos.where((video) => video.series == 'CAN').toList();
  List<Video> get readyVideos =>
      videos.where((video) => video.series == 'Reserve Ready').toList();
  List<Video> get fapVideos =>
      videos.where((video) => video.series == 'FAP').toList();
  List<Video> get toolsVideos =>
      videos.where((video) => video.series == 'Tools').toList();

  late Command0<void> load;
  late Command0<void> loadHotlines;
  late Command0<void> loadVideos;
  late Command1<void, int> loadForCategory;

  ResourceViewModel(this._resourceRepository) {
    load = Command0(_load);
    loadHotlines = Command0(_loadHotlines);
    loadVideos = Command0(_loadVideos);
    loadForCategory = Command1(_loadForCategory);
  }

  Future<Result> _load() async {
    try {
      Result<List<Resource>> fetchedDataResult = await _resourceRepository
          .list();

      switch (fetchedDataResult) {
        case Ok<List<Resource>>():
          _resources = fetchedDataResult.value;

        case Error<List<Resource>>():
      }

      return fetchedDataResult;
    } finally {
      notifyListeners();
    }
  }

  Future<Result> _loadHotlines() async {
    try {
      Result<List<Resource>> fetchedDataResult = await _resourceRepository
          .listHotlines();

      switch (fetchedDataResult) {
        case Ok<List<Resource>>():
          _resources = fetchedDataResult.value;

        case Error<List<Resource>>():
      }

      return fetchedDataResult;
    } finally {
      notifyListeners();
    }
  }

  Future<Result> _loadVideos() async {
    try {
      Result<List<Video>> fetchedDataResult = await _resourceRepository
          .listVideos();

      switch (fetchedDataResult) {
        case Ok<List<Video>>():
          _videos = fetchedDataResult.value;

        case Error<List<Video>>():
      }

      return fetchedDataResult;
    } finally {
      notifyListeners();
    }
  }

  Future<Result> _loadForCategory(int id) async {
    try {
      Result<List<Resource>> fetchedDataResult = await _resourceRepository
          .listByCategoryId(id);

      switch (fetchedDataResult) {
        case Ok<List<Resource>>():
          _resources = fetchedDataResult.value;

        case Error<List<Resource>>():
      }

      return fetchedDataResult;
    } finally {
      notifyListeners();
    }
  }
}
