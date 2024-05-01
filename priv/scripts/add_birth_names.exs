alias GodzillaCineaste.{Person, Repo}

data = [
  # %{slug: "adams-nick", name: "Nicholas Aloysius Adamshock"},
  # %{slug: "ai-kyoko", name: "Tabuchi Miho", japanese_name: "田渕美粧"},
  # %{slug: "arishima-ichiro", name: "Ôshima Tadao", japanese_name: "大島忠雄"},
  # %{slug: "asahiyo-taro", name: "Yonekawa Fumitoshi", japanese_name: "米川文敏"},
  # %{slug: "chiaki-minoru", name: "Sasaki Katsuji", japanese_name: "佐々木勝治"},
  # %{slug: "fujiki-yu", name: "Suzuki Yûzô", japanese_name: "鈴木悠蔵"},
  # %{slug: "funato-jun", name: "Nishina Tsunetaka", japanese_name: "仁科常隆"},
  # %{slug: "hara-setsuko", name: "Aida Masae", japanese_name: "会田昌江"},
  # %{slug: "hidari-bokuzen", name: "Mikashima Ichiro", japanese_name: "三ヶ島一郎"},
  # %{slug: "hirata-akihiko", name: "Onoda Akihiko", japanese_name: "小野田昭彦"},
  # %{slug: "inagaki-hiroshi", name: "Inagaki Kôjirô", japanese_name: "稲垣浩二郎"},
  # %{slug: "ito-hisaya", name: "Itô Naoya", japanese_name: "伊藤尚也"},
  # %{slug: "ito-jerry", name: "Gerald Takemichi Itô"},
  # %{slug: "kagawa-kyoko", name: "Makino Kyôko", japanese_name: "牧野香子"},
  # %{slug: "kato-daisuke", name: "Katô Tokunosuke", japanese_name: "加藤徳之助"},
  # %{slug: "kawazu-seizaburo", name: "Nakajima Seiichi", japanese_name: "中島誠一"},
  # %{slug: "kayama-shigeru", name: "Yamada Kôji", japanese_name: "山田鉀治"},
  # %{slug: "kouchi-momoko", name: "Ôkouchi Momoko", japanese_name: "大河内桃子"},
  # %{slug: "kodo-kuninori", name: "Tanikawa Saichirô", japanese_name: "谷川佐市郎"},
  # %{slug: "kubo-akira", name: "Yamauchi Yasuyoshi", japanese_name: "山内康儀"},
  # %{slug: "kurobe-susumu", name: "Yoshimoto Takashi", japanese_name: "吉本隆志"},
  # %{slug: "little-man-machan", name: "Fukasawa Masao", japanese_name: "深沢政雄"},
  # %{slug: "matsumoto-somesho", name: "Nomura Hachirô", japanese_name: "野村八郎"},
  %{slug: "miki-norihei", name: "Tanuma Tadashi", japanese_name: "田沼則子"},
  %{slug: "mishima-ko", name: "Hase Katsuhiro", japanese_name: "長谷勝博"},
  %{slug: "miyauchi-kunio", name: "Miyauchi Kokurô", japanese_name: "宮内国郎"},
  %{slug: "mizuno-kumi", name: "Igarashi Maya", japanese_name: "五十嵐麻耶"},
  %{slug: "murakami-fuyuki", name: "Murakami Saishû", japanese_name: "村上済州"},
  %{slug: "mutsumi-goro", name: "Nakanishi Seiji", japanese_name: "中西清二"},
  %{slug: "nakamura-ganjiro", name: "Hayashi Yoshio", japanese_name: "林好雄"},
  %{slug: "nakamura-tetsu", name: "Nakamura Satoshi", japanese_name: "中村哲"},
  %{slug: "natsuki-yosuke", name: "Akuzawa Tamotsu", japanese_name: "阿久沢有"},
  %{slug: "nomura-kozo", name: "Osao Kazuhiro", japanese_name: "尾棹一浩"},
  %{slug: "okawa-henry", name: "Ôkawa Heihachirô", japanese_name: "大川平八郎"},
  %{slug: "oshikawa-shunro", name: "Oshikawa Masanori", japanese_name: "押川方存"},
  %{slug: "otowa-nobuko", name: "Kaji Nobuko", japanese_name: "加治信子"},
  %{slug: "sahara-kenji", name: "Katô Masayoshi", japanese_name: "加藤正好"},
  %{slug: "sakai-frankie", name: "Sakai Masatoshi", japanese_name: "堺正俊"},
  %{slug: "sakai-sachio", name: "Abe Yukio", japanese_name: "阿部幸男"},
  %{slug: "sawamura-ikio", name: "Okabe Shizuo", japanese_name: "岡部静雄"},
  %{slug: "senda-koreya", name: "Itô Kunio", japanese_name: "伊藤圀夫"},
  %{slug: "sera-akira", name: "Watanabe Akira", japanese_name: "渡辺章"},
  %{slug: "shimozawa-kan", name: "Umetani Matsutarô", japanese_name: "梅谷松太郎"},
  %{slug: "shimura-takashi", name: "Shimazaki Shôji", japanese_name: "島崎捷爾"},
  %{slug: "shirakawa-yumi", name: "Yamazaki Akiko", japanese_name: "山崎安基子"},
  %{slug: "sonoda-ayumi", name: "Iwadate Yûko", japanese_name: "岩立優子"},
  %{slug: "sugimura-haruko", name: "Nakano Haruko", japanese_name: "中野春子"},
  %{slug: "tabu-kenzo", name: "Tabu Yasutarô", japanese_name: "田武安太郎"},
  %{slug: "tachikawa-hiroshi", name: "Tachikawa Yôichi", japanese_name: "太刀川洋一"},
  %{slug: "takada-minoru", name: "Takada Noboru", japanese_name: "高田昇"},
  %{slug: "tamblyn-russ", name: "Russell Irving Tamblyn"},
  %{slug: "tazaki-jun", name: "Tanaka Minoru", japanese_name: "田中実"},
  %{slug: "tsuburaya-eiji", name: "Tsuburaya Eiichi", japanese_name: "円谷英一"},
  %{slug: "tsukasa-yoko", name: "Shôji Yôko", japanese_name: "庄司葉子"},
  %{slug: "tsuruta-koji", name: "Ono Eiichi", japanese_name: "小野榮一"},
  %{slug: "ueda-kichijiro", name: "Ueda Sadao", japanese_name: "上田定雄"},
  %{slug: "uehara-ken", name: "Ikehata Kiyoaki", japanese_name: "池端清亮"},
  %{slug: "uehara-misa", name: "Uehara Misako", japanese_name: "上原美佐子"},
  %{slug: "wakayama-setsuko", name: "Sakazume Setesuko", japanese_name: "坂爪セツ子"},
  %{slug: "yachigusa-kaoru", name: "Matsuda Hitomi", japanese_name: "松田瞳"},
  %{slug: "yamamoto-ren", name: "Yamamoto Kiyoshi", japanese_name: "山本廉"},
  %{slug: "yamamura-so", name: "Koga Hirosada", japanese_name: "古賀寛定"},
  %{slug: "yanagiya-kingoro", name: "Yamashita Keitarô", japanese_name: "山下敬太郎"},
  %{slug: "yashiro-miki", name: "Yamada Mikiko", japanese_name: "山田美紀子"}
]

for d <- data do
  person = Repo.get_by!(Person, slug: d.slug)
  birth_name = d |> Map.take([:name, :japanese_name]) |> Map.put(:category, :birth_name)
  person_alternate_names = [birth_name | person.alternate_names]
  changeset = Person.changeset(person, %{alternate_names: person_alternate_names})
  Repo.update!(changeset)
end
