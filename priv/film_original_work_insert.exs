alias CineasteData.{
  AuthorWork,
  Film,
  FilmWork,
  Group,
  GroupStaff,
  Label,
  Person,
  PersonStaff,
  Publisher,
  Repo,
  Studio,
  StudioWork,
  Work
}

# studios
studio_attrs = [
  %{slug: "tatsunoko-productions", name: "Tatsunoko Productions"},
  %{slug: "bandai-visual", name: "Bandai Visual"}
]

# publishers
publisher_attrs = [
  # %{slug: "", name: ""}
  %{slug: "akita-shoten", name: "Akita Shōten"},
  %{slug: "asahi-shimbun", name: "Asahi Shimbun"},
  %{slug: "bungeishunju", name: "Bungeishunju"},
  %{slug: "gotensha", name: "Gōtensha"},
  %{slug: "greenwillow", name: "Greenwillow Books of New York"},
  %{slug: "hakusensha", name: "Hakusensha"},
  %{slug: "hayakawa-publishing", name: "Hayakawa Publishing"},
  %{slug: "kadokawa-shoten", name: "Kadokawa Shōten"},
  %{slug: "kobunsha", name: "Kōbunsha"},
  %{slug: "kodansha", name: "Kōdansha"},
  %{slug: "media-factory", name: "Media Factory"},
  %{slug: "meiseisha", name: "Meiseisha"},
  %{slug: "ota-shoten", name: "Ōta Shōten"},
  %{slug: "ota-shuppan", name: "Ōta Shuppan"},
  %{slug: "sf-magazine", name: "SF Magazine"},
  %{slug: "shodensha", name: "Shōdensha"},
  %{slug: "shogakukan", name: "Shōgakukan"},
  %{slug: "shueisha", name: "Shūeisha"},
  %{slug: "simon-schuster", name: "Simon & Schuster"},
  %{slug: "takarajimasha", name: "Takarajimasha"},
  %{slug: "weekly-asahi", name: "Weekly Asahi"},
  %{slug: "weekly-playboy", name: "Weekly Playboy"}
]

# labels
label_attrs = [
  # %{slug: "", name: "", publisher: "publisher-slug"}
  %{slug: "afternoon", name: "Afternoon", publisher: "kodansha"},
  %{slug: "bessatsu-shonen-magazine", name: "Bessatsu Shōnen Magazine", publisher: "kodansha"},
  %{slug: "big-comic-original", name: "Big Comic Original", publisher: "shogakukan"},
  %{slug: "big-comic-superior", name: "Big Comic Superior", publisher: "shogakukan"},
  %{slug: "big-spirits-comics", name: "Big Spirits Comics", publisher: "shogakukan"},
  %{slug: "interesting-club", name: "Interesting Club", publisher: "kobunsha"},
  %{slug: "jump-comics", name: "Jump Comics", publisher: "shueisha"},
  %{slug: "melody", name: "Melody", publisher: "hakusensha"},
  %{slug: "sunday-comics", name: "Sunday Comics", publisher: "kobunsha"},
  %{slug: "weekly-asahi", name: "Weekly Asahi", publisher: "kobunsha"},
  %{slug: "weekly-shonen-champion", name: "Weekly Shōnen Champion", publisher: "akita-shoten"},
  %{slug: "weekly-shonen-jump", name: "Weekly Shōnen Jump", publisher: "shueisha"},
  %{slug: "weekly-shonen-sunday", name: "Weekly Shōnen Sunday", publisher: "shogakukan"},
  %{slug: "weekly-young-jump", name: "Weekly Young Jump", publisher: "shueisha"},
  %{slug: "yanmaga-kc", name: "Yanmaga KC", publisher: "kodansha"},
  %{slug: "young-jump", name: "Young Jump", publisher: "shueisha"},
  %{slug: "young-magazine", name: "Young Magazine", publisher: "kodansha"},
  %{
    slug: "young-magazine-pirated-edition",
    name: "Young Magazine Pirated Edition",
    publisher: "kodansha"
  },
  %{slug: "kappa-novels", name: "Kappa Novels", publisher: "kobunsha"},
  %{slug: "wild-age", name: "Wild Age", publisher: "kadokawa-shoten"}
]

