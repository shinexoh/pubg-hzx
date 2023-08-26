// 画质修改等文件的配置
class FileConfig {
  /// 超高音质
  static const String tqSuperHigh = 'assets/file/tq_superhigh.ini';

  /// 解锁画质帧率
  static const String dlPq120Fps = 'assets/file/dl_pq120fps.ini';

  /// 快捷修改
  static const List quickFile = [
    'assets/file/kjxg/kjxg_1.ini',
    'assets/file/kjxg/kjxg_2.ini',
    'assets/file/kjxg/kjxg_3.ini',
    'assets/file/kjxg/kjxg_4.ini',
    'assets/file/kjxg/kjxg_5.ini',
    'assets/file/kjxg/kjxg_6.ini'
  ];

  /// 专属修改
  static const List exclusiveFile = [
    'assets/file/zsxg/zsxg_1.ini',
    'assets/file/zsxg/zsxg_2.ini',
    'assets/file/zsxg/zsxg_3.ini',
    'assets/file/zsxg/zsxg_4.ini',
    'assets/file/zsxg/zsxg_5.ini',
    'assets/file/zsxg/zsxg_6.ini',
    'assets/file/zsxg/zsxg_7.ini',
    'assets/file/zsxg/zsxg_8.ini',
    'assets/file/zsxg/zsxg_9.ini',
    'assets/file/zsxg/zsxg_10.ini',
    'assets/file/zsxg/zsxg_11.ini',
    'assets/file/zsxg/zsxg_12.ini'
  ];

  /// 高优化修改
  static const List highoptiFile = [
    'assets/file/gyhxg/gyhxg_1.ini',
    'assets/file/gyhxg/gyhxg_2.ini',
    'assets/file/gyhxg/gyhxg_3.ini',
    'assets/file/gyhxg/gyhxg_4.ini',
    'assets/file/gyhxg/gyhxg_5.ini',
    'assets/file/gyhxg/gyhxg_6.ini',
    'assets/file/gyhxg/gyhxg_7.ini',
    'assets/file/gyhxg/gyhxg_8.ini',
    'assets/file/gyhxg/gyhxg_9.ini',
    'assets/file/gyhxg/gyhxg_10.ini',
    'assets/file/gyhxg/gyhxg_11.ini',
    'assets/file/gyhxg/gyhxg_12.ini'
  ];

  /// 低端机
  static const List lowModelFile = [
    'assets/file/ddj/ddj_1.ini',
    'assets/file/ddj/ddj_2.ini',
    'assets/file/ddj/ddj_3.ini',
    'assets/file/ddj/ddj_4.ini',
    'assets/file/ddj/ddj_5.ini',
    'assets/file/ddj/ddj_6.ini',
    'assets/file/ddj/ddj_7.ini',
    'assets/file/ddj/ddj_8.ini',
    'assets/file/ddj/ddj_9.ini',
    'assets/file/ddj/ddj_10.ini',
    'assets/file/ddj/ddj_11.ini',
    'assets/file/ddj/ddj_12.ini'
  ];

  /// 中端机
  static const List mediumModelFile = [
    'assets/file/zdj/zdj_1.ini',
    'assets/file/zdj/zdj_2.ini',
    'assets/file/zdj/zdj_3.ini',
    'assets/file/zdj/zdj_4.ini',
    'assets/file/zdj/zdj_5.ini',
    'assets/file/zdj/zdj_6.ini',
    'assets/file/zdj/zdj_7.ini',
    'assets/file/zdj/zdj_8.ini',
    'assets/file/zdj/zdj_9.ini',
    'assets/file/zdj/zdj_10.ini',
    'assets/file/zdj/zdj_11.ini'
  ];

  /// 高端机
  static const List highModelFile = [
    'assets/file/gdj/gdj_1.ini',
    'assets/file/gdj/gdj_2.ini',
    'assets/file/gdj/gdj_3.ini',
    'assets/file/gdj/gdj_4.ini',
    'assets/file/gdj/gdj_5.ini',
    'assets/file/gdj/gdj_6.ini',
    'assets/file/gdj/gdj_7.ini',
    'assets/file/gdj/gdj_8.ini',
    'assets/file/gdj/gdj_9.ini',
    'assets/file/gdj/gdj_10.ini'
  ];

  /// 所有画质修改文件集合
  static const List allPqFile = [
    ...quickFile,
    ...exclusiveFile,
    ...highoptiFile,
    ...lowModelFile,
    ...mediumModelFile,
    ...highModelFile
  ];
}
