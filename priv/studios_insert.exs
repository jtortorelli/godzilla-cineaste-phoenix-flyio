alias CineasteData.{Repo, Studio}

studios = [
  %{slug: "20th-century-fox", display_name: "20th Century Fox", original_name: "20世紀フォックス"},
  %{slug: "abe-shuji", display_name: "Abe Shuji, Inc.", original_name: "阿部秀司事務所"},
  %{
    slug: "adk",
    display_name: "ADK Holdings Inc.",
    original_name: "株式会社ADKホールディングス",
    abbreviation: "ADK"
  },
  %{
    slug: "am-associates",
    display_name: "Am Associates Co., Ltd.",
    original_name: "株式会社アムアソシエイツ"
  },
  %{slug: "amuse", display_name: "AMUSE INC.", original_name: "株式会社アミューズ"},
  %{
    slug: "amuse-soft-entertainment",
    display_name: "Amuse Soft Entertainment, Inc",
    original_name: "アミューズソフトエンタテインメント株式会社"
  },
  %{slug: "arcimboldo", display_name: "Arcimboldo", original_name: "アルチンボルド"},
  %{slug: "asmik-ace", display_name: "ASMIK ACE, INC.", original_name: "アスミック・エース株式会社"},
  %{
    slug: "asahi-broadcasting-corporation",
    display_name: "Asahi Television Broadcasting Corporation",
    original_name: "朝日放送テレビ株式会社",
    abbreviation: "ABC"
  },
  %{slug: "asahi-shimbun", display_name: "The Asahi Shimbun Company", original_name: "株式会社朝日新聞社"},
  %{
    slug: "avex-entertainment",
    display_name: "Avex Entertainment Inc.",
    original_name: "エイベックス・エンタテインメント株式会社"
  },
  %{
    slug: "avex-pictures",
    display_name: "Avex Pictures Inc.",
    original_name: "エイベックス・ピクチャーズ株式会社"
  },
  %{
    slug: "bandai",
    display_name: "BANDAI CO., LTD.",
    original_name: "株式会社バンダイ"
  },
  %{
    slug: "bandai-networks",
    display_name: "BANDAI NETWORKS CO.,LTD.",
    original_name: "バンダイネットワークス株式会社"
  },
  # %{slug: "bandai-visual", display_name: "Bandai Visual"},
  %{slug: "big-shot", display_name: "BIG SHOT INC.", original_name: "株式会社ビッグショット"},
  %{
    slug: "c-i-entertainment",
    display_name: "C&I entertainment Inc.",
    original_name: "C&Iエンタテインメント株式会社"
  },
  %{
    slug: "cbc-television",
    display_name: "CBC TELEVISION CO.,LTD.",
    original_name: "株式会社CBCテレビ",
    abbreviation: "CBC"
  },
  %{slug: "cell", display_name: "CELL"},
  %{
    slug: "chubu-nippon-broadcasting",
    display_name: "Chubu Nippon Broadcasting",
    original_name: "中部日本放送"
  },
  %{
    slug: "chukyo-tv-broadcasting",
    display_name: "CHUKYO TV.BROADCASTING CO., LTD.",
    original_name: "中京テレビ放送株式会社",
    abbreviation: "CHUKYO TV"
  },
  %{
    slug: "chunichi-shimbun",
    display_name: "Chunichi Shimbun Co., Ltd.",
    original_name: "株式会社中日新聞社"
  },
  %{slug: "chuokoron-shinsha", display_name: "CHUOKORON-SHINSHA, INC.", original_name: "中央公論新社"},
  %{slug: "cine-bazar", display_name: "Cine Bazar", original_name: "シネバザール"},
  %{slug: "crossmedia", display_name: "Crossmedia", original_name: "クロスメディア"},
  %{slug: "crowd", display_name: "Crowd", original_name: "クラウド"},
  %{slug: "daichi-shokai", display_name: "DAIICHI SHOKAI Co.,Ltd.", original_name: "株式会社大一商会"},
  %{slug: "daiei", display_name: "Daiei Film Co., Ltd.", original_name: "大映株式会社"},
  %{
    slug: "dainichi",
    display_name: "Dainichi Film Distribution Co., Ltd",
    original_name: "ダイニチ映配株式会社"
  },
  %{slug: "deiz", display_name: "deiz", original_name: "八八粍・デイズ"},
  %{slug: "dentsu", display_name: "DENTSU INC.", original_name: "株式会社電通"},
  %{slug: "disney", display_name: "Disney", original_name: "ディズニー"},
  %{
    slug: "dn-dream-partners",
    display_name: "D.N. Dream Partners",
    original_name: "D.N.ドリームパートナーズ",
    abbreviation: "DNDP"
  },
  %{slug: "dreamkid", display_name: "Dreamkid", original_name: "ドリームキッド"},
  %{slug: "d-rights", display_name: "d-rights Inc.", original_name: "株式会社ディーライツ"},
  %{slug: "earth-start-entertainment", display_name: "Earth Star Entertainment"},
  %{slug: "eisei-gekijo", display_name: "EISEI GEKIJO Co.,Ltd.", original_name: "衛星劇場"},
  %{slug: "electric-ghost", display_name: "Electric Ghost", original_name: "エレクトリック・ゴースト"},
  %{slug: "embodiment-films", display_name: "Embodiment Films", original_name: "エンボディメント・フィルムズ"},
  %{slug: "energy", display_name: "Energy"},
  %{slug: "enterbrain", display_name: "ENTERBRAIN", original_name: "エンターブレイン"},
  %{slug: "e-solutions", display_name: "e-solutions"},
  %{slug: "fields", display_name: "FIELDS CORPORATION", original_name: "フィールズ株式会社"},
  %{slug: "first-pictures", display_name: "First Pictures", original_name: "ファーストピクチャーズ"},
  %{slug: "fujiko-pro", display_name: "Fujiko Productions", original_name: "藤子プロ"},
  %{
    slug: "fuji-television-network",
    display_name: "Fuji Television Network, Inc.",
    original_name: "株式会社フジテレビジョン"
  },
  %{slug: "fujitsu", display_name: "Fujitsu Limited", original_name: "富士通株式会社"},
  %{slug: "fukasaku-group", display_name: "Fukasaku Group", original_name: "深作組"},
  %{
    slug: "fukuoka-broadcasting-system",
    display_name: "Fukuoka Broadcasting System Corporation",
    original_name: "株式会社福岡放送"
  },
  %{slug: "futabasha", display_name: "Futabasha Publishers Ltd.", original_name: "株式会社双葉社"},
  %{
    slug: "gaga-communications",
    display_name: "GAGA communications inc.",
    original_name: "株式会社ギャガ・コミュニケーションズ"
  },
  %{
    slug: "geneon-entertainment",
    display_name: "GENEON ENTERTAINMENT (USA) INC.",
    original_name: "ジェネオンエンターテイメント"
  },
  %{
    slug: "geneon-universal-entertainment",
    display_name: "Geneon Universal Entertainment",
    original_name: "ジェネオン・ユニバーサル・エンターテイメント"
  },
  %{slug: "gentosha", display_name: "GENTOSHA INC.", original_name: "株式会社幻冬舎"},
  %{slug: "geo", display_name: "GEO CORPORATION", original_name: "株式会社ゲオ"},
  %{
    slug: "gyao",
    display_name: "GYAO Corporation.",
    original_name: "株式会社GYAO"
  },
  %{
    slug: "hakuhodo",
    display_name: "HAKUHODO Inc.",
    original_name: "株式会社博報堂"
  },
  %{
    slug: "hakuhodo-dy-media-partners",
    display_name: "Hakuhodo DY Media Partners Inc.",
    original_name: "株式会社博報堂DYメディアパートナーズ"
  },
  %{slug: "hakusensha", display_name: "Hakusensha, Incorporated", original_name: "株式会社白泉社"},
  %{
    slug: "hammers",
    display_name: "HAMMERS INC."
  },
  %{
    slug: "higashi-nippon-broadcasting",
    display_name: "HIGASHI NIPPON BROADCASTING Co.,Ltd.",
    original_name: "株式会社東日本放送",
    abbreviation: "KHB"
  },
  %{slug: "hikari-tv", display_name: "Hikari TV", original_name: "ひかりTV"},
  %{slug: "hint", display_name: "Hint", original_name: "ヒント"},
  %{slug: "hiromi", display_name: "Hiromi"},
  %{
    slug: "hiroshima-home-television",
    display_name: "Hiroshima Home Television Co.,Ltd.",
    original_name: "株式会社広島ホームテレビ"
  },
  %{
    slug: "hiroshima-television-corporation",
    display_name: "Hiroshima Television Corporation",
    original_name: "広島テレビ放送株式会社",
    abbreviation: "HTV"
  },
  %{slug: "his", display_name: "HIS Co., Ltd.", original_name: "株式会社エイチ・アイ・エス"},
  %{slug: "hochi-shimbun", display_name: "THE HOCHI SHIMBUN", original_name: "株式会社報知新聞社"},
  %{
    slug: "hokkaido-broadcasting",
    display_name: "Hokkaido Broadcasting Co.,Ltd.",
    abbreviation: "HBC"
  },
  %{
    slug: "hokkaido-television-broadcasting",
    display_name: "Hokkaido Television Broadcasting",
    abbreviation: "HTB"
  },
  %{
    slug: "horipro",
    display_name: "Horipro Inc.",
    original_name: "株式会社ホリプロ"
  },
  %{
    slug: "hot-toys",
    display_name: "HOT TOYS",
    original_name: "ホットトイズ"
  },
  %{slug: "hulu", display_name: "Hulu"},
  %{slug: "imagica", display_name: "IMAGICA GROUP Inc.", original_name: "株式会社IMAGICA GROUP"},
  %{slug: "inp", display_name: "INP", original_name: "アイ・エヌ・ピー"},
  %{slug: "io", display_name: "Io", original_name: "株式会社イオ"},
  %{
    slug: "ishinomori-productions",
    display_name: "Ishinomori Productions",
    original_name: "石森プロ"
  },
  %{slug: "itochu", display_name: "ITOCHU Corporation", original_name: "伊藤忠商事株式会社"},
  %{slug: "japan-airlines", display_name: "Japan Airlines Co., Ltd.", original_name: "日本航空株式会社"},
  %{slug: "japan-film-fund", display_name: "Japan Film Fund", original_name: "日本映画ファンド"},
  %{slug: "j-dream", display_name: "J dream Inc.", original_name: "株式会社ジェイ・ドリーム"},
  %{
    slug: "jr-east-marketing-and-communications",
    display_name: "JR East Marketing & Communications,Inc.",
    original_name: "株式会社ジェイアール東日本企画"
  },
  %{slug: "j-storm", display_name: "J Storm Inc.", original_name: "株式会社ジェイ・ストーム"},
  %{
    slug: "kadokawa",
    display_name: "KADOKAWA CORPORATION",
    original_name: "株式会社KADOKAWA"
  },
  %{
    slug: "kadokawa-daiei",
    display_name: "Kadokawa Daiei Pictures",
    original_name: "角川大映映画"
  },
  %{
    slug: "kadokawa-haruki-corporation",
    display_name: "Kadokawa Haruki Corporation",
    original_name: "株式会社角川春樹事務所"
  },
  %{
    slug: "kadokawa-herald-pictures",
    display_name: "KADOKAWA HERALD PICTURES",
    original_name: "角川ヘラルド映画"
  },
  %{slug: "kadokawa-pictures", display_name: "KADOKAWA PICTURES,INC.", original_name: "角川映画株式会社"},
  %{
    slug: "kadokawa-shoten",
    display_name: "Kadokawa Shoten Publishing Co., Ltd.",
    original_name: "株式会社角川書店"
  },
  %{
    slug: "kansai-television",
    display_name: "Kansai Television Co. Ltd.",
    original_name: "関西テレビ放送株式会社"
  },
  %{slug: "katsu-productions", display_name: "Katsu Productions", original_name: "勝プロダクション"},
  %{slug: "katsu-promotion", display_name: "Katsu Promotion", original_name: "勝プロモーション"},
  %{slug: "kddi", display_name: "KDDI CORPORATION", original_name: "KDDI株式会社"},
  %{slug: "king-records", display_name: "KING RECORD CO., LTD.", original_name: "キングレコード株式会社"},
  %{
    slug: "kinoshita-group",
    display_name: "Kinoshita Group Co., Ltd.",
    original_name: "株式会社木下グループ"
  },
  %{
    slug: "kiriya-pictures",
    display_name: "KIRIYA PICTURES"
  },
  %{
    slug: "klock-worx",
    display_name: "THE KLOCK WORX Co.,Ltd."
  },
  %{
    slug: "kodansha",
    display_name: "Kodansha Ltd.",
    original_name: "株式会社講談社"
  },
  %{
    slug: "konami-digital-entertainment",
    display_name: "Konami Digital Entertainment Co., Ltd.",
    original_name: "株式会社コナミデジタルエンタテインメント"
  },
  %{
    slug: "konomys-award-union",
    display_name: "Konomys Award Union",
    original_name: "このミス!大賞連合"
  },
  %{
    slug: "kss",
    display_name: "KSS INC."
  },
  %{
    slug: "kurosawa-productions",
    display_name: "Kurosawa Productions",
    original_name: "黒澤プロダクション"
  },
  %{
    slug: "kyushu-asahi-broadcasting",
    display_name: "KYUSHU ASAHI BROADCASTING CO., LTD.",
    original_name: "九州朝日放送株式会社",
    abbreviation: "KBC"
  },
  %{
    slug: "laserdisc",
    display_name: "Laser Disc Co., Ltd.",
    original_name: "レーザーディスク株式会社"
  },
  %{
    slug: "lespros-entertainment",
    display_name: "LesPros entertainment inc.",
    original_name: "株式会社レプロエンタテインメント"
  },
  %{
    slug: "mainichi-broadcasting-system",
    display_name: "MAINICHI BROADCASTING SYSTEM, INC.",
    original_name: "株式会社毎日放送",
    abbreviation: "MBS"
  },
  %{
    slug: "mainichi-newspapers",
    display_name: "The Mainichi Newspapers Co., Ltd.",
    original_name: "株式会社毎日新聞社"
  },
  %{
    slug: "manga-entertainment",
    display_name: "Manga Entertainment, LLC"
  },
  %{
    slug: "media-factory",
    display_name: "MEDIA FACTORY,INC.",
    original_name: "株式会社メディアファクトリー",
    aliases: ["MFピクチャーズ"]
  },
  %{slug: "mediawave", display_name: "MediaWave", original_name: "株式会社メディアウェイブ"},
  %{
    slug: "mifune-productions",
    display_name: "MIFUNE PRODUCTIONS CO., Ltd.",
    original_name: "株式会社三船プロダクション"
  },
  %{slug: "miku", display_name: "Miku", original_name: "三倶"},
  %{slug: "mitsubishi", display_name: "Mitsubishi Corporation", original_name: "三菱商事株式会社"},
  %{slug: "mitsui", display_name: "MITSUI & CO., LTD.", original_name: "三井物産株式会社"},
  %{
    slug: "miyagi-television-broadcasting",
    display_name: "Miyagi Television Broadcasting Co., Ltd.",
    original_name: "株式会社宮城テレビ放送"
  },
  %{
    slug: "nagoya-broadcasting-network",
    display_name: "Nagoya Broadcasting Network Co., Ltd.",
    original_name: "名古屋テレビ放送株式会社",
    abbreviation: "NBN",
    aliases: ["メ〜テレ"]
  },
  %{slug: "napalm-films", display_name: "NAPALMFILMS"},
  %{slug: "nikkei", display_name: "Nikkei Inc.", original_name: "株式会社日本経済新聞社"},
  %{
    slug: "nikksatsu",
    display_name: "NIKKATSU CORPORATION",
    original_name: "日活株式会社"
  },
  %{
    slug: "nippan-group-holdings",
    display_name: "NIPPAN GROUP HOLDINGS, INC.",
    original_name: "日販グループホールディングス株式会社",
    aliases: ["日本出版販売株式会社"]
  },
  %{
    slug: "nippon-herald-films",
    display_name: "NIPPON HERALD FILMS,INC.",
    original_name: "日本ヘラルド映画株式会社"
  },
  %{
    slug: "nippon-television-network",
    display_name: "Nippon Television Network Corporation",
    original_name: "日本テレビ放送網株式会社"
  },
  %{
    slug: "nishinippon-shimbun",
    display_name: "THE NISHINIPPON SHIMBUN CO.,LTD.",
    original_name: "株式会社西日本新聞社"
  },
  %{
    slug: "northern-japan-maritime-affairs",
    display_name: "Northern Japan Maritime Affairs",
    original_name: "北日本海事"
  },
  %{slug: "ntt-learning-systems", display_name: "NTT LEARNING SYSTEMS Co."},
  %{slug: "office-crescendo", display_name: "Office Crescendo", original_name: "オフィスクレッシェンド"},
  %{slug: "ogura", display_name: "Ogura Inc.", original_name: "小椋事務所"},
  %{slug: "ohta-publishing", display_name: "OHTA PUBLISHING COMPANY", original_name: "株式会社 太田出版"},
  %{slug: "olm", display_name: "OLM, Inc.", original_name: "株式会社オー・エル・エム"},
  %{
    slug: "omega-project",
    display_name: "Omega Project Co., Ltd.",
    original_name: "オメガ・プロジェクト株式会社"
  },
  %{
    slug: "omnibus-promotion",
    display_name: "OMNIBUS PROMOTION INC.",
    original_name: "株式会社オムニバスプロモーション"
  },
  %{slug: "optrom", display_name: "Optrom, Inc.", original_name: "株式会社オプトロム"},
  %{slug: "oz", display_name: "Oz", original_name: "オズ"},
  %{
    slug: "panorama-communications",
    display_name: "Panorama Communications",
    original_name: "パノラマ・コミュニケーションズ"
  },
  %{slug: "pioneer", display_name: "Pioneer LDC", original_name: "パイオニアLDC"},
  %{slug: "plex", display_name: "PLEX"},
  %{slug: "pony-canyon", display_name: "PONY CANYON INC.", original_name: "株式会社ポニーキャニオン"},
  %{
    slug: "production-ig",
    display_name: "Production I.G, Inc.",
    original_name: "株式会社プロダクション・アイジー"
  },
  %{
    slug: "progressive-pictures",
    display_name: "Progressive Pictures",
    original_name: "プログレッシブピクチャーズ"
  },
  %{slug: "pyramidfilm", display_name: "Pyramidfilm inc.", original_name: "株式会社ピラミッドフィルム"},
  %{slug: "quaras", display_name: "Quaras Inc.", original_name: "株式会社クオラス"},
  %{slug: "recorded-picture-company", display_name: "Recorded Picture Company"},
  %{
    slug: "rkb-mainichi-broadcasting",
    display_name: "RKB MAINICHI BROADCASTING CORPORATION",
    original_name: "RKB毎日放送株式会社",
    abbreviation: "RKB"
  },
  %{
    slug: "robot-communications",
    display_name: "ROBOT COMMUNICATIONS INC.",
    original_name: "株式会社ロボット"
  },
  %{slug: "ryowa-life-create", display_name: "Ryowa Life Create", original_name: "菱和ライフクリエイト"},
  %{slug: "sankei-shimbun", display_name: "THE SANKEI SHIMBUN", original_name: "産經新聞"},
  %{
    slug: "sapporo-television-broadcasting",
    display_name: "The Sapporo Television Broadcasting Co.,Ltd.",
    original_name: "札幌テレビ放送株式会社",
    abbreviation: "STV"
  },
  %{
    slug: "sedic-international",
    display_name: "SEDIC INTERNATIONAL INC.",
    original_name: "株式会社セディックインターナショナル"
  },
  %{
    slug: "sega",
    display_name: "SEGA CORPORATION",
    original_name: "株式会社セガ",
    aliases: ["セガ・エンタープライゼス"]
  },
  %{
    slug: "shin-ei-animation",
    display_name: "SHIN-EI ANIMATION Co., Ltd.",
    original_name: "シンエイ動画株式会社"
  },
  %{slug: "shirogumi", display_name: "SHIROGUMI INC.", original_name: "株式会社白組"},
  %{
    slug: "shizuoka-asahi-television",
    display_name: "Shizuoka Asahi Television.Co.,Ltd.",
    original_name: "株式会社静岡朝日テレビ",
    abbreviation: "SATV"
  },
  %{
    slug: "shizuoka-daiichi-television",
    display_name: "SHIZUOKA DAIICHI TELEVISION CORPORATION",
    original_name: "株式会社静岡第一テレビ"
  },
  %{slug: "shochiku", display_name: "Shochiku Co.,Ltd.", original_name: "松竹株式会社"},
  %{slug: "shogakukan", display_name: "SHOGAKUKAN Inc.", original_name: "株式会社小学館"},
  %{
    slug: "shogakukan-shueisha-productions",
    display_name: "Shogakukan-Shueisha Productions Co., Ltd.",
    original_name: "株式会社小学館集英社プロダクション"
  },
  %{slug: "shueisha", display_name: "SHUEISHA Inc.", original_name: "株式会社集英社"},
  %{
    slug: "sky-perfect-well-think",
    display_name: "SKY Perfect Well Think, Co. Ltd.",
    original_name: "株式会社スカパー・ウェルシンク"
  },
  %{slug: "skyworks", display_name: "SKYWORKS"},
  %{
    slug: "sony-music-entertainment",
    display_name: "Sony Music Entertainment (Japan) Inc.",
    original_name: "株式会社ソニー・ミュージックエンタテインメント"
  },
  %{slug: "sony-pcl", display_name: "Sony PCL Inc.", original_name: "ソニーピーシーエル株式会社"},
  %{
    slug: "stardust-pictures",
    display_name: "STARDUST PICTURES",
    original_name: "株式会社SDP",
    abbreviation: "SDP"
  },
  %{slug: "studio-3", display_name: "STUDIO 3"},
  %{slug: "studio-ghibli", display_name: "Studio Ghibli Inc.", original_name: "株式会社スタジオジブリ"},
  %{
    slug: "sumitomo-corporation",
    display_name: "Sumitomo Corporation",
    original_name: "住友商事株式会社"
  },
  %{slug: "sunrise", display_name: "SUNRISE", original_name: "サンライズ"},
  %{
    slug: "suplex",
    display_name: "SUPLEX INC."
  },
  %{slug: "takara", display_name: "Takara Co., Ltd.", original_name: "株式会社タカラ"},
  %{slug: "takarazuka", display_name: "Takarazuka Eizo Co. Ltd.", original_name: "宝塚映像株式会社"},
  %{slug: "t-arts", display_name: "T-ARTS Company,Ltd.", original_name: "株式会社タカラトミーアーツ"},
  # %{
  #   slug: "tatsunoko",
  #   display_name: "Tatsunoko Production Co., Ltd.",
  #   original_name: "株式会社タツノコプロ"
  # },
  %{slug: "tbs-radio", display_name: "TBS RADIO,INC.", original_name: "株式会社TBSラジオ"},
  %{
    slug: "tc-entertainment",
    display_name: "TC Entertainment, Inc.",
    original_name: "TCエンタテインメント株式会社"
  },
  %{
    slug: "tms-entertainment",
    display_name: "TMS ENTERTAINMENT CO.,LTD.",
    original_name: "株式会社トムス・エンタテインメント"
  },
  %{slug: "toei", display_name: "TOEI COMPANY,LTD.", original_name: "東映株式会社"},
  %{
    slug: "toei-advertising",
    display_name: "TOEI ADVERTISING,LTD.",
    original_name: "株式会社 東映エージエンシー"
  },
  %{slug: "toei-channel", display_name: "TOEI CHANNEL", original_name: "東映チャンネル"},
  %{slug: "toei-video", display_name: "TOEI VIDEO COMPANY, LTD.", original_name: "東映ビデオ株式会社"},
  %{slug: "tohan", display_name: "TOHAN Corporation", original_name: "株式会社トーハン"},
  # %{slug: "toho", display_name: "TOHO CO., LTD.", original_name: "東宝株式会社"},
  %{
    slug: "tohokushinsha",
    display_name: "TOHOKUSHINSHA FILM CORPORATION",
    original_name: "株式会社東北新社",
    abbreviation: "TFC"
  },
  %{
    slug: "tokuma-shoten",
    display_name: "Tokuma Shoten Publishing Co., Ltd.",
    original_name: "株式会社徳間書店"
  },
  %{
    slug: "tokyo-asa-association",
    display_name: "Tokyo ASA Association",
    original_name: "東京都ASA連合会"
  },
  %{
    slug: "tokyo-broadcasting-system",
    display_name: "TOKYO BROADCASTING SYSTEM TELEVISION, INC.",
    original_name: "株式会社TBSテレビ",
    abbreviation: "TBS"
  },
  %{
    slug: "tokyo-fm",
    display_name: "TOKYO FM Broadcasting Co., Ltd.",
    original_name: "株式会社エフエム東京"
  },
  %{
    slug: "tokyo-movie-shinsha",
    display_name: "Tokyo Movie Shinsha Co., Ltd",
    original_name: "東京ムービー新社"
  },
  %{
    slug: "tokyo-theatres",
    display_name: "Tokyo Theatres Company, Incorporated",
    original_name: "東京テアトル株式会社"
  },
  %{
    slug: "tokyu-recreation",
    display_name: "Tokyu Recreation Co., Ltd.",
    original_name: "株式会社東急レクリエーション"
  },
  %{slug: "tommy-walker", display_name: "TOMMY WALKER Co.", original_name: "株式会社トミーウォーカー"},
  %{
    slug: "tomy",
    display_name: "TOMY COMPANY,LTD.",
    original_name: "株式会社タカラトミー",
    aliases: ["Takara Tomy"]
  },
  %{slug: "topcraft", display_name: "TOPCRAFT", original_name: "株式会社トップクラフト"},
  %{
    slug: "toranoana",
    display_name: "Toranoana Inc.",
    original_name: "株式会社虎の穴",
    aliases: ["コミックとらのあな"]
  },
  %{
    slug: "toshiba-entertainment",
    display_name: "Toshiba Entertainment Corporation",
    original_name: "東芝エンタテインメント株式会社"
  },
  %{slug: "total", display_name: "Total", original_name: "トータル"},
  %{slug: "towani", display_name: "Towani", original_name: "株式会社トワーニ"},
  %{
    slug: "tristone-entertainment",
    display_name: "Tristone Entertainment Inc.",
    original_name: "株式会社トライストーン・エンタテイメント"
  },
  %{
    slug: "tsuburaya",
    display_name: "Tsuburaya Productions Co., Ltd.",
    original_name: "株式会社円谷プロダクション"
  },
  %{slug: "tsutaya-group", display_name: "TSUTAYA Group"},
  %{slug: "tv-asahi", display_name: "TV Asahi Corporation", original_name: "株式会社テレビ朝日"},
  %{slug: "twins-japan", display_name: "TWINS JAPAN Inc.", original_name: "株式会社ツインズジャパン"},
  %{
    slug: "universal-pictures-japan",
    display_name: "Universal Pictures Japan",
    original_name: "ユニバーサル・ピクチャーズ・ジャパン合同会社"
  },
  %{slug: "vap", display_name: "VAP Inc.", original_name: "株式会社バップ"},
  %{slug: "vision-west", display_name: "Vision West", original_name: "ヴィジョンウエスト"},
  %{slug: "warner-bros", display_name: "Warner Bros.", original_name: "ワーナー・ブラザース映画"},
  %{slug: "wevco", display_name: "Wevco"},
  %{slug: "wowow", display_name: "WOWOW INC.", original_name: "株式会社WOWOW"},
  %{slug: "yahoo-japan", display_name: "Yahoo! JAPAN"},
  %{
    slug: "yamanashi-broadcasting-system",
    display_name: "Yamanashi Broadcasting System Inc.",
    original_name: "株式会社山梨放送",
    abbreviation: "YBS"
  },
  %{
    slug: "yamanashi-nichinichi-shimbun",
    display_name: "THE YAMANASHI NICHINICHI SHIMBUN",
    original_name: "山梨日日新聞"
  },
  %{
    slug: "yamato-transport",
    display_name: "YAMATO TRANSPORT CO., LTD.",
    original_name: "ヤマト運輸株式会社"
  },
  %{slug: "yomiuri-shumbun", display_name: "The Yomiuri Shimbun"},
  %{
    slug: "yomiuri-telecasting-corporation",
    display_name: "YOMIURI TELECASTING CORPORATION",
    original_name: "讀賣テレビ放送株式会社",
    abbreviation: "ytv"
  },
  %{slug: "yoshimoto-kogyo", display_name: "Yoshimoto Kogyo Co., Ltd.", original_name: "吉本興業株式会社"}
]