# works
works_attrs = [
  # %{slug: "", title: "", format: :format_atom, year: 1999, authors: [], publisher: "publisher-slug", label: "label-slug"}
  %{slug: "13-assassins", year: 1963, format: :screenplay, authors: ["ikemiya-shoichiro"]},
  %{
    slug: "20th-century-boys",
    format: :manga,
    title: "20th Century Boys",
    authors: ["urasawa-naoki"],
    publisher: "shogakukan",
    label: "big-spirits-comics"
  },
  %{
    slug: "21st-century-boys",
    format: :manga,
    title: "20th Century Boys",
    authors: ["urasawa-naoki"],
    publisher: "shogakukan",
    label: "big-spirits-comics"
  },
  %{
    slug: "man-they-called-pirate",
    format: :novel,
    title: "The Man They Called Pirate",
    authors: ["hyakuta-naoki"],
    publisher: "kodansha"
  },
  %{slug: "run-meros", format: :"short story", title: "Run, Meros", authors: ["dazai-osamu"]},
  %{slug: "zatoichi", format: :"short story", authors: ["shimozawa-kan"]},
  %{
    slug: "akira",
    format: :manga,
    title: "Akira",
    authors: ["otomo-katsuhiro"],
    publisher: "kodansha",
    label: "young-magazine"
  },
  %{
    slug: "alive",
    format: :manga,
    title: "Alive",
    authors: ["takahashi-tsutomu"],
    publisher: "shueisha",
    label: "young-jump"
  },
  %{
    slug: "all-round-appraiser-qs-case-files",
    format: :"novel series",
    title: "All-Round Appraiser Q's Case Files",
    authors: ["matsuoka-keisuke"],
    publisher: "kadokawa-shoten"
  },
  %{
    slug: "sunset-on-third-street",
    format: :manga,
    title: "Sunset on Third Street",
    authors: ["saigan-ryohei"],
    publisher: "shogakukan",
    label: "big-comic-original"
  },
  %{
    slug: "assassination-classroom",
    format: :manga,
    title: "Assassination Classroom",
    authors: ["matsui-yusei"],
    publisher: "shueisha",
    label: "weekly-shonen-jump"
  },
  %{
    slug: "undersea-warship",
    format: :novel,
    title: "Undersea Warship",
    authors: ["oshikawa-shunro"]
  },
  %{
    slug: "attack-on-titan",
    format: :manga,
    title: "Attack on Titan",
    authors: ["isayama-hajime"],
    publisher: "kodansha",
    label: "bessatsu-shonen-magazine"
  },
  %{
    slug: "azumi",
    format: :manga,
    title: "Azumi",
    authors: ["koyama-yu"],
    publisher: "shogakukan",
    label: "big-comic-superior"
  },
  %{
    slug: "crayon-shin-chan-fierceness-that-invites-storm-the-battle-of-the-warring-states",
    format: :screenplay,
    title: "Crayon Shin-chan: Fierceness That Invites Storm! The Battle of the Warring States",
    authors: ["usui-yoshito", "hara-keiichi"]
  },
  %{
    slug: "battle-royale",
    format: :novel,
    title: "Battle Royale",
    authors: ["takami-koshun"],
    publisher: "ota-shoten"
  },
  %{slug: "casshern", format: :anime, title: "Casshern", studios: ["tatsunoko-productions"]},
  %{
    slug: "hatobueso",
    format: :novel,
    title: "Hatobuesō",
    authors: ["miyabe-miyuki"],
    publisher: "kobunsha"
  },
  %{
    slug: "crossfire",
    format: :novel,
    title: "Crossfire",
    authors: ["miyabe-miyuki"],
    publisher: "kobunsha"
  },
  %{
    slug: "daredevil-in-the-castle",
    format: :"serialized novel",
    authors: ["murakami-genzo"],
    publisher: "kobunsha",
    label: "weekly-asahi"
  },
  %{
    slug: "death-note",
    format: :manga,
    title: "Death Note",
    authors: ["oba-tsugumi", "obata-takeshi"],
    publisher: "shueisha",
    label: "jump-comics"
  },
  %{slug: "space-mons", format: :screenplay, title: "Space Mons", authors: ["okami-jojiro"]},
  %{
    slug: "dororo",
    format: :manga,
    title: "Dororo",
    authors: ["tezuka-osamu"],
    publisher: "shogakukan",
    label: "weekly-shonen-sunday"
  },
  %{
    slug: "eko-eko-azarak",
    format: :manga,
    title: "Eko Eko Azarak",
    authors: ["koga-shinichi"],
    publisher: "akita-shoten",
    label: "weekly-shonen-champion"
  },
  %{
    slug: "espy",
    format: :novel,
    title: "ESPY",
    authors: ["komatsu-sakyo"],
    publisher: "hayakawa-publishing"
  },
  %{
    slug: "eternal-zero",
    format: :novel,
    title: "The Eternal Zero",
    authors: ["hyakuta-naoki"],
    publisher: "ota-shuppan"
  },
  %{
    slug: "criticality-of-explosion",
    format: :novel,
    title: "The Criticality of Explosion",
    authors: ["tanaka-koji"],
    publisher: "shodensha"
  },
  %{
    slug: "sengoku-self-defense-force",
    format: :"serialized novel",
    title: "Sengoku Self Defense Force",
    authors: ["hanmura-ryo"],
    publisher: "sf-magazine"
  },
  %{
    slug: "sengoku-self-defense-force-1549",
    format: :novel,
    title: "Sengoku Self Defense Force 1549",
    authors: ["fukui-harutoshi"],
    publisher: "kadokawa-shoten"
  },
  %{
    slug: "gantz",
    format: :manga,
    title: "Gantz",
    authors: ["oku-hiroya"],
    publisher: "shueisha",
    label: "weekly-young-jump"
  },
  %{
    slug: "science-ninja-team-gatchaman",
    format: :anime,
    title: "Science Ninja Team Gatchaman",
    studios: ["tatsunoko-productions"]
  },
  %{
    slug: "to-the-ends-of-the-earth-and-sea",
    format: :novel,
    title: "To the Ends of the Earth and Sea: A Novel of Genghis Khan",
    authors: ["morimura-seiichi"],
    publisher: "kadokawa-shoten"
  },
  %{
    slug: "ghost-in-the-shell",
    format: :manga,
    title: "Ghost in the Shell",
    authors: ["masamune-shiro"],
    publisher: "kodansha",
    label: "young-magazine-pirated-edition"
  },
  %{
    slug: "glorious-team-batista",
    format: :novel,
    title: "The Glorious Team Batista",
    authors: ["kaido-takeru"],
    publisher: "takarajimasha"
  },
  %{
    slug: "gods-left-hand-devils-right-hand",
    format: :manga,
    title: "God's Left Hand, Devil's Right Hand",
    authors: ["umezu-kazuo"],
    publisher: "shogakukan",
    label: "big-spirits-comics"
  },
  %{
    slug: "monster-godzilla",
    format: :"serialized novel",
    title: "Monster Godzilla",
    authors: ["kayama-shigeru"]
  },
  %{
    slug: "golden-bat",
    format: :"picture story",
    authors: ["nagamatsu-takeo"],
    publisher: "meiseisha"
  },
  %{
    slug: "strange-ronin",
    format: :novel,
    title: "Strange Ronin",
    authors: ["takiguchi-yasuhiko"]
  },
  %{
    slug: "kings-ransom",
    format: :novel,
    title: "King's Ransom",
    authors: ["mcbain-ed"],
    publisher: "simon-schuster"
  },
  %{
    slug: "howls-moving-castle",
    format: :novel,
    title: "Howl's Moving Castle",
    authors: ["jones-diana-wynn"],
    year: 1986,
    publisher: "greenwillow"
  },
  %{
    slug: "i-am-a-hero",
    format: :manga,
    title: "I Am A Hero",
    authors: ["hanazawa-kengo"],
    publisher: "shogakukan",
    label: "big-spirits-comics"
  },
  %{
    slug: "kerberos-panzer-cop",
    format: :manga,
    title: "Kerberos Panzer Cop",
    authors: ["oshii-mamoru"]
  },
  %{
    slug: "fiend-with-twenty-faces",
    format: :novel,
    title: "The Fiend with Twenty Faces",
    authors: ["kitamura-so"]
  },
  %{
    slug: "kaiji",
    format: :manga,
    title: "Kaiji",
    authors: ["fukumoto-nobuyuki"],
    publisher: "kodansha",
    label: "yanmaga-kc"
  },
  %{
    slug: "kamui-gaiden",
    format: :manga,
    title: "Kamui Gaiden",
    authors: ["shirato-sanpei"],
    publisher: "shogakukan"
  },
  %{
    slug: "new-legend-of-the-eight-samurai",
    format: :novel,
    title: "New Legend of the Eight Samurai",
    authors: ["kamata-toshio"],
    publisher: "kadokawa-shoten"
  },
  %{
    slug: "library-wars",
    format: :manga,
    title: "Library Wars",
    authors: ["takami-yu"],
    publisher: "kadokawa-shoten"
  },
  %{
    slug: "lorelei-at-the-end-of-the-war",
    format: :novel,
    title: "Lorelei at the End of the War",
    authors: ["fukui-harutoshi"],
    publisher: "kodansha"
  },
  %{slug: "69", format: :manga, title: "69", authors: ["takahashi-tsutomu"]},
  %{slug: "lupin-iii", format: :manga, title: "Lupin III", authors: ["monkey-punch"]},
  %{slug: "makai-tensho", format: :novel, title: "Makai Tenshō", authors: ["yamada-futaro"]},
  %{
    slug: "voice-in-the-night",
    format: :"short story",
    title: "A Voice in the Night",
    authors: ["hodgson-william-hope"],
    year: 1907
  },
  %{
    slug: "mothra",
    format: :"original story",
    authors: ["nakamura-shinichiro", "fukunaga-takehiko", "hotta-yoshie"],
    publisher: "weekly-asahi"
  },
  %{
    slug: "mushi-shi",
    format: :manga,
    title: "Mushi-shi",
    authors: ["urushibara-yuki"],
    publisher: "kodansha",
    label: "afternoon"
  },
  %{
    slug: "earth-defense-force",
    format: :"unpublished novel",
    title: "Earth Defense Force",
    authors: ["okami-jojiro"]
  },
  %{
    slug: "one-missed-call",
    format: :"novel series",
    title: "One Missed Call",
    authors: ["akimoto-yasushi"],
    publisher: "kadokawa-shoten"
  },
  %{
    slug: "onmyoji",
    format: :"novel series",
    title: "Onmyoji",
    authors: ["yumemakura-baku"],
    publisher: "bungeishunju"
  },
  %{
    slug: "parasite-eve",
    format: :novel,
    title: "Parasite Eve",
    authors: ["sena-hideaki"],
    publisher: "kadokawa-shoten"
  },
  %{
    slug: "parasyte",
    format: :manga,
    title: "Parasyte",
    authors: ["iwaaki-hitoshi"],
    publisher: "kodansha"
  },
  %{
    slug: "platinum-data",
    format: :novel,
    title: "Platinum Data",
    authors: ["higashino-keigo"],
    publisher: "gotensha"
  },
  %{
    slug: "lady-snowblood",
    format: :manga,
    title: "Lady Snowblood",
    authors: ["koike-kazuo", "kamimura-kazuo"],
    publisher: "weekly-playboy"
  },
  %{
    slug: "great-prophecy-of-nostradamus",
    format: :novel,
    title: "The Great Prophecy of Nostradamus",
    authors: ["goto-ben"],
    publisher: "shodensha"
  },
  %{
    slug: "spiral",
    format: :novel,
    title: "Spiral",
    authors: ["suzuki-koji"],
    publisher: "kadokawa-shoten"
  },
  %{
    slug: "in-a-grove",
    format: :"short story",
    title: "In a Grove",
    authors: ["akutagawa-ryunosuke"]
  },
  %{
    slug: "rashomon",
    format: :"short story",
    title: "Rashomon",
    authors: ["akutagawa-ryunosuke"]
  },
  %{
    slug: "yomigaeru-sora-rescue-wings",
    format: :anime,
    title: "Yomigaeru Sora Rescue Wings",
    studios: ["bandai-visual"]
  },
  %{
    slug: "rescue-wings",
    format: :manga,
    title: "Rescue Wings",
    authors: ["otsuka-tommy"],
    publisher: "media-factory"
  },
  %{
    slug: "ring",
    format: :novel,
    title: "Ring",
    authors: ["suzuki-koji"],
    publisher: "kadokawa-shoten"
  },
  %{
    slug: "lemon-heart",
    format: :"short story",
    title: "Lemon Heart",
    authors: ["suzuki-koji"],
    publisher: "kadokawa-shoten"
  },
  %{
    slug: "rurouni-kenshin",
    format: :manga,
    title: "Rurouni Kenshin: Meiji Swordsman Romantic Story",
    authors: ["watsuki-nobuhiro"],
    publisher: "shueisha",
    label: "jump-comics"
  },
  %{
    slug: "musashi-miyamoto",
    format: :"serialized novel",
    title: "Musashi Miyamoto",
    authors: ["yoshikawa-eiji"],
    publisher: "asahi-shimbun"
  },
  %{
    slug: "everyday-peace",
    format: :screenplay,
    title: "Everyday Peace",
    authors: ["yamamoto-shuguro"]
  },
  %{
    slug: "koga-ninja-scroll",
    format: :"serialized novel",
    title: "Kōga Ninja Scroll",
    authors: ["yamada-futaro"],
    publisher: "kobunsha",
    label: "interesting-club"
  },
  %{
    slug: "sinking-of-japan",
    format: :novel,
    title: "The Sinking of Japan",
    authors: ["komatsu-sakyo"],
    publisher: "kobunsha",
    label: "kappa-novels"
  },
  %{
    slug: "sky-crawlers",
    format: :"novel series",
    title: "The Sky Crawlers",
    authors: ["mori-hiroshi"]
  },
  %{
    slug: "sky-high",
    format: :manga,
    title: "Shy High",
    authors: ["takahashi-tsutomu"],
    publisher: "shueisha",
    label: "weekly-young-jump"
  },
  %{
    slug: "space-battleship-yamato",
    format: :anime,
    title: "Space Battleship Yamato",
    authors: ["nishizaki-yoshinobu"]
  },
  %{
    slug: "doraemon",
    format: :manga,
    title: "Doraemon",
    authors: ["fujiko-f-fujio"],
    publisher: "shogakukan"
  },
  %{
    slug: "sword-of-the-emperor",
    format: :"serialized novel",
    title: "The Sword of the Emperor",
    authors: ["yumemakura-baku"],
    publisher: "kadokawa-shoten",
    label: "wild-age"
  },
  %{
    slug: "tetsujin-28",
    format: :manga,
    title: "Tetsujin-28",
    authors: ["yokoyama-mitsuteru"],
    publisher: "kobunsha",
    label: "sunday-comics"
  },
  %{
    slug: "disappearance-of-the-capital",
    format: :"serialized novel",
    title: "The Disappearance of the Capital",
    authors: ["komatsu-sakyo"]
  },
  %{
    slug: "himitsu-top-secret",
    format: :manga,
    title: "Himitsu: Top Secret",
    authors: ["shimizu-reiko"],
    publisher: "hakusensha",
    label: "melody"
  },
  %{
    slug: "triumphant-return-of-general-rouge",
    format: :novel,
    title: "The Triumphant Return of General Rouge",
    authors: ["kaido-takeru"],
    publisher: "takarajimasha"
  },
  %{
    slug: "warrior-spirit-great-tornado",
    format: :novel,
    title: "Warrior Spirit: Great Tornado",
    authors: ["nanjo-norio"]
  }
]

