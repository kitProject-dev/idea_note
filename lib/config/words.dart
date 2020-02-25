class Words {
  static const defaultA = [
    'スピーカー',
    'スマホ',
    '飲み物',
    '食べ物',
    '車',
    '家',
    '掃除機',
    'PC',
    '時計',
    'ロボット',
  ];

  static const defaultB = [
    'IT',
    '遊び',
    '勉強',
    '仕事',
    'インターネット',
    '睡眠',
    '食事',
    '時間',
    '読書',
    '運動',
  ];

  static const templates = <String, List<String>>{
    '建物': [
      '家',
      '図書館',
      '消防署',
      '病院',
      'コンビニ',
      'スーパー',
      '駅',
      '居酒屋',
      'ファミレス',
      '宿',
    ],
    '乗り物': [
      '車',
      'バイク',
      '電車',
      '新幹線',
      '飛行機',
      '船',
      'バス',
      'タクシー',
      '人力車',
      'ヘリコプター',
    ],
    '家電': [
      'テレビ',
      '冷蔵庫',
      '洗濯機',
      '掃除機',
      'エアコン',
      '炊飯器',
      '食洗機',
      '扇風機',
      '電子レンジ',
      'ストーブ',
    ],
    '職業': [
      'エンジニア',
      '販売員',
      '芸能人',
      '営業',
      '医師',
      '社長',
      '教員',
      '農家',
      '漁師',
      'スポーツ選手',
    ],
    '行動': [
      '遊び',
      '勉強',
      '睡眠',
      '食事',
      '読書',
      '運動',
      'デート',
      '喧嘩',
      '映像鑑賞',
      '散歩',
    ],
    '行事': [
      '正月',
      '節分',
      'バレンタインデー/ホワイトデー',
      'エイプリルフール',
      '入社式',
      '卒業式',
      'クリスマス',
      '七夕',
      '夏祭り',
      'ハロウィン',
    ],
  };
}