Repo.transaction(fn ->
  studios
  |> Enum.map(&Studio.changeset(%Studio{}, &1))
  |> Enum.each(&Repo.insert!(&1))
end)

# production_committees = [
#   %{
#     slug: "akira-production-committee",
#     display_name: "Akira Production Committee",
#     studios: [
#       "kodansha",
#       "mainichi-broacasting-system",
#       "bandai",
#       "hakuhodo",
#       "toho",
#       "laserdisc",
#       "sumitomo-corporation",
#       "tokyo-movie-shinsha"
#     ]
#   },
#   %{
#     slug: "thirteen-assassins-film-partners",
#     display_name: ~s("Thirteen Assassins" Film Partners),
#     studios: [
#       "tv-asahi",
#       "toho",
#       "sedic-international",
#       "dentsu",
#       "shogakukan",
#       "recorded-picture-company",
#       "asahi-shimbun",
#       "asahi-broadcasting-corporation",
#       "nagoya-broadcasting-network",
#       "kyushu-asahi-broadcasting",
#       "hokkaido-television-broadcasting",
#       "yahoo-japan",
#       "tsutaya-group",
#       "higashi-nippon-broadcasting",
#       "shizuoka-asahi-television",
#       "hiroshima-home-television"
#     ]
#   },
#   %{
#     slug: "20th-century-boys-film-production-committee",
#     display_name: ~s("20th Century Boys" Film Production Committee),
#     studios: [
#       "nippon-television-network",
#       "shogakukan",
#       "toho",
#       "vap",
#       "yomiuri-telecasting-broadcasting",
#       "dentsu",
#       "yomiuri-shimbun",
#       "cine-bazar",
#       "office-crescendo",
#       "d-rights",
#       "sapporo-television-broadcasting",
#       "miyagi-television-broadcasting",
#       "shizuoka-daiichi-tv",
#       "chukyo-tv-broadcasting",
#       "hiroshima-television-corporation",
#       "fukuoka-broadcasting-system"
#     ]
#   }
# ]