# add film roles for these
# Battle in Outer Space (Jojiro Okami)
# The Bullet Train (Arei Kato)
# Castle in the Sky (Hayao Miyazaki)
# Godzilla vs. Biollante (Shinichiro Kobayashi)
# Godzilla vs. Megalon (Shinichi Sekizawa)
# Godzilla vs. Mechagodzilla (Shinichi Sekizawa, Masami Fukushima)
# Goemon (Kazuaki Kiriya)
# Gorath (Jojiro Okami)
# H-Man (Hideo Unagami)
# Hidden Fortress: The Last Princess (Ryuzo Kikushima, Hideo Oguni, Shinobu Hashimoto, Akira Kurosawa)
# Invisible Man (Kei Beppu)
# Kamen Rider: The First & The Next (Shotaro Ishinomori)
# Matango (Shinichi Hoshi, Masami Fukushima)
# Mechanical Violator Hakaider (Shotaro Ishinomori)
# Message from Space (Shotaro Ishinomori, Msaahiro Noda, Kinji Fukasaku, Hiro Matsuda)
# My Neighbor Totoro (Hayao Miyazaki)
# Nausicaä of the Valley of the Wind (Hayao Miyazaki)
# Patlabor 1 & 2 (Headgear)
# Ponyo (Hayao Miyazaki)
# Porco Rosso (Hayao Miyazaki)
# Princess Mononoke (Hayao Miyazaki)
# Rebirth of Mothra (Tomoyuki Tanaka)
# Rebirth of Mothra II (Tomoyuki Tanaka)
# Return of Godzilla (Tomoyuki Tanaka)
# Sakuya, Slayer of Demons (Tomoo Haraguchi)
# Sayonara Jupiter (Sakyo Komatsu)
# Spirited Away (Hayao Miyazaki)
# Stray Dog: Kerberos Panzer Cops (Mamoru Oshii)
# Varan the Unbelievable (Ken Kuronuma)
# The War in Space (Tomoyuki Tanaka)
# Warning from Space (Gentaro Nakajima)
# The Wind Rises (Hayao Miyazaki)

