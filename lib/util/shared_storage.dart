import 'package:shared_storage/shared_storage.dart';

import 'package:huazhixia/config/config.dart';

//shared_storage的二次封装
class SharedStorage {
  ///检查指定目录是否已经授予
  static Future<bool> checkUriGrant(Uri directoryUri) async {
    return await isPersistedUri(directoryUri);
  }

  ///使用Saf授予指定目录
  static Future<GrantUriState> grantDirectory(Uri directoryUri) async {
    final grantUri = await openDocumentTree(initialUri: directoryUri);

    if (grantUri != null) {
      return grantUri == directoryUri
          ? GrantUriState.success
          : GrantUriState.error;
    }

    return GrantUriState.notSelected;
  }

  ///查看游戏目录内指定的文件是否存在
  static Future<bool> fileExist(String fileName) async {
    final file = await findFile(UriConfig.mainUri, fileName);

    return file != null ? true : false;
  }

  ///读取指定文件内容（需先判断文件是否存在，防止崩溃）
  static Future<String?> readFileContent(Uri fileUri) async {
    final fileContent = await getDocumentContentAsString(fileUri);
    return fileContent;
  }

  ///写入内容到指定文件（需先判断文件是否存在，防止崩溃）
  static Future<bool> writeFileContent(Uri fileUri, String content) async {
    final fileWrite = await writeToFileAsString(fileUri, content: content);
    if (fileWrite != null && fileWrite == true) {
      return true;
    }
    return false;
  }

  ///在游戏目录内创建文件（需先判断文件是否存在，防止多生成几份备份文件）
  static Future<bool> createFile(String fileName, String content) async {
    final fileCreate = await createFileAsString(
      UriConfig.mainUri,
      mimeType: '',
      displayName: fileName,
      content: content,
    );
    return fileCreate != null ? true : false;
  }

  ///删除文件（需先判断文件是否存在，防止崩溃）
  static Future<bool> deleteFile(Uri fileUri) async {
    final fileDelete = await delete(fileUri);
    if (fileDelete != null && fileDelete == true) {
      return true;
    }
    return false;
  }
}
