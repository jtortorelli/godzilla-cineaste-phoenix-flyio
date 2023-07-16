alias CineasteData.{Film, FilmStudio, Repo, Studio}

attrs = [
  # %{slug: "adventure-of-kigan-castle-1966", studios: ["toho", "mifune-productions"]},
  # %{slug: "adventures-of-zatoichi-1964", studios: ["daiei"]},
  # %{
  #   slug: "alive-2003",
  #   studios: [
  #     "kss",
  #     "eisei-gekijo",
  #     "ntt-learning-systems",
  #     "klock-worx",
  #     "hammers",
  #     "nikkatsu",
  #     "suplex",
  #     "skyworks",
  #     "napalm-films"
  #   ]
  # },
  # %{slug: "all-monsters-attack-1969", studios: ["toho"]},
  # %{slug: "aragami-2003", studios: ["napalm-films", "studio-3"]},
  # %{slug: "assault-girls-2009", studios: ["deiz", "geneon-universal-entertainment"]},
  # %{slug: "atragon-1963", studios: ["toho"]},
  # %{
  #   slug: "avalon-2001",
  #   studios: ["bandai-visual", "media-factory", "dentsu", "nippon-herald-films", "deiz"]
  # },
  # %{slug: "battle-in-outer-space-1959", studios: ["toho"]},
  # %{slug: "bullet-train-1975", studios: ["toei"]},
  # %{slug: "castle-in-the-sky-1986", studios: ["tokuma-shoten", "studio-ghibli"]},
  # %{slug: "conflagration-1975", studios: ["toho"]},
  # %{slug: "crossfire-2000", studios: ["toho", "tokyo-broadcasting-system"]},
  # %{slug: "daigoro-vs-goliath-1972", studios: ["toho", "tsuburaya"]},
  # %{slug: "daimajin-1966", studios: ["daiei"]},
  # %{slug: "wrath-of-daimajin-1966", studios: ["daiei"]},
  # %{slug: "daredevil-in-the-castle-1961", studios: ["daiei"]},
  # %{slug: "destroy-all-monsters-1968", studios: ["toho"]},
  # %{slug: "dogora-1964", studios: ["toho"]},
  # %{slug: "magnitude-7-9-1980", studios: ["toho"]},
  # %{
  #   slug: "eko-eko-azarak-ii-birth-of-the-wizard-1996",
  #   studios: ["gaga-communications", "tsuburaya"]
  # },
  # %{
  #   slug: "eko-eko-azarak-iii-misa-the-dark-angel-1998",
  #   studios: ["gaga-communications", "tsuburaya"]
  # },
  # %{
  #   slug: "eko-eko-azarak-wizard-of-darkness-1995",
  #   studios: ["gaga-communications", "tsuburaya"]
  # },
  # %{slug: "espy-1974", studios: ["toho"]},
  # %{slug: "evil-of-dracula-1974", studios: ["toho"]},
  # %{slug: "fight-zatoichi-fight-1964", studios: ["daiei"]},
  # %{slug: "frankenstein-conquers-the-world-1965", studios: ["toho"]},
  # %{slug: "g-i-samurai-1979", studios: ["toho", "kadokawa", "mifune-productions"]},
  # %{
  #   slug: "gamera-2-attack-of-legion-1996",
  #   studios: [
  #     "daiei",
  #     "nippon-television-network",
  #     "hakuhodo",
  #     "fujitsu",
  #     "nippan-group-holdings"
  #   ]
  # },
  # %{
  #   slug: "gamera-3-revenge-of-iris-1999",
  #   studios: [
  #     "daiei",
  #     "tokuma-shoten",
  #     "nippon-television-network",
  #     "hakuhodo",
  #     "nippan-group-holdings"
  #   ]
  # },
  # %{slug: "gamera-the-giant-monster-1965", studios: ["daiei"]},
  # %{
  #   slug: "gamera-guardian-of-the-universe-1995",
  #   studios: ["daiei", "nippon-television-network", "hakuhodo"]
  # },
  # %{slug: "gamera-super-monster-1980", studios: ["daiei"]},
  # %{slug: "gamera-vs-barugon-1966", studios: ["daiei"]},
  # %{slug: "gamera-vs-guiron-1969", studios: ["daiei"]},
  # %{slug: "gamera-vs-gyaos-1967", studios: ["daiei"]},
  # %{slug: "gamera-vs-jiger-1970", studios: ["daiei"]},
  # %{slug: "gamera-vs-viras-1968", studios: ["daiei"]},
  # %{slug: "genocide-1968", studios: ["shochiku"]},
  # %{slug: "ghidorah-the-three-headed-monster-1964", studios: ["toho"]},
  %{
    slug: "ghost-in-the-shell-1995",
    studios: ["kodansha", "bandai-visual", "manga-entertainment", "production-ig"]
  },
  %{
    slug: "godzilla-mothra-and-king-ghidorah-giant-monsters-all-out-attack-2001",
    studios: ["toho"]
  },
  %{slug: "godzilla-2000-millennium-1999", studios: ["toho"]},
  %{slug: "godzilla-final-wars-2004", studios: ["toho"]},
  # %{slug: "godzilla-1954", studios: ["toho"]},
  %{slug: "godzilla-raids-again-1955", studios: ["toho"]},
  %{slug: "godzilla-vs-biollante-1989", studios: ["toho"]},
  %{slug: "godzilla-vs-destoroyah-1995", studios: ["toho"]},
  %{slug: "godzilla-vs-gigan-1972", studios: ["toho"]},
  %{slug: "godzilla-vs-hedorah-1971", studios: ["toho"]},
  %{slug: "godzilla-vs-king-ghidorah-1991", studios: ["toho"]},
  %{slug: "godzilla-vs-mechagodzilla-ii-1993", studios: ["toho"]},
  %{slug: "godzilla-vs-megalon-1973", studios: ["toho"]},
  %{slug: "godzilla-vs-mothra-1992", studios: ["toho"]},
  %{slug: "godzilla-vs-spacegodzilla-1994", studios: ["toho"]},
  %{slug: "godzilla-vs-mechagodzilla-1974", studios: ["toho"]},
  %{slug: "ebirah-horror-of-the-deep-1966", studios: ["toho"]},
  %{slug: "godzilla-against-mechagodzilla-2002", studios: ["toho"]},
  %{slug: "godzilla-vs-megaguirus-2000", studios: ["toho"]},
  %{slug: "godzilla-tokyo-sos-2003", studios: ["toho"]},
  %{slug: "goke-body-snatcher-from-hell-1968", studios: ["shochiku"]},
  %{slug: "golden-bat-1966", studios: ["toei"]},
  %{slug: "gorath-1962", studios: ["toho"]},
  %{slug: "gunhed-1989", studios: ["toho", "sunrise", "bandai", "kadokawa-shoten", "imagica"]},
  %{slug: "h-man-1958", studios: ["toho"]},
  %{slug: "hidden-fortress-1958", studios: ["toho"]},
  %{slug: "high-and-low-1963", studios: ["toho", "kurosawa-productions"]},
  %{slug: "human-vapor-1960", studios: ["toho"]},
  %{slug: "invisible-man-1954", studios: ["toho"]},
  %{slug: "jin-roh-the-wolf-brigade-2000", studios: ["bandai-visual", "production-ig"]},
  %{slug: "kagemusha-1980", studios: ["20th-century-fox", "toho", "kurosawa-productions"]},
  %{slug: "king-kong-escapes-1967", studios: ["toho"]},
  %{slug: "king-kong-vs-godzilla-1962", studios: ["toho"]},
  %{slug: "lake-of-dracula-1971", studios: ["toho"]},
  %{slug: "last-war-1961", studios: ["toho"]},
  %{slug: "latitude-zero-1969", studios: ["toho"]},
  %{slug: "legend-of-the-eight-samurai-1983", studios: ["toei"]},
  %{slug: "living-skeleton-1968", studios: ["shochiku"]},
  %{
    slug: "lorelei-the-witch-of-the-pacific-ocean-2005",
    studios: ["fuji-television-network", "toho", "kansai-television", "king-records"]
  },
  %{slug: "lupin-iii-the-castle-of-cagliostro-1979", studios: ["tokyo-movie-shinsha"]},
  %{slug: "magic-serpent-1966", studios: ["toei"]},
  %{slug: "samurai-reincarnation-1981", studios: ["toei"]},
  %{
    slug: "kamen-rider-the-first-2005",
    studios: ["toei-video", "toei", "toei-channel", "toei-advertising"]
  },
  %{
    slug: "kamen-rider-the-next-2007",
    studios: ["toei-video", "toei", "toei-channel", "toei-advertising"]
  },
  %{slug: "matango-1963", studios: ["toho"]},
  %{
    slug: "mechanical-violator-hakaider-1995",
    studios: ["toei", "toei-video", "ishinomori-productions"]
  },
  %{slug: "message-from-space-1978", studios: ["toei"]},
  %{slug: "invasion-of-astro-monster-1965", studios: ["toho"]},
  %{slug: "moon-over-tao-1997", studios: ["bandai-visual"]},
  %{slug: "mothra-1961", studios: ["toho"]},
  %{slug: "mothra-vs-godzilla-1964", studios: ["toho"]},
  %{slug: "my-neighbor-totoro-1988", studios: ["tokuma-shoten", "studio-ghibli"]},
  %{slug: "mysterians-1957", studios: ["toho"]},
  %{
    slug: "nausicaa-of-the-valley-of-the-wind-1984",
    studios: ["tokuma-shoten", "hakuhodo", "topcraft"]
  },
  %{slug: "new-tale-of-zatoichi-1963", studios: ["daiei"]},
  %{
    slug: "oblivion-island-haruka-and-the-magic-mirror-2009",
    studios: ["fuji-television-network", "production-ig", "dentsu", "pony-canyon"]
  },
  %{slug: "parasite-eve-1997", studios: ["fuji-television-network", "kadokawa-shoten"]},
  %{
    slug: "patlabor-2-the-movie-1993",
    studios: ["bandai-visual", "tohokushinsha", "production-ig"]
  },
  %{slug: "patlabor-the-movie-1989", studios: ["bandai-visual", "tohokushinsha"]},
  %{slug: "prophecies-of-nostradamus-1974", studios: ["toho"]},
  %{slug: "rashomon-1950", studios: ["daiei"]},
  %{slug: "rebirth-of-mothra-1996", studios: ["toho"]},
  %{slug: "rebirth-of-mothra-ii-1997", studios: ["toho"]},
  %{slug: "rebirth-of-mothra-iii-1998", studios: ["toho"]},
  %{slug: "red-spectacles-1987", studios: ["omnibus-promotion"]},
  %{slug: "return-of-daimajin-1966", studios: ["daiei"]},
  %{slug: "return-of-godzilla-1984", studios: ["toho"]},
  %{slug: "rodan-1956", studios: ["toho"]},
  %{slug: "sakuya-slayer-of-demons-2000", studios: ["warner-bros", "towani"]},
  %{slug: "samaritan-zatoichi-1968", studios: ["daiei"]},
  %{slug: "samurai-i-musashi-miyamoto-1954", studios: ["toho"]},
  %{slug: "samurai-ii-duel-at-ichijoji-temple-1955", studios: ["toho"]},
  %{slug: "samurai-iii-duel-at-ganryu-island-1956", studios: ["toho"]},
  %{slug: "lost-world-of-sinbad-1963", studios: ["toho"]},
  %{slug: "sanjuro-1962", studios: ["toho", "kurosawa-productions"]},
  %{slug: "sayonara-jupiter-1984", studios: ["toho", "io"]},
  %{slug: "secret-of-the-telegian-1960", studios: ["toho"]},
  %{slug: "seven-samurai-1954", studios: ["toho"]},
  %{slug: "shin-godzilla-2016", studios: ["toho"]},
  %{slug: "son-of-godzilla-1967", studios: ["toho"]},
  %{slug: "space-amoeba-1970", studios: ["toho"]},
  %{
    slug: "stray-dog-kerberos-panzer-cops-1991",
    studios: ["omnibus-promotion", "bandai", "fuji-television-network"]
  },
  %{slug: "submersion-of-japan-1973", studios: ["toho"]},
  %{slug: "tale-of-zatoichi-1962", studios: ["daiei"]},
  %{slug: "tale-of-zatoichi-continues-1962", studios: ["daiei"]},
  %{slug: "talking-head-1992", studios: ["bandai", "embodiment-films", "plex"]},
  %{slug: "terror-of-mechagodzilla-1975", studios: ["toho"]},
  %{slug: "three-outlaw-samurai-1964", studios: ["shochiku", "samurai-productions"]},
  %{slug: "throne-of-blood-1957", studios: ["toho"]},
  %{slug: "tokyo-blackout-1987", studios: ["kansai-television", "tokuma-shoten", "daiei"]},
  %{slug: "vampire-doll-1970", studios: ["toho"]},
  %{slug: "varan-the-unbelievable-1958", studios: ["toho"]},
  %{slug: "versus-2000", studios: ["wevco", "napalm-films", "suplex", "kss"]},
  %{slug: "war-in-space-1977", studios: ["toho"]},
  %{slug: "war-of-the-gargantuas-1966", studios: ["toho"]},
  %{slug: "warning-from-space-1956", studios: ["daiei"]},
  %{slug: "whirlwind-1964", studios: ["toho", "takarazuka"]},
  %{slug: "x-from-outer-space-1967", studios: ["shochiku"]},
  %{slug: "orochi-the-eight-headed-dragon-1994", studios: ["toho"]},
  %{slug: "yojimbo-1961", studios: ["toho", "kurosawa-productions"]},
  %{slug: "zatoichi-1989", studios: ["miku", "katsu-productions"]},
  %{slug: "zatoichi-and-the-chess-expert-1965", studios: ["daiei"]},
  %{slug: "zatoichi-and-the-chest-of-gold-1964", studios: ["daiei"]},
  %{slug: "zatoichi-and-the-doomed-man-1965", studios: ["daiei"]},
  %{slug: "zatoichi-and-the-fugitives-1968", studios: ["daiei"]},
  %{slug: "zatoichi-at-large-1972", studios: ["toho", "katsu-productions"]},
  %{slug: "zatoichi-challenged-1967", studios: ["daiei"]},
  %{
    slug: "zatoichi-goes-to-the-fire-festival-1970",
    studios: ["dainichi", "daiei", "katsu-productions"]
  },
  %{slug: "zatoichi-in-desperation-1972", studios: ["toho", "katsu-productions"]},
  %{slug: "zatoichi-meets-the-one-armed-swordsman-1971", studios: ["toho", "katsu-productions"]},
  %{slug: "zatoichi-meets-yojimbo-1970", studios: ["daiei", "katsu-productions"]},
  %{slug: "zatoichi-on-the-road-1963", studios: ["daiei"]},
  %{slug: "zatoichi-the-fugitive-1963", studios: ["daiei"]},
  %{slug: "zatoichi-the-outlaw-1967", studios: ["daiei", "katsu-productions"]},
  %{slug: "zatoichis-cane-sword-1967", studios: ["daiei"]},
  %{slug: "zatoichis-conspiracy-1973", studios: ["toho", "katsu-productions"]},
  %{slug: "zatoichis-flashing-sword-1964", studios: ["daiei"]},
  %{slug: "zatoichis-pilgrimage-1966", studios: ["daiei"]},
  %{slug: "zatoichis-revenge-1965", studios: ["daiei"]},
  %{slug: "zatoichis-vengeance-1966", studios: ["daiei"]},
  %{slug: "zeiram-1991", studios: ["gaga-communications", "crowd"]},
  %{slug: "zeiram-2-1994", studios: ["embodiment-films", "crowd"]}
]

attrs
|> Enum.chunk_every(20)
|> Enum.map(fn chunk ->
  Repo.transaction(fn ->
    chunk
    |> Enum.flat_map(fn %{slug: slug, studios: studio_slugs} ->
      film = Repo.get_by!(Film, slug: slug)
      studios = Enum.map(studio_slugs, &Repo.get_by!(Studio, slug: &1))

      for studio <- studios do
        %{film_id: film.id, studio_id: studio.id}
      end
    end)
    |> Enum.map(&FilmStudio.changeset(%FilmStudio{}, &1))
    |> Enum.each(&Repo.insert!(&1))
  end)
end)