# attrs = [
#   %{slug: "13-assassins-2010", production_committee: "thirteen-assassins-film-partners"},
#   %{
#     slug: "20th-century-boys-1-the-beginning-of-the-end-2008",
#     production_committees: "20th-century-boys-film-production-committee"
#   },
#   %{
#     slug: "20th-century-boys-2-the-last-hope-2009",
#     production_committees: "20th-century-boys-film-production-committee"
#   },
#   %{
#     slug: "20th-century-boys-3-redemption",
#     production_committees: "20th-century-boys-film-production-committee"
#   },
#   %{slug: "adventure-of-kigan-castle-1966", studios: ["toho", "mifune-productions"]},
#   %{slug: "adventures-of-zatoichi-1964", studios: ["daiei"]},
#   %{slug: "akira-1988", production_committee: "akira-production-committee"},
#   %{slug: "alive-2003", studios: ["skyworks"]},
#   %{slug: "all-monsters-attack-1969"},
#   %{slug: "all-round-appraiser-q-the-eyes-of-mona-lisa-2014"},
#   %{slug: "always-sunset-on-third-street-2-2007"},
#   %{slug: "always-sunset-on-third-street-2005"},
#   %{slug: "always-sunset-on-third-street-3-2012"},
#   %{slug: "aragami-2003"},
#   %{slug: "assassination-classroom-2015"},
#   %{slug: "assassination-classroom-graduation-2016"},
#   %{slug: "assault-girls-2009"},
#   %{slug: "atragon-1963"},
#   %{slug: "attack-on-titan-2015"},
#   %{slug: "attack-on-titan-end-of-the-world-2015"},
#   %{slug: "avalon-2001"},
#   %{slug: "azumi-2-death-or-love-2005"},
#   %{slug: "azumi-2003"},
#   %{slug: "ballad-2009"},
#   %{slug: "battle-in-outer-space-1959"},
#   %{slug: "battle-royale-2000"},
#   %{slug: "battle-royale-ii-requiem-2003"},
#   %{slug: "bullet-train-1975"},
#   %{slug: "casshern-2004"},
#   %{slug: "castle-in-the-sky-1986"},
#   %{slug: "conflagration-1975"},
#   %{slug: "crossfire-2000"},
#   %{slug: "daigoro-vs-goliath-1972"},
#   %{slug: "daimajin-1966"},
#   %{slug: "daredevil-in-the-castle-1961"},
#   %{slug: "death-note-2006"},
#   %{slug: "death-note-light-up-the-new-world-2016"},
#   %{slug: "death-note-the-last-name-2006"},
#   %{slug: "destroy-all-monsters-1968"},
#   %{slug: "dogora-1964"},
#   %{slug: "dororo-2007"},
#   %{slug: "ebirah-horror-of-the-deep-1966"},
#   %{slug: "eko-eko-azarak-ii-birth-of-the-wizard-1996"},
#   %{slug: "eko-eko-azarak-iii-misa-the-dark-angel-1998"},
#   %{slug: "eko-eko-azarak-wizard-of-darkness-1995"},
#   %{slug: "espy-1974"},
#   %{slug: "eternal-zero-2013"},
#   %{slug: "evil-of-dracula-1974"},
#   %{slug: "fight-zatoichi-fight-1964"},
#   %{slug: "frankenstein-conquers-the-world-1965"},
#   %{slug: "friends-naki-on-monster-island-2011"},
#   %{slug: "fueled-the-man-they-called-pirate-2016"},
#   %{slug: "g-i-samurai-1979"},
#   %{slug: "gamera-2-attack-of-legion-1996"},
#   %{slug: "gamera-3-revenge-of-iris-1999"},
#   %{slug: "gamera-guardian-of-the-universe-1995"},
#   %{slug: "gamera-super-monster-1980"},
#   %{slug: "gamera-the-brave-2006"},
#   %{slug: "gamera-the-giant-monster-1965"},
#   %{slug: "gamera-vs-barugon-1966"},
#   %{slug: "gamera-vs-guiron-1969"},
#   %{slug: "gamera-vs-gyaos-1967"},
#   %{slug: "gamera-vs-jiger-1970"},
#   %{slug: "gamera-vs-viras-1968"},
#   %{slug: "gamera-vs-zigra-1971"},
#   %{slug: "gantz-2011"},
#   %{slug: "gantz-perfect-answer-2011"},
#   %{slug: "gatchaman-2013"},
#   %{slug: "genghis-khan-to-the-ends-of-the-earth-and-sea-2007"},
#   %{slug: "genocide-1968"},
#   %{slug: "ghidorah-the-three-headed-monster-1964"},
#   %{slug: "ghost-in-the-shell-1995"},
#   %{slug: "glorious-team-batista-2008"},
#   %{slug: "gods-left-hand-devils-right-hand-2006"},
#   %{slug: "godzilla-1954"},
#   %{slug: "godzilla-2000-millennium-1999"},
#   %{slug: "godzilla-against-mechagodzilla-2002"},
#   %{slug: "godzilla-final-wars-2004"},
#   %{slug: "godzilla-mothra-and-king-ghidorah-giant-monsters-all-out-attack-2001"},
#   %{slug: "godzilla-raids-again-1955"},
#   %{slug: "godzilla-tokyo-sos-2003"},
#   %{slug: "godzilla-vs-biollante-1989"},
#   %{slug: "godzilla-vs-destoroyah-1995"},
#   %{slug: "godzilla-vs-gigan-1972"},
#   %{slug: "godzilla-vs-hedorah-1971"},
#   %{slug: "godzilla-vs-king-ghidorah-1991"},
#   %{slug: "godzilla-vs-mechagodzilla-1974"},
#   %{slug: "godzilla-vs-mechagodzilla-ii-1993"},
#   %{slug: "godzilla-vs-megaguirus-2000"},
#   %{slug: "godzilla-vs-megalon-1973"},
#   %{slug: "godzilla-vs-mothra-1992"},
#   %{slug: "godzilla-vs-spacegodzilla-1994"},
#   %{slug: "goemon-2009"},
#   %{slug: "goke-body-snatcher-from-hell-1968"},
#   %{slug: "golden-bat-1966"},
#   %{slug: "gorath-1962"},
#   %{slug: "gunhed-1989"},
#   %{slug: "h-man-1958"},
#   %{slug: "hara-kiri-death-of-a-samurai-2011"},
#   %{slug: "hidden-fortress-1958"},
#   %{slug: "hidden-fortress-the-last-princess-2008"},
#   %{slug: "high-and-low-1963"},
#   %{slug: "howls-moving-castle-2004"},
#   %{slug: "human-vapor-1960"},
#   %{slug: "i-am-a-hero-2016"},
#   %{slug: "invasion-of-astro-monster-1965"},
#   %{slug: "invisible-man-1954"},
#   %{slug: "jin-roh-the-wolf-brigade-2000"},
#   %{slug: "juvenile-2000"},
#   %{slug: "k-20-legend-of-the-mask-2008"},
#   %{slug: "kagemusha-1980"},
#   %{slug: "kaiji-2-2011"},
#   %{slug: "kaiji-2009"},
#   %{slug: "kamen-rider-the-first-2005"},
#   %{slug: "kamen-rider-the-next-2007"},
#   %{slug: "kamui-gaiden-2009"},
#   %{slug: "kikis-delivery-service-1989"},
#   %{slug: "king-kong-escapes-1967"},
#   %{slug: "king-kong-vs-godzilla-1962"},
#   %{slug: "l-change-the-world-2008"},
#   %{slug: "lake-of-dracula-1971"},
#   %{slug: "last-war-1961"},
#   %{slug: "latitude-zero-1969"},
#   %{slug: "legend-of-the-eight-samurai-1980"},
#   %{slug: "library-wars-2013"},
#   %{slug: "library-wars-the-last-mission-2015"},
#   %{slug: "living-skeleton-1968"},
#   %{slug: "lorelei-the-witch-of-the-pacific-ocean-2005"},
#   %{slug: "lost-world-of-sinbad-1963"},
#   %{slug: "lovedeath-2007"},
#   %{slug: "lupin-iii-the-castle-of-cagliostro-1979"},
#   %{slug: "lupin-the-3rd-2014"},
#   %{slug: "magic-serpent-1966"},
#   %{slug: "magnitude-7-9-1980"},
#   %{slug: "matango-1963"},
#   %{slug: "mechanical-violator-hakaider-1995"},
#   %{slug: "message-from-space-1978"},
#   %{slug: "moon-over-tao-1997"},
#   %{slug: "mothra-1961"},
#   %{slug: "mothra-vs-godzilla-1964"},
#   %{slug: "mushi-shi-2007"},
#   %{slug: "my-neighbor-totoro-1988"},
#   %{slug: "mysterians-1957"},
#   %{slug: "nausicaa-of-the-valley-of-the-wind-1984"},
#   %{slug: "new-tale-of-zatoichi-1963"},
#   %{slug: "oblivion-island-haruka-and-the-magic-mirror-2009"},
#   %{slug: "one-missed-call-2-2005"},
#   %{slug: "one-missed-call-2003"},
#   %{slug: "one-missed-call-final-2006"},
#   %{slug: "onmyoji-2001"},
#   %{slug: "onmyoji-ii-2003"},
#   %{slug: "orochi-the-eight-headed-dragon-1994"},
#   %{slug: "parasite-eve-1997"},
#   %{slug: "parasyte-part-1-2014"},
#   %{slug: "parasyte-part-2-2015"},
#   %{slug: "patlabor-2-the-movie-1993"},
#   %{slug: "patlabor-the-movie-1989"},
#   %{slug: "platinum-data-2013"},
#   %{slug: "ponyo-2008"},
#   %{slug: "porco-rosso-1992"},
#   %{slug: "princess-blade-2001"},
#   %{slug: "princess-mononoke-1997"},
#   %{slug: "prophecies-of-nostradamus-1974"},
#   %{slug: "rashomon-1950"},
#   %{slug: "rebirth-of-mothra-1996"},
#   %{slug: "rebirth-of-mothra-ii-1997"},
#   %{slug: "rebirth-of-mothra-iii-1998"},
#   %{slug: "red-spectacles-1987"},
#   %{slug: "rescue-wings-2008"},
#   %{slug: "return-of-daimajin-1966"},
#   %{slug: "return-of-godzilla-1984"},
#   %{slug: "returner-2002"},
#   %{slug: "ring-0-birthday-2000"},
#   %{slug: "ring-1998"},
#   %{slug: "ring-2-1999"},
#   %{slug: "rodan-1956"},
#   %{slug: "rurouni-kenshin-2012"},
#   %{slug: "rurouni-kenshin-kyoto-inferno-2014"},
#   %{slug: "rurouni-kenshin-the-legend-ends-2014"},
#   %{slug: "sakuya-slayer-of-demons-2000"},
#   %{slug: "samaritan-zatoichi-1968"},
#   %{slug: "samurai-commando-mission-1549-2005"},
#   %{slug: "samurai-i-musashi-miyamoto-1954"},
#   %{slug: "samurai-ii-duel-at-ichijoji-temple-1955"},
#   %{slug: "samurai-iii-duel-at-ganryu-island-1956"},
#   %{slug: "samurai-reincarnation-1981"},
#   %{slug: "sanjuro-1962"},
#   %{slug: "sayonara-jupiter-1984"},
#   %{slug: "secret-of-the-telegian-1960"},
#   %{slug: "seven-samurai-1954"},
#   %{slug: "shin-godzilla-2016"},
#   %{slug: "shinobi-heart-under-blade-2005"},
#   %{slug: "sinking-of-japan-2006"},
#   %{slug: "sky-crawlers-2008"},
#   %{slug: "sky-high-2003"},
#   %{slug: "son-of-godzilla-1967"},
#   %{slug: "space-amoeba-1970"},
#   %{slug: "space-battleship-yamato-2010"},
#   %{slug: "spiral-1998"},
#   %{slug: "spirited-away-2001"},
#   %{slug: "stand-by-me-doraemon-2014"},
#   %{slug: "stray-dog-kerberos-panzer-cops-1991"},
#   %{slug: "submersion-of-japan-1973"},
#   %{slug: "sword-of-alexander-2007"},
#   %{slug: "tale-of-zatoichi-1962"},
#   %{slug: "tale-of-zatoichi-continues-1962"},
#   %{slug: "talking-head-1992"},
#   %{slug: "terror-of-mechagodzilla-1975"},
#   %{slug: "tetsujin-28-2005"},
#   %{slug: "three-outlaw-samurai-1964"},
#   %{slug: "three-treasures-1959"},
#   %{slug: "throne-of-blood-1957"},
#   %{slug: "tokyo-blackout-1987"},
#   %{slug: "top-secret-murder-in-mind-2016"},
#   %{slug: "triumphant-return-of-general-rouge-2009"},
#   %{slug: "tsubaki-sanjuro-2007"},
#   %{slug: "ultraman-the-next-2004"},
#   %{slug: "vampire-doll-1970"},
#   %{slug: "varan-the-unbelievable-1958"},
#   %{slug: "versus-2000"},
#   %{slug: "war-in-space-1977"},
#   %{slug: "war-of-the-gargantuas-1966"},
#   %{slug: "warning-from-space-1956"},
#   %{slug: "whirlwind-1964"},
#   %{slug: "wind-rises-2013"},
#   %{slug: "wrath-of-daimajin-1966"},
#   %{slug: "x-from-outer-space-1967"},
#   %{slug: "yojimbo-1961"},
#   %{slug: "zatoichi-1989"},
#   %{slug: "zatoichi-and-the-chess-expert-1965"},
#   %{slug: "zatoichi-and-the-chest-of-gold-1964"},
#   %{slug: "zatoichi-and-the-doomed-man-1965"},
#   %{slug: "zatoichi-and-the-fugitives-1968"},
#   %{slug: "zatoichi-at-large-1972"},
#   %{slug: "zatoichi-challenged-1967"},
#   %{slug: "zatoichi-goes-to-the-fire-festival-1970"},
#   %{slug: "zatoichi-in-desperation-1972"},
#   %{slug: "zatoichi-meets-the-one-armed-swordsman-1971"},
#   %{slug: "zatoichi-meets-yojimbo-1970"},
#   %{slug: "zatoichi-on-the-road-1963"},
#   %{slug: "zatoichi-the-fugitive-1963"},
#   %{slug: "zatoichi-the-outlaw-1967"},
#   %{slug: "zatoichis-cane-sword-1967"},
#   %{slug: "zatoichis-conspiracy-1973"},
#   %{slug: "zatoichis-flashing-sword-1964"},
#   %{slug: "zatoichis-pilgrimage-1966"},
#   %{slug: "zatoichis-revenge-1965"},
#   %{slug: "zatoichis-vengeance-1966"},
#   %{slug: "zeiram-1991"},
#   %{slug: "zeiram-2-1994"}
# ]