# films_works
films_works_attrs = [
  # %{film_slug: "", work_slug: ""}
  %{film_slug: "13-assassins-2010", work_slug: "13-assassins"},
  %{
    film_slug: "20th-century-boys-1-the-beginning-of-the-end-2008",
    work_slug: "20th-century-boys"
  },
  %{film_slug: "20th-century-boys-2-the-last-hope-2009", work_slug: "20th-century-boys"},
  %{film_slug: "20th-century-boys-3-redemption", work_slug: "20th-century-boys"},
  %{film_slug: "20th-century-boys-3-redemption", work_slug: "21st-century-boys"},
  %{film_slug: "fueled-the-man-they-called-pirate-2016", work_slug: "man-they-called-pirate"},
  %{film_slug: "adventure-of-kigan-castle-1966", work_slug: "run-meros"},
  %{film_slug: "akira-1988", work_slug: "akira"},
  %{film_slug: "alive-2003", work_slug: "alive"},
  %{
    film_slug: "all-round-appraiser-q-the-eyes-of-mona-lisa-2014",
    work_slug: "all-round-appraiser-qs-case-files"
  },
  %{film_slug: "atragon-1963", work_slug: "undersea-warship"},
  %{
    film_slug: "ballad-2009",
    work_slug: "crayon-shin-chan-fierceness-that-invites-storm-the-battle-of-the-warring-states"
  },
  %{film_slug: "casshern-2004", work_slug: "casshern"},
  %{film_slug: "crossfire-2000", work_slug: "hatobueso"},
  %{film_slug: "crossfire-2000", work_slug: "crossfire"},
  %{film_slug: "daredevil-in-the-castle-1961", work_slug: "daredevil-in-the-castle"},
  %{film_slug: "dogora-1964", work_slug: "space-mons"},
  %{film_slug: "dororo-2007", work_slug: "dororo"},
  %{film_slug: "espy-1974", work_slug: "espy"},
  %{film_slug: "eternal-zero-2013", work_slug: "eternal-zero"},
  %{film_slug: "conflagration-1975", work_slug: "criticality-of-explosion"},
  %{film_slug: "g-i-samurai-1979", work_slug: "sengoku-self-defense-force"},
  %{film_slug: "gatchaman-2013", work_slug: "science-ninja-team-gatchaman"},
  %{
    film_slug: "genghis-khan-to-the-ends-of-the-earth-and-sea-2007",
    work_slug: "to-the-ends-of-the-earth-and-sea"
  },
  %{film_slug: "ghost-in-the-shell-1995", work_slug: "ghost-in-the-shell"},
  %{film_slug: "glorious-team-batista-2008", work_slug: "glorious-team-batista"},
  %{
    film_slug: "gods-left-hand-devils-right-hand-2006",
    work_slug: "gods-left-hand-devils-right-hand"
  },
  %{film_slug: "godzilla-1954", work_slug: "monster-godzilla"},
  %{film_slug: "godzilla-raids-again-1955", work_slug: "monster-godzilla"},
  %{film_slug: "golden-bat-1966", work_slug: "golden-bat"},
  %{film_slug: "hara-kiri-death-of-a-samurai-2011", work_slug: "strange-ronin"},
  %{film_slug: "high-and-low-1963", work_slug: "kings-ransom"},
  %{film_slug: "howls-moving-castle-2004", work_slug: "howls-moving-castle"},
  %{film_slug: "i-am-a-hero-2016", work_slug: "i-am-a-hero"},
  %{film_slug: "jin-roh-the-wolf-brigade-2000", work_slug: "kerberos-panzer-cop"},
  %{film_slug: "k-20-legend-of-the-mask-2008", work_slug: "fiend-with-twenty-faces"},
  %{film_slug: "kamui-gaiden-2009", work_slug: "kamui-gaiden"},
  %{film_slug: "legend-of-the-eight-samurai-1980", work_slug: "new-legend-of-the-eight-samurai"},
  %{
    film_slug: "lorelei-the-witch-of-the-pacific-ocean-2005",
    work_slug: "lorelei-at-the-end-of-the-war"
  },
  %{film_slug: "lovedeath-2007", work_slug: "69"},
  %{film_slug: "samurai-reincarnation-1981", work_slug: "makai-tensho"},
  %{film_slug: "matango-1963", work_slug: "voice-in-the-night"},
  %{film_slug: "mothra-1961", work_slug: "mothra"},
  %{film_slug: "mysterians-1957", work_slug: "earth-defense-force"},
  %{film_slug: "parasite-eve-1997", work_slug: "parasite-eve"},
  %{film_slug: "platinum-data-2013", work_slug: "platinum-data"},
  %{film_slug: "princess-blade-2001", work_slug: "lady-snowblood"},
  %{film_slug: "prophecies-of-nostradamus-1974", work_slug: "great-prophecy-of-nostradamus"},
  %{film_slug: "spiral-1998", work_slug: "spiral"},
  %{film_slug: "rashomon-1950", work_slug: "in-a-grove"},
  %{film_slug: "rashomon-1950", work_slug: "rashomon"},
  %{film_slug: "rescue-wings-2008", work_slug: "yomigaeru-sora-rescue-wings"},
  %{film_slug: "rescue-wings-2008", work_slug: "rescue-wings"},
  %{film_slug: "ring-1998", work_slug: "ring"},
  %{film_slug: "ring-2-1999", work_slug: "ring"},
  %{film_slug: "ring-0-birthday-2000", work_slug: "lemon-heart"},
  %{film_slug: "samurai-commando-mission-1549-2005", work_slug: "sengoku-self-defense-force"},
  %{
    film_slug: "samurai-commando-mission-1549-2005",
    work_slug: "sengoku-self-defense-force-1549"
  },
  %{film_slug: "sanjuro-1962", work_slug: "everyday-peace"},
  %{film_slug: "shinobi-heart-under-blade-2005", work_slug: "koga-ninja-scroll"},
  %{film_slug: "sinking-of-japan-2006", work_slug: "sinking-of-japan"},
  %{film_slug: "sky-crawlers-2008", work_slug: "sky-crawlers"},
  %{film_slug: "sky-high-2003", work_slug: "sky-high"},
  %{film_slug: "space-battleship-yamato-2010", work_slug: "space-battleship-yamato"},
  %{film_slug: "stand-by-me-doraemon-2014", work_slug: "doraemon"},
  %{film_slug: "submersion-of-japan-1973", work_slug: "sinking-of-japan"},
  %{film_slug: "sword-of-alexander-2007", work_slug: "sword-of-the-emperor"},
  %{film_slug: "tetsujin-28-2005", work_slug: "tetsujin-28"},
  %{film_slug: "tokyo-blackout-1987", work_slug: "disappearance-of-the-capital"},
  %{film_slug: "top-secret-murder-in-mind-2016", work_slug: "himitsu-top-secret"},
  %{
    film_slug: "triumphant-return-of-general-rouge-2009",
    work_slug: "triumphant-return-of-general-rouge"
  },
  %{film_slug: "tsubaki-sanjuro-2007", work_slug: "everyday-peace"},

  # samurai trilogy
  %{film_slug: "samurai-i-musashi-miyamoto-1954", work_slug: "musashi-miyamoto"},
  %{film_slug: "samurai-ii-duel-at-ichijoji-temple-1955", work_slug: "musashi-miyamoto"},
  %{film_slug: "samurai-iii-duel-at-ganryu-island-1956", work_slug: "musashi-miyamoto"},

  # rurouni kenshin
  %{film_slug: "rurouni-kenshin-2012", work_slug: "rurouni-kenshin"},
  %{film_slug: "rurouni-kenshin-kyoto-inferno-2014", work_slug: "rurouni-kenshin"},
  %{film_slug: "rurouni-kenshin-the-legend-ends-2014", work_slug: "rurouni-kenshin"},

  # parasyte
  %{film_slug: "parasyte-part-1-2014", work_slug: "parasyte"},
  %{film_slug: "parasyte-part-2-2015", work_slug: "parasyte"},

  # onmyoji
  %{film_slug: "onmyoji-2001", work_slug: "onmyoji"},
  %{film_slug: "onmyoji-ii-2003", work_slug: "onmyoji"},

  # one missed call
  %{film_slug: "one-missed-call-2003", work_slug: "one-missed-call"},
  %{film_slug: "one-missed-call-2-2005", work_slug: "one-missed-call"},
  %{film_slug: "one-missed-call-final-2006", work_slug: "one-missed-call"},

  # lupin iii
  %{film_slug: "lupin-the-3rd-2014", work_slug: "lupin-iii"},
  %{film_slug: "lupin-iii-the-castle-of-cagliostro-1979", work_slug: "lupin-iii"},

  # library wars
  %{film_slug: "library-wars-2013", work_slug: "library-wars"},
  %{film_slug: "library-wars-the-last-mission-2015", work_slug: "library-wars"},

  # kaiji
  %{film_slug: "kaiji-2009", work_slug: "kaiji"},
  %{film_slug: "kaiji-2-2011", work_slug: "kaiji"},

  # gantz
  %{film_slug: "gantz-2011", work_slug: "gantz"},
  %{film_slug: "gantz-perfect-answer-2011", work_slug: "gantz"},

  # eko eko azarak
  %{film_slug: "eko-eko-azarak-wizard-of-darkness-1995", work_slug: "eko-eko-azarak"},
  %{film_slug: "eko-eko-azarak-ii-birth-of-the-wizard-1996", work_slug: "eko-eko-azarak"},
  %{film_slug: "eko-eko-azarak-iii-misa-the-dark-angel-1998", work_slug: "eko-eko-azarak"},

  # death note
  %{film_slug: "death-note-2006", work_slug: "death-note"},
  %{film_slug: "death-note-the-last-name-2006", work_slug: "death-note"},
  %{film_slug: "l-change-the-world-2008", work_slug: "death-note"},
  %{film_slug: "death-note-light-up-the-new-world-2016", work_slug: "death-note"},

  # battle royale
  %{film_slug: "battle-royale-2000", work_slug: "battle-royale"},
  %{film_slug: "battle-royale-ii-requiem-2003", work_slug: "battle-royale"},

  # azumi
  %{film_slug: "azumi-2003", work_slug: "azumi"},
  %{film_slug: "azumi-2-death-or-love-2005", work_slug: "azumi"},

  # attack on titan
  %{film_slug: "attack-on-titan-2015", work_slug: "attack-on-titan"},
  %{film_slug: "attack-on-titan-end-of-the-world-2015", work_slug: "attack-on-titan"},

  # assassination classroom
  %{film_slug: "assassination-classroom-2015", work_slug: "assassination-classroom"},
  %{film_slug: "assassination-classroom-graduation-2016", work_slug: "assassination-classroom"},

  # always
  %{film_slug: "always-sunset-on-third-street-2005", work_slug: "sunset-on-third-street"},
  %{film_slug: "always-sunset-on-third-street-2-2007", work_slug: "sunset-on-third-street"},
  %{film_slug: "always-sunset-on-third-street-3-2012", work_slug: "sunset-on-third-street"},

  # zatoichi
  %{film_slug: "tale-of-zatoichi-1962", work_slug: "zatoichi"},
  %{film_slug: "tale-of-zatoichi-continues-1962", work_slug: "zatoichi"},
  %{film_slug: "new-tale-of-zatoichi-1963", work_slug: "zatoichi"},
  %{film_slug: "zatoichi-the-fugitive-1963", work_slug: "zatoichi"},
  %{film_slug: "zatoichi-on-the-road-1963", work_slug: "zatoichi"},
  %{film_slug: "zatoichi-and-the-chest-of-gold-1964", work_slug: "zatoichi"},
  %{film_slug: "zatoichis-flashing-sword-1964", work_slug: "zatoichi"},
  %{film_slug: "fight-zatoichi-fight-1964", work_slug: "zatoichi"},
  %{film_slug: "adventures-of-zatoichi-1964", work_slug: "zatoichi"},
  %{film_slug: "zatoichis-revenge-1965", work_slug: "zatoichi"},
  %{film_slug: "zatoichi-and-the-doomed-man-1965", work_slug: "zatoichi"},
  %{film_slug: "zatoichi-and-the-chess-expert-1965", work_slug: "zatoichi"},
  %{film_slug: "zatoichis-vengeance-1966", work_slug: "zatoichi"},
  %{film_slug: "zatoichis-pilgrimage-1966", work_slug: "zatoichi"},
  %{film_slug: "zatoichis-cane-sword-1967", work_slug: "zatoichi"},
  %{film_slug: "zatoichi-the-outlaw-1967", work_slug: "zatoichi"},
  %{film_slug: "zatoichi-challenged-1967", work_slug: "zatoichi"},
  %{film_slug: "zatoichi-and-the-fugitives-1968", work_slug: "zatoichi"},
  %{film_slug: "samaritan-zatoichi-1968", work_slug: "zatoichi"},
  %{film_slug: "zatoichi-meets-yojimbo-1970", work_slug: "zatoichi"},
  %{film_slug: "zatoichi-goes-to-the-fire-festival-1970", work_slug: "zatoichi"},
  %{film_slug: "zatoichi-meets-the-one-armed-swordsman-1971", work_slug: "zatoichi"},
  %{film_slug: "zatoichi-at-large-1972", work_slug: "zatoichi"},
  %{film_slug: "zatoichi-in-desperation-1972", work_slug: "zatoichi"},
  %{film_slug: "zatoichis-conspiracy-1973", work_slug: "zatoichi"},
  %{film_slug: "zatoichi-1989", work_slug: "zatoichi"}
]

