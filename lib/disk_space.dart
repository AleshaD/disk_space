import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class DiskSpace {
  static const MethodChannel _channel = const MethodChannel('disk_space');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<int?> get getCacheSize async {
    final int? cacheSize = await _channel.invokeMethod('getCacheSize');

    return cacheSize;
  }

  static Future<void> clearCache() async {
    await _channel.invokeMethod('clearCache');
  }

  static Future<double?> get getFreeDiskSpace async {
    final double? freeDiskSpace =
        await _channel.invokeMethod('getFreeDiskSpace');
    return freeDiskSpace;
  }

  static Future<double?> get getTotalDiskSpace async {
    final double? totalDiskSpace =
        await _channel.invokeMethod('getTotalDiskSpace');
    return totalDiskSpace;
  }

  static Future<double?> getFreeDiskSpaceForPath(String path) async {
    if (!Directory(path).existsSync()) {
      throw Exception("Specified path does not exist");
    }
    final double? freeDiskSpace =
        await _channel.invokeMethod('getFreeDiskSpaceForPath', {"path": path});
    return freeDiskSpace;
  }
}
