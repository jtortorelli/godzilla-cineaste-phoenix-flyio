alias CineasteData.{Film, Repo}

original_titles = [
  {"13-assassins-2010",
   %{original: "十三人の刺客", transliteration: "Jūsan'nin No Shikaku", translation: "13 Assassins"}},
  {"20th-century-boys-1-the-beginning-of-the-end-2008",
   %{
     original: "本格科学冒険映画 20世紀少年 第1章 終わりの始まり",
     transliteration:
       "Honkaku Kagaku Bōken Eiga Nijū Seiki Shōnen Dai Ichi-Shō Owari No Hajimari",
     translation:
       "Real Science Adventure Movie 20th Century Boys Chapter 1 The Beginning of the End"
   }},
  {"20th-century-boys-2-the-last-hope-2009",
   %{
     original: "本格科学冒険映画 20世紀少年 第2章 最後の希望",
     transliteration: "Honkaku Kagaku Bōken Eiga Nijū Seiki Shōnen Dai Ni-Shō Saigo No Kibō",
     translation: "Real Science Adventure Movie 20th Century Boys Chapter 2 Last Hope"
   }},
  {"20th-century-boys-3-redemption",
   %{
     original: "本格科学冒険映画 20世紀少年 最終章 ぼくらの旗",
     transliteration: "Honkaku Kagaku Bōken Eiga Nijū Seiki Shōnen Saishū-Shō Boku-ra No Hata",
     translation: "Real Science Adventure Movie 20th Century Boys Final Chapter Our Flag"
   }},
  {"adventure-of-kigan-castle-1966",
   %{
     original: "奇巌城の冒険",
     transliteration: "Kiganjō No Bōken",
     translation: "The Adventure of Strange Rock Castle"
   }},
  {"adventures-of-zatoichi-1964",
   %{
     original: "座頭市関所破り",
     transliteration: "Zatōichi Sekishoyaburi",
     translation: "Zatōichi Checkpoint Breaker"
   }},
  {"akira-1988", %{original: "アキラ", transliteration: "Akira", translation: "Akira"}},
  {"alive-2003", %{original: "ALIVE"}},
  {"all-monsters-attack-1969",
   %{
     original: "ゴジラ・ミニラ・ガバラ オール怪獣大進撃",
     transliteration: "Gojira Minira Gabara Ōru Kaijū Daishingeki",
     translation: "Godzilla Minilla Gabara All Monsters Great Attack"
   }},
  {"all-round-appraiser-q-the-eyes-of-mona-lisa-2014",
   %{
     original: "万能鑑定士Q -モナ・リザの瞳-",
     transliteration: "Hon'nō Kanetei-Shi Q Mona Riza No Hitomi",
     translation: "All-Round Appraiser Q Eyes of Mona Lisa"
   }},
  {"always-sunset-on-third-street-2-2007",
   %{
     original: "ALWAYS 続・三丁目の夕日",
     transliteration: "Always Zoku Sanchōme No Yūhi",
     translation: "Always Continued Sunset on Third Street"
   }},
  {"always-sunset-on-third-street-2005",
   %{
     original: "ALWAYS 三丁目の夕日",
     transliteration: "Always Sanchōme No Yūhi",
     translation: "Always Sunset on Third Street"
   }},
  {"always-sunset-on-third-street-3-2012",
   %{
     original: "ALWAYS 三丁目の夕日'64",
     transliteration: "Always Sanchōme No Yūhi '64",
     translation: "Always Sunset on Third Street '64"
   }},
  {"aragami-2003", %{original: "荒神", transliteration: "Aragami", translation: "Aragami"}},
  {"assassination-classroom-2015",
   %{
     original: "暗殺教室",
     transliteration: "Ansatsu Kyōshitsu",
     translation: "Assassination Classroom"
   }},
  {"assassination-classroom-graduation-2016",
   %{
     original: "暗殺教室〜卒業編〜",
     transliteration: "Ansatsu Kyōshitsu Sotsugyō-hen",
     translation: "Assassination Classroom Graduation"
   }},
  {"assault-girls-2009", %{original: "ASSAULT GIRLS"}},
  {"atragon-1963",
   %{original: "海底軍艦", transliteration: "Kaitei Gunkan", translation: "Undersea Warship"}},
  {"attack-on-titan-2015",
   %{original: "進撃の巨人", transliteration: "Shingeki No Kyojin", translation: "Attack on Titan"}},
  {"attack-on-titan-end-of-the-world-2015",
   %{
     original: "進撃の巨人 エンド オブ ザ ワールド",
     transliteration: "Shingeki No Kyojin Endo Obu Za Wārudo",
     translation: "Attack on Titan End of the World"
   }},
  {"avalon-2001", %{original: "アヴァロン", transliteration: "Avaron", translation: "Avalon"}},
  {"azumi-2-death-or-love-2005",
   %{
     original: "あずみ2 Death or Love",
     transliteration: "Azumi 2 Death or Love",
     translation: "Azumi 2 Death or Love"
   }},
  {"azumi-2003", %{original: "あずみ", transliteration: "Azumi", translation: "Azumi"}},
  {"ballad-2009",
   %{
     original: "BALLAD 名もなき恋のうた",
     transliteration: "Ballad Namonaki Koi No Uta",
     translation: "Ballad Nameless Love Song"
   }},
  {"battle-in-outer-space-1959",
   %{original: "宇宙大戦争", transliteration: "Uchū Daisensō", translation: "Space Great War"}},
  {"battle-royale-2000",
   %{original: "バトル・ロワイアル", transliteration: "Batoru Rowaiaru", translation: "Battle Royale"}},
  {"battle-royale-ii-requiem-2003",
   %{
     original: "バトル・ロワイアルII 【鎮魂歌】",
     transliteration: "Batoru Rowaiaru II Chinkonka",
     translation: "Battle Royale II Requiem"
   }},
  {"bullet-train-1975",
   %{
     original: "新幹線大爆破",
     transliteration: "Shinkansen Daibakuha",
     translation: "Bullet Train Great Explosion"
   }},
  {"casshern-2004", %{original: "CASSHERN"}},
  {"castle-in-the-sky-1986",
   %{
     original: "天空の城ラピュタ",
     transliteration: "Tenkū No Shiro Rapyuta",
     translation: "Castle Laputa in the Sky"
   }},
  {"conflagration-1975",
   %{original: "東京湾炎上", transliteration: "Tōkyō-wan Enjō", translation: "Tokyo Bay Burns"}},
  {"crossfire-2000",
   %{original: "クロスファイア", transliteration: "Kurosufaia", translation: "Crossfire"}},
  {"daigoro-vs-goliath-1972",
   %{
     original: "怪獣大奮戦 ダイゴロウ対ゴリアス",
     transliteration: "Kaijū Daifunsen Daigorō Tai Goriasu",
     translation: "Monster Great Battle Daigoro vs. Goliath"
   }},
  {"daimajin-1966", %{original: "大魔神", transliteration: "Daimajin", translation: "Daimajin"}},
  {"daredevil-in-the-castle-1961",
   %{original: "大坂城物語", transliteration: "Ōsakajō Monogatari", translation: "Osaka Castle Story"}},
  {"death-note-2006",
   %{original: "デスノート", transliteration: "Desu Nōto", translation: "Death Note"}},
  {"death-note-light-up-the-new-world-2016",
   %{
     original: "デスノート Light up the NEW world",
     transliteration: "Desu Nōto Light Up the New World",
     translation: "Death Note Light Up the New World"
   }},
  {"death-note-the-last-name-2006",
   %{
     original: "デスノート the Last name",
     transliteration: "Desu Nōto The Last Name",
     translation: "Death Note The Last Name"
   }},
  {"destroy-all-monsters-1968",
   %{
     original: "怪獣総進撃",
     transliteration: "Kaijū Sōshingeki",
     translation: "Monster All-Out Attack"
   }},
  {"dogora-1964",
   %{
     original: "宇宙大怪獣ドゴラ",
     transliteration: "Uchū Daikaijū Dogora",
     translation: "Space Giant Monster Dogora"
   }},
  {"dororo-2007", %{original: "どろろ", transliteration: "Dororo", translation: "Dororo"}},
  {"ebirah-horror-of-the-deep-1966",
   %{
     original: "ゴジラ・エビラ・モスラ 南海の大決闘",
     transliteration: "Gojira Ebira Mosura Nankai No Daikettō",
     translation: "Godzilla Ebirah Mothra Great Duel in the South Seas"
   }},
  {"eko-eko-azarak-ii-birth-of-the-wizard-1996",
   %{
     original: "エコエコアザラクII -BIRTH OF THE WIZARD-",
     transliteration: "Eko Eko Azaraku II Birth of the Wizard",
     translation: "Eko Eko Azarak II Birth of the Wizard"
   }},
  {"eko-eko-azarak-iii-misa-the-dark-angel-1998",
   %{
     original: "エコエコアザラクIII -MISA THE DARK ANGEL-",
     transliteration: "Eko Eko Azaraku III Misa the Dark Angel",
     translation: "Eko Eko Azarak III Misa the Dark Angel"
   }},
  {"eko-eko-azarak-wizard-of-darkness-1995",
   %{
     original: "エコエコアザラク -WIZARD OF DARKNESS-",
     transliteration: "Eko Eko Azaraku Wizard of Darkness",
     translation: "Eko Eko Azarak Wizard of Darkness"
   }},
  {"espy-1974", %{original: "エスパイ", transliteration: "Esupai", translation: "ESPY"}},
  {"eternal-zero-2013",
   %{original: "永遠の0", transliteration: "Eien No Zero", translation: "Eternal Zero"}},
  {"evil-of-dracula-1974",
   %{original: "血を吸う薔薇", transliteration: "Chiwosuu Bara", translation: "Bloodthirsty Rose"}},
  {"fight-zatoichi-fight-1964",
   %{
     original: "座頭市血笑旅",
     transliteration: "Zatōichi Kesshōtabi",
     translation: "Zatōichi Bloody Journey"
   }},
  {"frankenstein-conquers-the-world-1965",
   %{
     original: "フランケンシュタイン対地底怪獣",
     transliteration: "Furankenshutain Tai Chitei Kaijū",
     translation: "Frankenstein vs. Underground Monster"
   }},
  {"friends-naki-on-monster-island-2011",
   %{
     original: "friends もののけ島のナキ",
     transliteration: "friends Mononoke Shima No Naki",
     translation: "Friends Naki on Monster Island"
   }},
  {"fueled-the-man-they-called-pirate-2016",
   %{
     original: "海賊とよばれた男",
     transliteration: "Kaizoku To Yobareta Otoko",
     translation: "The Man Called Pirate"
   }},
  {"g-i-samurai-1979",
   %{
     original: "戦国自衛隊",
     transliteration: "Sengoku Jieitai",
     translation: "Sengoku Self Defense Force"
   }},
  {"gamera-2-attack-of-legion-1996",
   %{
     original: "ガメラ2 レギオン襲来",
     transliteration: "Gamera 2 Region Shūrai",
     translation: "Gamera 2 Legion Attack"
   }},
  {"gamera-3-revenge-of-iris-1999",
   %{
     original: "ガメラ3 邪神〈イリス〉覚醒",
     transliteration: "Gamera 3 Jashin (Irisu) Kakusei",
     translation: "Gamera 3 Evil God (Iris) Awakening"
   }},
  {"gamera-guardian-of-the-universe-1995",
   %{
     original: "ガメラ 大怪獣空中決戦",
     transliteration: "Gamera Daikaijū Kūchū Kessen",
     translation: "Gamera Giant Monster Aerial Battle"
   }},
  {"gamera-super-monster-1980",
   %{
     original: "宇宙怪獣ガメラ",
     transliteration: "Uchū Kaijū Gamera",
     translation: "Space Monster Gamera"
   }},
  {"gamera-the-brave-2006",
   %{
     original: "小さき勇者たち〜ガメラ〜",
     transliteration: "Chīsaki Yūshatachi ~Gamera~",
     translation: "Small Heroes ~Gamera~"
   }},
  {"gamera-the-giant-monster-1965",
   %{original: "大怪獣ガメラ", transliteration: "Daikaijū Gamera", translation: "Giant Monster Gamera"}},
  {"gamera-vs-barugon-1966",
   %{
     original: "大怪獣決闘 ガメラ対バルゴン",
     transliteration: "Daikaijū Kettō Gamera Tai Barugon",
     translation: "Giant Monster Duel Gamera vs. Barugon"
   }},
  {"gamera-vs-guiron-1969",
   %{
     original: "ガメラ対大悪獣ギロン",
     transliteration: "Gamera Daiwarujū Giron",
     translation: "Gamera vs. Giant Evil Beast Guiron"
   }},
  {"gamera-vs-gyaos-1967",
   %{
     original: "大怪獣空中戦 ガメラ対ギャオス",
     transliteration: "Daikaijū Kūchūsen Gamera Tai Gyaosu",
     translation: "Giant Monsters Aerial Battle Gamera vs. Gyaos"
   }},
  {"gamera-vs-jiger-1970",
   %{
     original: "ガメラ対大魔獣ジャイガー",
     transliteration: "Gamera Tai Daimajū Jaigā",
     translation: "Gamera vs. Giant Demon Beast Jiger"
   }},
  {"gamera-vs-viras-1968",
   %{
     original: "ガメラ対宇宙怪獣バイラス",
     transliteration: "Gamera Tai Uchū Kaijū Bairasu",
     translation: "Gamera vs. Space Monster Viras"
   }},
  {"gamera-vs-zigra-1971",
   %{
     original: "ガメラ対深海怪獣ジグラ",
     transliteration: "Gamera Tai Shinkai Kaijū Jigura",
     translation: "Gamera vs. Deep Sea Monster Zigra"
   }},
  {"gantz-2011", %{original: "GANTZ"}},
  {"gantz-perfect-answer-2011", %{original: "GANTZ PERFECT ANSWER"}},
  {"gatchaman-2013",
   %{original: "ガッチャマン", transliteration: "Gatchaman", translation: "Gatchaman"}},
  {"genghis-khan-to-the-ends-of-the-earth-and-sea-2007",
   %{
     original: "蒼き狼 地果て海尽きるまで",
     transliteration: "Aoki Ōkami Chi Hate Umi Tsukiru Made",
     translation: "Blue Wolf To the Ends of the Earth and Sea"
   }},
  {"genocide-1968",
   %{original: "昆虫大戦争", transliteration: "Konchū Daisensō", translation: "Insect Great War"}},
  {"ghidorah-the-three-headed-monster-1964",
   %{
     original: "三大怪獣 地球最大の決戦",
     transliteration: "San Daikaijū Chikyū Saidai No Kessen",
     translation: "Three Giant Monsters"
   }},
  {"ghost-in-the-shell-1995",
   %{
     original: "GHOST IN THE SHELL / 攻殻機動隊",
     transliteration: "Ghost in the Shell / Kōkaku Kidōtai",
     translation: "Shell Squad"
   }},
  {"glorious-team-batista-2008",
   %{
     original: "チーム・バチスタの栄光",
     transliteration: "Chīmu Bachisuta No Eikō",
     translation: "Glory of Team Batista"
   }},
  {"gods-left-hand-devils-right-hand-2006",
   %{
     original: "神の左手悪魔の右手",
     transliteration: "Kami No Hidarite Akuma No Migite",
     translation: "God's Left Hand Devil's Right Hand"
   }},
  {"godzilla-1954", %{original: "ゴジラ", transliteration: "Gojira", translation: "Godzilla"}},
  {"godzilla-2000-millennium-1999",
   %{
     original: "ゴジラ2000 ミレニアム",
     transliteration: "Gojira Ni-sen Mireniamu",
     translation: "Godzilla 2000 Millennium"
   }},
  {"godzilla-against-mechagodzilla-2002",
   %{
     original: "ゴジラ×メカゴジラ",
     transliteration: "Gojira × Mekagojira",
     translation: "Godzilla × Mechagodzilla"
   }},
  {"godzilla-final-wars-2004",
   %{
     original: "ゴジラ FINAL WARS",
     transliteration: "Gojira Final Wars",
     translation: "Godzilla Final Wars"
   }},
  {"godzilla-mothra-and-king-ghidorah-giant-monsters-all-out-attack-2001",
   %{
     original: "ゴジラ・モスラ・キングギドラ 大怪獣総攻撃",
     transliteration: "Gojira Mosura Kingugidora Daikaijū Sōkōgeki",
     translation: "Godzilla Mothra King Ghidorah Giant Monsters All-Out Attack"
   }},
  {"godzilla-raids-again-1955",
   %{
     original: "ゴジラの逆襲",
     transliteration: "Gojira No Gyakushū",
     translation: "Godzilla Strikes Back"
   }},
  {"godzilla-tokyo-sos-2003",
   %{
     original: "ゴジラ×モスラ×メカゴジラ 東京SOS",
     transliteration: "Gojira × Mosura × Mekagojira Tōkyō SOS",
     translation: "Godzilla × Mothra × Mechagodzilla Tokyo SOS"
   }},
  {"godzilla-vs-biollante-1989",
   %{
     original: "ゴジラvsビオランテ",
     transliteration: "Gojira vs Biorante",
     translation: "Godzilla vs Biollante"
   }},
  {"godzilla-vs-destoroyah-1995",
   %{
     original: "ゴジラvsデストロイア",
     transliteration: "Gojira vs Desutoroia",
     translation: "Godzilla vs Destoroyah"
   }},
  {"godzilla-vs-gigan-1972",
   %{
     original: "地球攻撃命令 ゴジラ対ガイガン",
     transliteration: "Chikyū Kōgeki Meirei Gojira Tai Gaigan",
     translation: "Earth Attack Order Godzilla vs. Gigan"
   }},
  {"godzilla-vs-hedorah-1971",
   %{
     original: "ゴジラ対ヘドラ",
     transliteration: "Gojira Tai Hedora",
     translation: "Godzilla vs. Hedorah"
   }},
  {"godzilla-vs-king-ghidorah-1991",
   %{
     original: "ゴジラvsキングギドラ",
     transliteration: "Gojira vs Kingugidora",
     translation: "Godzilla vs King Ghidorah"
   }},
  {"godzilla-vs-mechagodzilla-1974",
   %{
     original: "ゴジラ対メカゴジラ",
     transliteration: "Gojira Tai Mekagojira",
     translation: "Godzilla vs. Mechagodzilla"
   }},
  {"godzilla-vs-mechagodzilla-ii-1993",
   %{
     original: "ゴジラvsメカゴジラ",
     transliteration: "Gojira vs Mekagojira",
     translation: "Godzilla vs Mechagodzilla"
   }},
  {"godzilla-vs-megaguirus-2000",
   %{
     original: "ゴジラ×メガギラス G消滅作戦",
     transliteration: "Gojira × Megagirasu G Shōmetsu Sakusen",
     translation: "Godzilla × Megaguirus G Annihilation Operation"
   }},
  {"godzilla-vs-megalon-1973",
   %{
     original: "ゴジラ対メガロ",
     transliteration: "Gojira Tai Megaro",
     translation: "Godzilla vs. Megalon"
   }},
  {"godzilla-vs-mothra-1992",
   %{original: "ゴジラvsモスラ", transliteration: "Gojira vs Mosura", translation: "Godzilla vs Mothra"}},
  {"godzilla-vs-spacegodzilla-1994",
   %{
     original: "ゴジラvsスペースゴジラ",
     transliteration: "Gojira vs Supēsugojira",
     translation: "Godzilla vs SpaceGodzilla"
   }},
  {"goemon-2009", %{original: "GOEMON"}},
  {"goke-body-snatcher-from-hell-1968",
   %{
     original: "吸血鬼ゴケミドロ",
     transliteration: "Kyūketsuki Gokemidoro",
     translation: "Vampire Gokemidoro"
   }},
  {"golden-bat-1966",
   %{original: "黄金バット", transliteration: "Ōgon Batto", translation: "Golden Bat"}},
  {"gorath-1962",
   %{original: "妖星ゴラス", transliteration: "Yōsei Gorasu", translation: "Mystery Planet Gorath"}},
  {"gunhed-1989", %{original: "ガンヘッド", transliteration: "Ganheddo", translation: "Gunhed"}},
  {"h-man-1958",
   %{
     original: "美女と液体人間",
     transliteration: "Bijo To Ekitainingen",
     translation: "Beauty and Liquid Man"
   }},
  {"hara-kiri-death-of-a-samurai-2011",
   %{original: "一命", transliteration: "Ichimei", translation: "One Life"}},
  {"hidden-fortress-1958",
   %{
     original: "隠し砦の三悪人",
     transliteration: "Kakushi Toride No San Akunin",
     translation: "Three Villains of the Hidden Fortress"
   }},
  {"hidden-fortress-the-last-princess-2008",
   %{
     original: "隠し砦の三悪人 THE LAST PRINCESS",
     transliteration: "Kakushi Toride No San Akunin The Last Princess",
     translation: "Three Villains of the Hidden Fortress The Last Princess"
   }},
  {"high-and-low-1963",
   %{original: "天国と地獄", transliteration: "Tengoku to Jigoku", translation: "Heaven and Hell"}},
  {"howls-moving-castle-2004",
   %{
     original: "ハウルの動く城",
     transliteration: "Hauru No Ugokushiro",
     translation: "Howl's Moving Castle"
   }},
  {"human-vapor-1960",
   %{
     original: "ガス人間㐧1号",
     transliteration: "Gasu Ningen Dai Ichi-gō",
     translation: "Gas Man No. 1"
   }},
  {"i-am-a-hero-2016",
   %{original: "アイアムアヒーロー", transliteration: "Ai Amu A Hīrō", translation: "I Am A Hero"}},
  {"invasion-of-astro-monster-1965",
   %{original: "怪獣大戦争", transliteration: "Kaijū Daisensō", translation: "Monster Great War"}},
  {"invisible-man-1954",
   %{original: "透明人間", transliteration: "Tōmei Ningen", translation: "Invisible Man"}},
  {"jin-roh-the-wolf-brigade-2000",
   %{original: "人狼 JIN-ROH", transliteration: "Jinrō Jin-Roh", translation: "Werewolf Jin-Roh"}},
  {"juvenile-2000", %{original: "ジュブナイル", transliteration: "Jubunairu", translation: "Juvenile"}},
  {"k-20-legend-of-the-mask-2008",
   %{
     original: "K-20 怪人二十面相・伝",
     transliteration: "K-20 Kaijin Nijūmensō Den",
     translation: "K-20 Fiend with Twenty Faces"
   }},
  {"kagemusha-1980",
   %{original: "影武者", transliteration: "Kagemusha", translation: "Shadow Warrior"}},
  {"kaiji-2-2011",
   %{
     original: "カイジ2 人生奪回ゲーム",
     transliteration: "Kaiji 2 Jinsei Dakkai Gēmu",
     translation: "Kaiji 2 Take Back Life Game"
   }},
  {"kaiji-2009",
   %{
     original: "カイジ 人生逆転ゲーム",
     transliteration: "Kaiju Jinsei Gyakuten Gēmu",
     translation: "Kaiji Change Life Game"
   }},
  {"kamen-rider-the-first-2005",
   %{
     original: "仮面ライダー THE FIRST",
     transliteration: "Kamen Raidā The First",
     translation: "Masked Rider The First"
   }},
  {"kamen-rider-the-next-2007",
   %{
     original: "仮面ライダー THE NEXT",
     transliteration: "Kamen Raidā The Next",
     translation: "Masked Rider The Next"
   }},
  {"kamui-gaiden-2009",
   %{original: "カムイ外伝", transliteration: "Kamui Gaiden", translation: "Kamui Gaiden"}},
  {"kikis-delivery-service-1989",
   %{
     original: "魔女の宅急便",
     transliteration: "Majo No Takkyūbin",
     translation: "Witch's Express Home Delivery"
   }},
  {"king-kong-escapes-1967",
   %{
     original: "キングコングの逆襲",
     transliteration: "Kingukongu No Gyakushū",
     translation: "King Kong Strikes Back"
   }},
  {"king-kong-vs-godzilla-1962",
   %{
     original: "キングコング対ゴジラ",
     transliteration: "Kingukongu Tai Gojira",
     translation: "King Kong vs. Godzilla"
   }},
  {"l-change-the-world-2008", %{original: "L change the WorLd"}},
  {"lake-of-dracula-1971",
   %{
     original: "呪いの館 血を吸う眼",
     transliteration: "Noroi No Yakata Chiwosu Me",
     translation: "Cursed Mansion Bloodthirsty Eyes"
   }},
  {"last-war-1961",
   %{original: "世界大戦争", transliteration: "Sekai Daisensō", translation: "World Great War"}},
  {"latitude-zero-1969",
   %{
     original: "緯度0大作戦",
     transliteration: "Ido Zero Daisakusen",
     translation: "Latitude 0 Great Operation"
   }},
  {"legend-of-the-eight-samurai-1980",
   %{
     original: "里見八犬伝",
     transliteration: "Satomi Hakkenden",
     translation: "Satomi's Eight Dog Warriors"
   }},
  {"library-wars-2013",
   %{original: "図書館戦争", transliteration: "Toshokan Sensō", translation: "Library War"}},
  {"library-wars-the-last-mission-2015",
   %{
     original: "図書館戦争-THE LAST MISSION-",
     transliteration: "Toshokan Sensō The Last Mission",
     translation: "Library War The Last Mission"
   }},
  {"living-skeleton-1968",
   %{original: "吸血髑髏船", transliteration: "Kyūketsu Dokurosen", translation: "Blood Skeleton Ship"}},
  {"lorelei-the-witch-of-the-pacific-ocean-2005",
   %{original: "ローレライ", transliteration: "Rōrerai", translation: "Lorelei"}},
  {"lost-world-of-sinbad-1963",
   %{original: "大盗賊", transliteration: "Daitōzoku", translation: "Great Bandit"}},
  {"lovedeath-2007",
   %{
     original: "LOVEDEATH ラブデス",
     transliteration: "Lovedeath Rabudesu",
     translation: "Lovedeath Lovedeath"
   }},
  {"lupin-iii-the-castle-of-cagliostro-1979",
   %{
     original: "ルパン三世 カリオストロの城",
     transliteration: "Rupan Sansei Kariosutoro No Shiro",
     translation: "Lupin III Castle of Cagliostro"
   }},
  {"lupin-the-3rd-2014",
   %{original: "ルパン三世", transliteration: "Rupan Sansei", translation: "Lupin III"}},
  {"magic-serpent-1966",
   %{
     original: "怪竜大決戦",
     transliteration: "Kairyū Daikessen",
     translation: "Strange Dragon Great Decisive Battle"
   }},
  {"magnitude-7-9-1980",
   %{original: "地震列島", transliteration: "Jishin Rettō", translation: "Earthquake Archipelago"}},
  {"matango-1963", %{original: "マタンゴ", transliteration: "Matango", translation: "Matango"}},
  {"mechanical-violator-hakaider-1995",
   %{
     original: "人造人間ハカイダー",
     transliteration: "Jinzō Ningen Hakaidā",
     translation: "Artificial Human Hakaider"
   }},
  {"message-from-space-1978",
   %{
     original: "宇宙からのメッセージ",
     transliteration: "Uchū Kara No Messēji",
     translation: "Message from Space"
   }},
  {"moon-over-tao-1997",
   %{original: "タオの月", transliteration: "Tao no Tsuki", translation: "Tao Moon"}},
  {"mothra-1961", %{original: "モスラ", transliteration: "Mosura", translation: "Mothra"}},
  {"mothra-vs-godzilla-1964",
   %{
     original: "モスラ対ゴジラ",
     transliteration: "Mosura Tai Gojira",
     translation: "Mothra vs. Godzilla"
   }},
  {"mushi-shi-2007", %{original: "蟲師", transliteration: "Mushi-shi", translation: "Mushi-shi"}},
  {"my-neighbor-totoro-1988",
   %{original: "となりのトトロ", transliteration: "Tonari No Totoro", translation: "My Neighbor Totoro"}},
  {"mysterians-1957",
   %{original: "地球防衛軍", transliteration: "Chikyū Bōeigun", translation: "Earth Defense Force"}},
  {"nausicaa-of-the-valley-of-the-wind-1984",
   %{
     original: "風の谷のナウシカ",
     transliteration: "Kaze No Tani No Naushika",
     translation: "Nausicaä of the Valley of the Wind"
   }},
  {"new-tale-of-zatoichi-1963",
   %{
     original: "新・座頭市物語",
     transliteration: "Shin Zatōichi Monogatari",
     translation: "New Zatōichi Story"
   }},
  {"oblivion-island-haruka-and-the-magic-mirror-2009",
   %{
     original: "ホッタラケの島 〜遥と魔法の鏡〜",
     transliteration: "Hottarake No Shima ~Haruka To Mahō No Kagami~",
     translation: "Hottarake Island ~Haruka and the Magic Mirror~"
   }},
  {"one-missed-call-2-2005",
   %{original: "着信アリ2", transliteration: "Chakushin Ari 2", translation: "Incoming Call 2"}},
  {"one-missed-call-2003",
   %{original: "着信アリ", transliteration: "Chakushin Ari", translation: "Incoming Call"}},
  {"one-missed-call-final-2006",
   %{
     original: "着信アリFinal",
     transliteration: "Chakushin Ari Final",
     translation: "Incoming Call Final"
   }},
  {"onmyoji-2001",
   %{original: "陰陽師", transliteration: "Onmyōji", translation: "Ying Yang Master"}},
  {"onmyoji-ii-2003",
   %{original: "陰陽師II", transliteration: "Onmyōji II", translation: "Ying Yang Master II"}},
  {"orochi-the-eight-headed-dragon-1994",
   %{original: "ヤマトタケル", transliteration: "Yamato Takeru", translation: "Yamato Takeru"}},
  {"parasite-eve-1997",
   %{original: "パラサイト・イヴ", transliteration: "Parasaito Ibu", translation: "Parasite Eve"}},
  {"parasyte-part-1-2014",
   %{original: "寄生獣", transliteration: "Kiseijū", translation: "Parasite"}},
  {"parasyte-part-2-2015",
   %{
     original: "寄生獣 完結編",
     transliteration: "Kiseijū Kanketsu-hen",
     translation: "Parasite Final Chapter"
   }},
  {"patlabor-2-the-movie-1993",
   %{
     original: "機動警察パトレイバー 2 the Movie",
     transliteration: "Kidō Keisatsu Patoreibā 2 The Movie",
     translation: "Mobile Police Patlabor 2 The Movie"
   }},
  {"patlabor-the-movie-1989",
   %{
     original: "機動警察パトレイバー the Movie",
     transliteration: "Kidō Keisatsu Patoreibā The Movie",
     translation: "Mobile Police Patlabor The Movie"
   }},
  {"platinum-data-2013",
   %{original: "プラチナデータ", transliteration: "Purachina Dēta", translation: "Platinum Data"}},
  {"ponyo-2008",
   %{
     original: "崖の上のポニョ",
     transliteration: "Gake No Ue No Ponyo",
     translation: "Ponyo on the Cliff"
   }},
  {"porco-rosso-1992",
   %{original: "紅の豚", transliteration: "Kurenai No Buta", translation: "Crimson Pig"}},
  {"princess-blade-2001",
   %{original: "修羅雪姫", transliteration: "Shūra Yukihime", translation: "Lady Snowblood"}},
  {"princess-mononoke-1997",
   %{original: "もののけ姫", transliteration: "Mononoke Hime", translation: "Princess Mononoke"}},
  {"prophecies-of-nostradamus-1974",
   %{
     original: "ノストラダムスの大予言",
     transliteration: "Nosutoradamusu No Daiyogen",
     translation: "Great Prophecy of Nostradamus"
   }},
  {"rashomon-1950", %{original: "羅生門", transliteration: "Rashōmon", translation: "Rashōmon"}},
  {"rebirth-of-mothra-1996",
   %{original: "モスラ", transliteration: "Mosura", translation: "Mothra"}},
  {"rebirth-of-mothra-ii-1997",
   %{
     original: "モスラ2 海底の大決戦",
     transliteration: "Mosura 2 Kaitei No Daisakusen",
     translation: "Mothra 2 Undersea Battle"
   }},
  {"rebirth-of-mothra-iii-1998",
   %{
     original: "モスラ3 キングギドラ来襲",
     transliteration: "Mosura 3 Kingugidora Raishū",
     translation: "Mothra 3 King Ghidorah Invades"
   }},
  {"red-spectacles-1987",
   %{
     original: "紅い眼鏡/The Red Spectacles",
     transliteration: "Akai Megane / The Red Spectacles",
     translation: "Red Glasses / The Red Spectacles"
   }},
  {"rescue-wings-2008",
   %{
     original: "空へ-救いの翼 RESCUE WINGS-",
     transliteration: "Sora e -Sukui No Tsubasa Rescue Wings-",
     translation: "To the Sky -Rescue Wings-"
   }},
  {"return-of-daimajin-1966",
   %{original: "大魔神怒る", transliteration: "Daimajin Okoru", translation: "Daimajin Grows Angry"}},
  {"return-of-godzilla-1984",
   %{original: "ゴジラ", transliteration: "Gojira", translation: "Godzilla"}},
  {"returner-2002", %{original: "リターナー", transliteration: "Ritānā", translation: "Returner"}},
  {"ring-0-birthday-2000",
   %{
     original: "リング0 バースデイ",
     transliteration: "Ringu Zero Bāsudei",
     translation: "Ring 0 Birthday"
   }},
  {"ring-1998", %{original: "リング", transliteration: "Ringu", translation: "Ring"}},
  {"ring-2-1999", %{original: "リング2", transliteration: "Ringu 2", translation: "Ring 2"}},
  {"rodan-1956",
   %{
     original: "空の大怪獣 ラドン",
     transliteration: "Sora No Daikaijū Radon",
     translation: "Giant Sky Monster Rodan"
   }},
  {"rurouni-kenshin-2012",
   %{original: "るろうに剣心", transliteration: "Rurōni Kenshin", translation: "Rurouni Kenshin"}},
  {"rurouni-kenshin-kyoto-inferno-2014",
   %{
     original: "るろうに剣心 京都大火編",
     transliteration: "Rurōni Kenshin Kyōto Taika-hen",
     translation: "Rurouni Kenshin Great Fire of Kyoto"
   }},
  {"rurouni-kenshin-the-legend-ends-2014",
   %{
     original: "るろうに剣心 伝説の最期編",
     transliteration: "Rurōni Kenshin Densetsu No Saigo-hen",
     translation: "Rurouni Kenshin The End of the Legend"
   }},
  {"sakuya-slayer-of-demons-2000",
   %{original: "さくや妖怪伝", transliteration: "Sakuya Yōkai-den", translation: "Sakuya Yokai Legend"}},
  {"samaritan-zatoichi-1968",
   %{
     original: "座頭市喧嘩太鼓",
     transliteration: "Zatōichi Kenkadaiko",
     translation: "Zatōichi Fighting Drum"
   }},
  {"samurai-commando-mission-1549-2005",
   %{
     original: "戦国自衛隊1549",
     transliteration: "Sengoku Jieitai 1549",
     translation: "Sengoku Self Defense Force 1549"
   }},
  {"samurai-i-musashi-miyamoto-1954",
   %{original: "宮本武蔵", transliteration: "Miyamoto Musashi", translation: "Miyamoto Musashi"}},
  {"samurai-ii-duel-at-ichijoji-temple-1955",
   %{
     original: "續宮本武蔵 一乘寺の決斗",
     transliteration: "Zoku Miyamoto Musashi Ichijōji No Kettō",
     translation: "Continued Miyamoto Musashi Duel at Ichijoji"
   }},
  {"samurai-iii-duel-at-ganryu-island-1956",
   %{
     original: "宮本武蔵 完結篇 決闘巌流島",
     transliteration: "Miyamoto Musashi Kanketsu-hen Kettō Ganryū-jima",
     translation: "Miyamoto Musashi Final Chapter Duel Ganryu Island"
   }},
  {"samurai-reincarnation-1981",
   %{original: "魔界転生", transliteration: "Makai Tenshō", translation: "Demon World Incarnation"}},
  {"sanjuro-1962",
   %{original: "椿三十郎", transliteration: "Tsubaki Sanjūrō", translation: "Tsubaki Sanjuro"}},
  {"sayonara-jupiter-1984",
   %{original: "さよならジュピター", transliteration: "Sayonara Jupitā", translation: "Goodbye Jupiter"}},
  {"secret-of-the-telegian-1960",
   %{original: "電送人間", transliteration: "Densō Ningen", translation: "Transmitted Man"}},
  {"seven-samurai-1954",
   %{original: "七人の侍", transliteration: "Shichinin No Samurai", translation: "Seven Samurai"}},
  {"shin-godzilla-2016",
   %{original: "シン・ゴジラ", transliteration: "Shin Gojira", translation: "Shin Godzilla"}},
  {"shinobi-heart-under-blade-2005", %{original: "SHINOBI-HEART UNDER BLADE-"}},
  {"sinking-of-japan-2006",
   %{original: "日本沈没", transliteration: "Nihon Chinbotsu", translation: "Japan Sinks"}},
  {"sky-crawlers-2008",
   %{
     original: "スカイ・クロラ The Sky Crawlers",
     transliteration: "Sukai Kurora The Sky Crawlers",
     translation: "Sky Crawler The Sky Crawlers"
   }},
  {"sky-high-2003",
   %{
     original: "スカイハイ 劇場版",
     transliteration: "Sukaihai Gekijō-ban",
     translation: "Sky High the Movie"
   }},
  {"son-of-godzilla-1967",
   %{
     original: "怪獣島の決戦 ゴジラの息子",
     transliteration: "Kaijū-to No Kessen Gojira No Musuko",
     translation: "Decisive Battle on Monster Island Son of Godzilla"
   }},
  {"space-amoeba-1970",
   %{
     original: "ゲゾラ・ガニメ・カメーバ 決戦！ 南海の大怪獣",
     transliteration: "Gezora Ganime Kamēba Kessen! Nankai No Daikaijū",
     translation: "Gezora Ganime Kamoebas Decisive Battle! Giant Monsters of the South Seas"
   }},
  {"space-battleship-yamato-2010",
   %{
     original: "SPACE BATTLESHIP ヤマト",
     transliteration: "Space Battleship Yamato",
     translation: "Space Battleship Yamato"
   }},
  {"spiral-1998", %{original: "らせん", transliteration: "Rasen", translation: "Spiral"}},
  {"spirited-away-2001",
   %{
     original: "千と千尋の神隠し",
     transliteration: "Sen To Chihiro No Kamikakushi",
     translation: "Sen and Chihiro's Mysterious Disappearance"
   }},
  {"stand-by-me-doraemon-2014",
   %{
     original: "STAND BY ME ドラえもん",
     transliteration: "Stand By Me Doraemon",
     translation: "Stand By Me Doraemon"
   }},
  {"stray-dog-kerberos-panzer-cops-1991",
   %{
     original: "ケルベロス-地獄の番犬",
     transliteration: "Keruberosu -Jigoku No Banken-",
     translation: "Kerberos -Hell's Watchdog-"
   }},
  {"submersion-of-japan-1973",
   %{original: "日本沈没", transliteration: "Nihon Chinbotsu", translation: "Japan Sinks"}},
  {"sword-of-alexander-2007",
   %{
     original: "大帝の剣",
     transliteration: "Taitei No Ken",
     translation: "Sword of the Great Emperor"
   }},
  {"tale-of-zatoichi-1962",
   %{original: "座頭市物語", transliteration: "Zatōichi Monogatari", translation: "Zatōichi Story"}},
  {"tale-of-zatoichi-continues-1962",
   %{
     original: "続・座頭市物語",
     transliteration: "Zoku Zatōichi Monogatari",
     translation: "Continued Zatōichi Story"
   }},
  {"talking-head-1992",
   %{original: "トーキング・ヘッド", transliteration: "Tōkingu Heddo", translation: "Talking Head"}},
  {"terror-of-mechagodzilla-1975",
   %{
     original: "メカゴジラの逆襲",
     transliteration: "Mekagojira No Gyakushū",
     translation: "Mechagodzilla Strikes Back"
   }},
  {"tetsujin-28-2005",
   %{original: "鉄人28号", transliteration: "Tetsujin 28-gō", translation: "Tetsujin 28"}},
  {"three-outlaw-samurai-1964",
   %{original: "三匹の侍", transliteration: "Sanbiki No Samurai", translation: "Three Samurai"}},
  {"three-treasures-1959",
   %{original: "日本誕生", transliteration: "Nihon Tanjō", translation: "Birth of Japan"}},
  {"throne-of-blood-1957",
   %{original: "蜘蛛巣城", transliteration: "Kumonosu-jō", translation: "Spider Web Castle"}},
  {"tokyo-blackout-1987",
   %{
     original: "首都消失",
     transliteration: "Shuto Shōshitsu",
     translation: "Disappearance of the Capital"
   }},
  {"top-secret-murder-in-mind-2016",
   %{
     original: "秘密 THE TOP SECRET",
     transliteration: "Himitsu The Top Secret",
     translation: "Secret The Top Secret"
   }},
  {"triumphant-return-of-general-rouge-2009",
   %{
     original: "ジェネラル・ルージュの凱旋",
     transliteration: "Jeneraru Rūju No Gaisen",
     translation: "Triumph of General Rouge"
   }},
  {"tsubaki-sanjuro-2007",
   %{original: "椿三十郎", transliteration: "Tsubaki Sanjūrō", translation: "Tsubaki Sanjuro"}},
  {"ultraman-the-next-2004", %{original: "ULTRAMAN"}},
  {"vampire-doll-1970",
   %{
     original: "幽霊屋敷の恐怖 血を吸う人形",
     transliteration: "Yūrei Yashiki No Kyōfu Chiwosuu Ningyō",
     translation: "Horror of the Haunted House Bloodthirsty Doll"
   }},
  {"varan-the-unbelievable-1958",
   %{original: "大怪獣バラン", transliteration: "Daikaijū Baran", translation: "Giant Monster Varan"}},
  {"versus-2000", %{original: "VERSUS"}},
  {"war-in-space-1977",
   %{original: "惑星大戦争", transliteration: "Wakusei Daisensō", translation: "Great Planetary War"}},
  {"war-of-the-gargantuas-1966",
   %{
     original: "フランケンシュタインの怪獣 サンダ対ガイラ",
     transliteration: "Furankenshutain No Kaijū Sanda Tai Gaira",
     translation: "Frankenstein's Monsters Sanda vs. Gaira"
   }},
  {"warning-from-space-1956",
   %{
     original: "宇宙人東京に現わる",
     transliteration: "Uchūjin Tōkyō Ni Arawaru",
     translation: "Aliens Appear in Tokyo"
   }},
  {"whirlwind-1964",
   %{
     original: "士魂魔道 大龍巻",
     transliteration: "Shikon Madō Daitatsumaki",
     translation: "Warrior's Spirit Great Tornado"
   }},
  {"wind-rises-2013",
   %{original: "風立ちぬ", transliteration: "Kaze Tachinu", translation: "Wind Rises"}},
  {"wrath-of-daimajin-1966",
   %{
     original: "大魔神逆襲",
     transliteration: "Daimajin Gyakushū",
     translation: "Daimajin Strikes Back"
   }},
  {"x-from-outer-space-1967",
   %{
     original: "宇宙大怪獣ギララ",
     transliteration: "Uchū Daikaijū Girara",
     translation: "Giant Space Monster Girara"
   }},
  {"yojimbo-1961", %{original: "用心棒", transliteration: "Yōjinbō", translation: "Bodyguard"}},
  {"zatoichi-1989", %{original: "座頭市", transliteration: "Zatōichi", translation: "Zatōichi"}},
  {"zatoichi-and-the-chess-expert-1965",
   %{
     original: "座頭市地獄旅",
     transliteration: "Zatōichi Jigoku Tabi",
     translation: "Zatōichi Hell Journey"
   }},
  {"zatoichi-and-the-chest-of-gold-1964",
   %{
     original: "座頭市千両首",
     transliteration: "Zatōichi Senryōkubi",
     translation: "Zatōichi Thousand Ryō Neck"
   }},
  {"zatoichi-and-the-doomed-man-1965",
   %{
     original: "座頭市逆手斬り",
     transliteration: "Zatōichi Gyakute Kiri",
     translation: "Zatōichi Reverse Slash"
   }},
  {"zatoichi-and-the-fugitives-1968",
   %{
     original: "座頭市果し状",
     transliteration: "Zatōichi Hatashijō",
     translation: "Zatōichi Letter of Challenge"
   }},
  {"zatoichi-at-large-1972",
   %{original: "座頭市御用旅", transliteration: "Zatōichi Goyōtabi", translation: "Zatōichi Errand"}},
  {"zatoichi-challenged-1967",
   %{
     original: "座頭市血煙り街道",
     transliteration: "Zatōichi Chikemurikaidō",
     translation: "Zatōichi Blood Smoke Road"
   }},
  {"zatoichi-goes-to-the-fire-festival-1970",
   %{
     original: "座頭市あばれ火祭り",
     transliteration: "Zatōichi Abare-hi Matsuri",
     translation: "Zatōichi Fire Festival"
   }},
  {"zatoichi-in-desperation-1972",
   %{
     original: "新座頭市物語 折れた杖",
     transliteration: "Shin Zatōichi Monogatari Oreta Tsue",
     translation: "New Zatōichi Story Broken Cane"
   }},
  {"zatoichi-meets-the-one-armed-swordsman-1971",
   %{
     original: "新座頭市・破れ！唐人剣",
     transliteration: "Shin Zatōichi Yabure! Tōjinken",
     translation: "New Zatōichi Slash! Chinese Sword"
   }},
  {"zatoichi-meets-yojimbo-1970",
   %{
     original: "座頭市と用心棒",
     transliteration: "Zatōichi To Yōjinbō",
     translation: "Zatōichi and Yojimbo"
   }},
  {"zatoichi-on-the-road-1963",
   %{
     original: "座頭市喧嘩旅",
     transliteration: "Zatōichi Kenkatabi",
     translation: "Zatōichi Fighting Journey"
   }},
  {"zatoichi-the-fugitive-1963",
   %{
     original: "座頭市兇状旅",
     transliteration: "Zatōichi Kyōjōtabi",
     translation: "Zatōichi Funeral Journey"
   }},
  {"zatoichi-the-outlaw-1967",
   %{
     original: "座頭市牢破り",
     transliteration: "Zatōichi Rōyaburi",
     translation: "Zatōichi Prisonbreaker"
   }},
  {"zatoichis-cane-sword-1967",
   %{
     original: "座頭市鉄火旅",
     transliteration: "Zatōichi Tekkatabi",
     translation: "Zatōichi Fire Journey"
   }},
  {"zatoichis-conspiracy-1973",
   %{
     original: "新座頭市物語 笠間の血祭り",
     transliteration: "Shin Zatōichi Monogatari Kasama No Chimatsuri",
     translation: "New Zatōichi Story Kasama Blood Festival"
   }},
  {"zatoichis-flashing-sword-1964",
   %{
     original: "座頭市あばれ凧",
     transliteration: "Zatōichi Abaredako",
     translation: "Zatōichi Wild Kite"
   }},
  {"zatoichis-pilgrimage-1966",
   %{
     original: "座頭市海を渡る",
     transliteration: "Zatōichi Umiwowataru",
     translation: "Zatōichi Across the Sea"
   }},
  {"zatoichis-revenge-1965",
   %{
     original: "座頭市二段斬り",
     transliteration: "Zatōichi Nidangiri",
     translation: "Zatōichi Double Slash"
   }},
  {"zatoichis-vengeance-1966",
   %{
     original: "座頭市の歌が聞える",
     transliteration: "Zatōichi No Uta Ga Kikoeru",
     translation: "I Can Hear the Song of Zatōichi"
   }},
  {"zeiram-1991", %{original: "ゼイラム", transliteration: "Zeiramu", translation: "Zëiram"}},
  {"zeiram-2-1994", %{original: "ゼイラム2", transliteration: "Zeiramu 2", translation: "Zëiram 2"}}
]

original_titles
|> Enum.chunk_every(20)
|> Enum.map(fn chunk ->
  Repo.transaction(fn ->
    chunk
    |> Enum.map(fn {slug, original_title} ->
      film = Repo.get_by!(Film, slug: slug)

      film
      |> Film.changeset(%{original_title: original_title})
      |> Repo.update!()
    end)
  end)
end)