assoc_publisher = fn work ->
  if work[:publisher] do
    publisher = Repo.get_by!(Publisher, slug: work[:publisher])
    Map.put(work, :publisher_id, publisher.id)
  else
    work
  end
end

assoc_label = fn work ->
  if work[:label] do
    label = Repo.get_by!(Label, slug: work[:label])
    Map.put(work, :label_id, label.id)
  else
    work
  end
end

person_staff_attrs = [
  %{film: "battle-in-outer-space-1959", person: "okami-jojiro", role: "Story", order: "110"},
  %{film: "bullet-train-1975", person: "kato-arei", role: "Story", order: "10"},
  %{film: "castle-in-the-sky-1986", person: "miyazaki-hayao", role: "Story", order: "10"},
  %{
    film: "godzilla-vs-biollante-1989",
    person: "kobayashi-shinichiro",
    role: "Story",
    order: "110"
  },
  %{film: "godzilla-vs-megalon-1973", person: "sekizawa-shinichi", role: "Story", order: "100"},
  %{
    film: "godzilla-vs-mechagodzilla-1974",
    person: "sekizawa-shinichi",
    role: "Story",
    order: "110"
  },
  %{
    film: "godzilla-vs-mechagodzilla-1974",
    person: "fukushima-masami",
    role: "Story",
    order: "111"
  },
  %{film: "goemon-2009", person: "kiriya-kazuaki", role: "Story", order: "90"},
  %{film: "gorath-1962", person: "okami-jojiro", role: "Story", order: "110"},
  %{film: "h-man-1958", person: "unagami-hideo", role: "Story", order: "110"},
  %{
    film: "hidden-fortress-the-last-princess-2008",
    person: "kikushima-ryuzo",
    role: "Story",
    order: "10"
  },
  %{
    film: "hidden-fortress-the-last-princess-2008",
    person: "oguni-hideo",
    role: "Story",
    order: "11"
  },
  %{
    film: "hidden-fortress-the-last-princess-2008",
    person: "hashimoto-shinobu",
    role: "Story",
    order: "12"
  },
  %{
    film: "hidden-fortress-the-last-princess-2008",
    person: "kurosawa-akira",
    role: "Story",
    order: "13"
  },
  %{film: "invisible-man-1954", person: "beppu-kei", role: "Story", order: "30"},
  %{film: "kamen-rider-the-first-2005", person: "ishinomori-shotaro", role: "Story", order: "10"},
  %{film: "kamen-rider-the-next-2007", person: "ishinomori-shotaro", role: "Story", order: "10"},
  %{film: "matango-1963", person: "hoshi-shinichi", role: "Story", order: "110"},
  %{film: "matango-1963", person: "fukushima-masami", role: "Story", order: "111"},
  %{
    film: "mechanical-violator-hakaider-1995",
    person: "ishinomori-shotaro",
    role: "Story",
    order: "10"
  },
  %{film: "message-from-space-1978", person: "ishinomori-shotaro", role: "Story", order: "100"},
  %{film: "message-from-space-1978", person: "noda-masahiro", role: "Story", order: "101"},
  %{film: "message-from-space-1978", person: "fukasaku-kinji", role: "Story", order: "102"},
  %{film: "message-from-space-1978", person: "matsuda-hiroo", role: "Story", order: "103"},
  %{film: "my-neighbor-totoro-1988", person: "miyazaki-hayao", role: "Story", order: "10"},
  %{
    film: "nausicaa-of-the-valley-of-the-wind-1984",
    person: "miyazaki-hayao",
    role: "Story",
    order: "120"
  },
  %{film: "ponyo-2008", person: "miyazaki-hayao", role: "Story", order: "10"},
  %{film: "porco-rosso-1992", person: "miyazaki-hayao", role: "Story", order: "30"},
  %{film: "princess-mononoke-1997", person: "miyazaki-hayao", role: "Story", order: "110"},
  %{film: "rebirth-of-mothra-1996", person: "tanaka-tomoyuki", role: "Story", order: "110"},
  %{film: "rebirth-of-mothra-ii-1997", person: "tanaka-tomoyuki", role: "Story", order: "110"},
  %{film: "return-of-godzilla-1984", person: "tanaka-tomoyuki", role: "Story", order: "110"},
  %{film: "sakuya-slayer-of-demons-2000", person: "haraguchi-tomoo", role: "Story", order: "20"},
  %{film: "sayonara-jupiter-1984", person: "komatsu-sakyo", role: "Story", order: "10"},
  %{film: "spirited-away-2001", person: "miyazaki-hayao", role: "Story", order: "20"},
  %{
    film: "stray-dog-kerberos-panzer-cops-1991",
    person: "oshii-mamoru",
    role: "Story",
    order: "10"
  },
  %{film: "varan-the-unbelievable-1958", person: "kuronuma-ken", role: "Story", order: "110"},
  %{film: "war-in-space-1977", person: "tanaka-tomoyuki", role: "Story", order: "120"},
  %{film: "warning-from-space-1956", person: "nakajima-gentaro", role: "Story", order: "20"},
  %{film: "wind-rises-2013", person: "miyazaki-hayao", role: "Story", order: "10"}
]

