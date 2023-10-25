class FileConfig {
  /// 超高音质
  static const String tqSuperHigh = 'assets/files/tq_superhigh.ini';

  /// 解锁画质帧率
  static const String dlPq120Fps = 'assets/files/dl_pq120fps.ini';

  /// 快捷修改
  static const List quickFile = [
    'assets/files/kjxg/kjxg_1.ini',
    'assets/files/kjxg/kjxg_2.ini',
    'assets/files/kjxg/kjxg_3.ini',
    'assets/files/kjxg/kjxg_4.ini',
    'assets/files/kjxg/kjxg_5.ini',
    'assets/files/kjxg/kjxg_6.ini'
  ];

  /// 专属修改
  static const List exclusiveFile = [
    'assets/files/zsxg/zsxg_1.ini',
    'assets/files/zsxg/zsxg_2.ini',
    'assets/files/zsxg/zsxg_3.ini',
    'assets/files/zsxg/zsxg_4.ini',
    'assets/files/zsxg/zsxg_5.ini',
    'assets/files/zsxg/zsxg_6.ini',
    'assets/files/zsxg/zsxg_7.ini',
    'assets/files/zsxg/zsxg_8.ini',
    'assets/files/zsxg/zsxg_9.ini',
    'assets/files/zsxg/zsxg_10.ini',
    'assets/files/zsxg/zsxg_11.ini',
    'assets/files/zsxg/zsxg_12.ini'
  ];

  /// 高优化修改
  static const List highoptiFile = [
    'assets/files/gyhxg/gyhxg_1.ini',
    'assets/files/gyhxg/gyhxg_2.ini',
    'assets/files/gyhxg/gyhxg_3.ini',
    'assets/files/gyhxg/gyhxg_4.ini',
    'assets/files/gyhxg/gyhxg_5.ini',
    'assets/files/gyhxg/gyhxg_6.ini',
    'assets/files/gyhxg/gyhxg_7.ini',
    'assets/files/gyhxg/gyhxg_8.ini',
    'assets/files/gyhxg/gyhxg_9.ini',
    'assets/files/gyhxg/gyhxg_10.ini',
    'assets/files/gyhxg/gyhxg_11.ini',
    'assets/files/gyhxg/gyhxg_12.ini'
  ];

  /// 低端机
  static const List lowModelFile = [
    'assets/files/ddj/ddj_1.ini',
    'assets/files/ddj/ddj_2.ini',
    'assets/files/ddj/ddj_3.ini',
    'assets/files/ddj/ddj_4.ini',
    'assets/files/ddj/ddj_5.ini',
    'assets/files/ddj/ddj_6.ini',
    'assets/files/ddj/ddj_7.ini',
    'assets/files/ddj/ddj_8.ini',
    'assets/files/ddj/ddj_9.ini',
    'assets/files/ddj/ddj_10.ini',
    'assets/files/ddj/ddj_11.ini',
    'assets/files/ddj/ddj_12.ini'
  ];

  /// 中端机
  static const List mediumModelFile = [
    'assets/files/zdj/zdj_1.ini',
    'assets/files/zdj/zdj_2.ini',
    'assets/files/zdj/zdj_3.ini',
    'assets/files/zdj/zdj_4.ini',
    'assets/files/zdj/zdj_5.ini',
    'assets/files/zdj/zdj_6.ini',
    'assets/files/zdj/zdj_7.ini',
    'assets/files/zdj/zdj_8.ini',
    'assets/files/zdj/zdj_9.ini',
    'assets/files/zdj/zdj_10.ini',
    'assets/files/zdj/zdj_11.ini'
  ];

  /// 高端机
  static const List highModelFile = [
    'assets/files/gdj/gdj_1.ini',
    'assets/files/gdj/gdj_2.ini',
    'assets/files/gdj/gdj_3.ini',
    'assets/files/gdj/gdj_4.ini',
    'assets/files/gdj/gdj_5.ini',
    'assets/files/gdj/gdj_6.ini',
    'assets/files/gdj/gdj_7.ini',
    'assets/files/gdj/gdj_8.ini',
    'assets/files/gdj/gdj_9.ini',
    'assets/files/gdj/gdj_10.ini'
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
