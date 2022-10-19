import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:path_provider/path_provider.dart' as pp;

class CacheOptionsManager {
  static final CacheOptionsManager instance = CacheOptionsManager._();

  factory CacheOptionsManager() => instance;

  static late CacheOptions _cacheOptions;

  Options get cacheOptions => _cacheOptions.toOptions();

  CacheOptions get cacheOptionsSource => _cacheOptions;

  HiveCacheStore? _dbCacheStore;

  clearCache() async {
    await _dbCacheStore?.clean();
    await _dbCacheStore?.close();
    await _buildHiveStore();
  }

  CacheOptionsManager._() {
    /// to avoid awaiting for the path initialization use a [MemCacheStore]
    /// and then replace it with [DbCacheStore] once the path is available
    _cacheOptions = _initOptions(MemCacheStore());
    _buildHiveStore();
  }

  _buildHiveStore() async {
    var dir = await pp.getTemporaryDirectory();
    _dbCacheStore ??= HiveCacheStore(dir.path);
    if (_dbCacheStore != null) {
      _cacheOptions = _initOptions(_dbCacheStore!);
    }
  }

  /// creates [CacheOptions] with [CacheStore] variable
  CacheOptions _initOptions(CacheStore store) {
    return CacheOptions(
      store: store,
      hitCacheOnErrorExcept: [401, 403, 400],
      maxStale: const Duration(days: 7),
      priority: CachePriority.normal,
      policy: CachePolicy.forceCache,
      cipher: null,
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      allowPostMethod: false,
    );
  }
}