group_staff_attrs = [
  %{film: "patlabor-the-movie-1989", group: "headgear", role: "Story", order: "10"},
  %{film: "patlabor-2-the-movie-1993", group: "headgear", role: "Story", order: "10"}
]

Repo.transaction(fn ->
  # # insert studios
  # studio_attrs
  # |> Enum.map(&Studio.changeset(%Studio{}, &1))
  # |> Enum.each(&Repo.insert!(&1))

  # # insert publishers
  # publisher_attrs
  # |> Enum.map(&Publisher.changeset(%Publisher{}, &1))
  # |> Enum.each(&Repo.insert!(&1))

  # # insert labels
  # label_attrs
  # |> Enum.map(fn label ->
  #      publisher = Repo.get_by!(Publisher, slug: label.publisher)
  #      Map.put(label, :publisher_id, publisher.id)
  #    end)
  # |> Enum.map(&Label.changeset(%Label{}, &1))
  # |> Enum.each(&Repo.insert!(&1))

  # # insert works
  # works_attrs
  # |> Enum.map(fn work ->
  #   %{id: work_id} = work |> assoc_publisher.() |> assoc_label.() |> then(&Work.changeset(%Work{}, &1)) |> Repo.insert!()
  #   if work[:authors] do
  #     Enum.map(work.authors, fn author_slug ->
  #       author = Repo.get_by!(Person, slug: author_slug)
  #       %AuthorWork{}
  #       |> AuthorWork.changeset(%{work_id: work_id, person_id: author.id})
  #       |> Repo.insert!()
  #     end)
  #   end

  #   if work[:studios] do
  #     Enum.map(work.studios, fn studio_slug ->
  #       studio = Repo.get_by!(Studio, slug: studio_slug)
  #       %StudioWork{}
  #       |> StudioWork.changeset(%{work_id: work_id, studio_id: studio.id})
  #       |> Repo.insert!()
  #     end)
  #   end
  # end)

  # films_works_attrs
  # |> Enum.map(fn %{film_slug: film_slug, work_slug: work_slug} ->
  #   film = Repo.get_by!(Film, slug: film_slug)
  #   work = Repo.get_by!(Work, slug: work_slug)
  #   %FilmWork{}
  #   |> FilmWork.changeset(%{film_id: film.id, work_id: work.id})
  #   |> Repo.insert!()
  # end)

  # person_staff_attrs
  # |> Enum.map(fn attrs ->
  #   film = Repo.get_by!(Film, slug: attrs.film)
  #   person = Repo.get_by!(Person, slug: attrs.person)
  #   %PersonStaff{}
  #   |> PersonStaff.changeset(%{film_id: film.id, person_id: person.id, role: attrs.role, order: attrs.order})
  #   |> Repo.insert!()
  # end)

  group_staff_attrs
  |> Enum.map(fn attrs ->
    group = Repo.get_by!(Group, slug: attrs.group)
    film = Repo.get_by!(Film, slug: attrs.film)

    %GroupStaff{}
    |> GroupStaff.changeset(%{
      film_id: film.id,
      group_id: group.id,
      role: attrs.role,
      order: attrs.order
    })
    |> Repo.insert!()
  end)
end)
