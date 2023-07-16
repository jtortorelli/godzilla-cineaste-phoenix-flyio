alias CineasteData.{Film, FilmSeries, FilmSeriesEntry, Repo}

series = [
  %{slug: "20th-century-boys", name: "20th Century Boys"},
  %{slug: "zatoichi", name: "Zatoichi"},
  %{slug: "always-sunset-on-third-street", name: "Always: Sunset on Third Street"},
  %{slug: "assassination-classroom", name: "Assassination Classroom"},
  %{slug: "attack-on-titan", name: "Attack on Titan"},
  %{slug: "azumi", name: "Azumi"},
  %{slug: "battle-royale", name: "Battle Royale"},
  %{slug: "daimajin", name: "Daimajin"},
  %{slug: "death-note", name: "Death Note"},
  %{slug: "osaka-castle", name: "Osaka Castle"},
  %{slug: "eko-eko-azarak", name: "Eko Eko Azarak"},
  %{slug: "bloodthirsty", name: "Bloodthirsty"},
  %{slug: "frankenstein", name: "Frankenstein"},
  %{slug: "gamera", name: "Gamera"},
  %{slug: "gantz", name: "Gantz"},
  %{slug: "team-batista", name: "Team Batista"},
  %{slug: "kerberos", name: "Kerberos"},
  %{slug: "kaiji", name: "Kaiji"},
  %{slug: "kamen-rider", name: "Kamen Rider"},
  %{slug: "library-wars", name: "Library Wars"},
  %{slug: "one-missed-call", name: "One Missed Call"},
  %{slug: "parasyte", name: "Parasyte"},
  %{slug: "patlabor", name: "Patlabor"},
  %{slug: "rebirth-of-mothra", name: "Rebirth of Mothra"},
  %{slug: "ring", name: "Ring"},
  %{slug: "rurouni-kenshin", name: "Rurouni Kenshin"},
  %{slug: "musashi-miyamoto", name: "Musashi Miyamoto"},
  %{slug: "yojimbo", name: "Yojimbo"},
  %{slug: "zeiram", name: "Zëiram"}
]

series_and_entries = [
  # finish inserting Godzilla series
  {"godzilla",
   [
     {"return-of-godzilla-1984", 16},
     {"godzilla-vs-biollante-1989", 17},
     {"godzilla-vs-king-ghidorah-1991", 18},
     {"godzilla-vs-mothra-1992", 19},
     {"godzilla-vs-mechagodzilla-ii-1993", 20},
     {"godzilla-vs-spacegodzilla-1994", 21},
     {"godzilla-vs-destoroyah-1995", 22},
     {"godzilla-2000-millennium-1999", 23},
     {"godzilla-vs-megaguirus-2000", 24},
     {"godzilla-mothra-and-king-ghidorah-giant-monsters-all-out-attack-2001", 25},
     {"godzilla-against-mechagodzilla-2002", 26},
     {"godzilla-tokyo-sos-2003", 27},
     {"godzilla-final-wars-2004", 28},
     {"shin-godzilla-2016", 29}
   ]},
  # 20th Century Boys
  {"20th-century-boys",
   [
     {"20th-century-boys-1-the-beginning-of-the-end-2008", 1},
     {"20th-century-boys-2-the-last-hope-2009", 2},
     {"20th-century-boys-3-redemption", 3}
   ]},
  # Zatoichi

  {"zatoichi",
   [
     {"tale-of-zatoichi-1962", 1},
     {"tale-of-zatoichi-continues-1962", 2},
     {"new-tale-of-zatoichi-1963", 3},
     {"zatoichi-the-fugitive-1963", 4},
     {"zatoichi-on-the-road-1963", 5},
     {"zatoichi-and-the-chest-of-gold-1964", 6},
     {"zatoichis-flashing-sword-1964", 7},
     {"fight-zatoichi-fight-1964", 8},
     {"adventures-of-zatoichi-1964", 9},
     {"zatoichis-revenge-1965", 10},
     {"zatoichi-and-the-doomed-man-1965", 11},
     {"zatoichi-and-the-chess-expert-1965", 12},
     {"zatoichis-vengeance-1966", 13},
     {"zatoichis-pilgrimage-1966", 14},
     {"zatoichis-cane-sword-1967", 15},
     {"zatoichi-the-outlaw-1967", 16},
     {"zatoichi-challenged-1967", 17},
     {"zatoichi-and-the-fugitives-1968", 18},
     {"samaritan-zatoichi-1968", 19},
     {"zatoichi-meets-yojimbo-1970", 20},
     {"zatoichi-goes-to-the-fire-festival-1970", 21},
     {"zatoichi-meets-the-one-armed-swordsman-1971", 22},
     {"zatoichi-at-large-1972", 23},
     {"zatoichi-in-desperation-1972", 24},
     {"zatoichis-conspiracy-1973", 25},
     {"zatoichi-1989", 26}
   ]},
  # Always: Sunset on Third Street

  {"always-sunset-on-third-street",
   [
     {"always-sunset-on-third-street-2005", 1},
     {"always-sunset-on-third-street-2-2007", 2},
     {"always-sunset-on-third-street-3-2012", 3}
   ]},
  # Assassination Classroom

  {"assassination-classroom",
   [
     {"assassination-classroom-2015", 1},
     {"assassination-classroom-graduation-2016", 2}
   ]},
  # Attack on Titan

  {"attack-on-titan",
   [
     {"attack-on-titan-2015", 1},
     {"attack-on-titan-end-of-the-world-2015", 2}
   ]},
  # Azumi

  {"azumi",
   [
     {"azumi-2003", 1},
     {"azumi-2-death-or-love-2005", 2}
   ]},
  # Battle Royale

  {"battle-royale",
   [
     {"battle-royale-2000", 1},
     {"battle-royale-ii-requiem-2003", 2}
   ]},
  # Daimajin

  {"daimajin",
   [
     {"daimajin-1966", 1},
     {"return-of-daimajin-1966", 2},
     {"wrath-of-daimajin-1966", 3}
   ]},
  # Death Note

  {"death-note",
   [
     {"death-note-2006", 1},
     {"death-note-the-last-name-2006", 2},
     {"l-change-the-world-2008", 3},
     {"death-note-light-up-the-new-world-2016", 4}
   ]},
  # Daredevil in the Castle & Whirlwind

  {"osaka-castle",
   [
     {"daredevil-in-the-castle-1961", 1},
     {"whirlwind-1964", 2}
   ]},
  # Eko Eko Azarak

  {"eko-eko-azarak",
   [
     {"eko-eko-azarak-wizard-of-darkness-1995", 1},
     {"eko-eko-azarak-ii-birth-of-the-wizard-1996", 2},
     {"eko-eko-azarak-iii-misa-the-dark-angel-1998", 3}
   ]},
  # Bloodthirsty Trilogy

  {"bloodthirsty",
   [
     {"vampire-doll-1970", 1},
     {"lake-of-dracula-1971", 2},
     {"evil-of-dracula-1974", 3}
   ]},
  # Frankenstein & Gargantuas

  {"frankenstein",
   [
     {"frankenstein-conquers-the-world-1965", 1},
     {"war-of-the-gargantuas-1966", 2}
   ]},
  # Gamera

  {"gamera",
   [
     {"gamera-the-giant-monster-1965", 1},
     {"gamera-vs-barugon-1966", 2},
     {"gamera-vs-gyaos-1967", 3},
     {"gamera-vs-viras-1968", 4},
     {"gamera-vs-guiron-1969", 5},
     {"gamera-vs-jiger-1970", 6},
     {"gamera-vs-zigra-1971", 7},
     {"gamera-super-monster-1980", 8},
     {"gamera-guardian-of-the-universe-1995", 9},
     {"gamera-2-attack-of-legion-1996", 10},
     {"gamera-3-revenge-of-iris-1999", 11},
     {"gamera-the-brave-2006", 12}
   ]},
  # Gantz

  {"gantz",
   [
     {"gantz-2011", 1},
     {"gantz-perfect-answer-2011", 2}
   ]},
  # Glorious Team Batista & General Rouge

  {"team-batista",
   [
     {"glorious-team-batista-2008", 1},
     {"triumphant-return-of-general-rouge-2009", 2}
   ]},
  # Kerberos Saga

  {"kerberos",
   [
     {"red-spectacles-1987", 1},
     {"stray-dog-kerberos-panzer-cops-1991", 2},
     {"jin-roh-the-wolf-brigade-2000", 3}
   ]},
  # Kaiji

  {"kaiji",
   [
     {"kaiji-2009", 1},
     {"kaiji-2-2011", 2}
   ]},
  # Kamen Rider

  {"kamen-rider",
   [
     {"kamen-rider-the-first-2005", 1},
     {"kamen-rider-the-next-2007", 2}
   ]},
  # Library Wars

  {"library-wars",
   [
     {"library-wars-2013", 1},
     {"library-wars-the-last-mission-2015", 2}
   ]},
  # One Missed Call

  {"one-missed-call",
   [
     {"one-missed-call-2003", 1},
     {"one-missed-call-2-2005", 2},
     {"one-missed-call-final-2006", 3}
   ]},
  # Parasyte

  {"parasyte",
   [
     {"parasyte-part-1-2014", 1},
     {"parasyte-part-2-2015", 2}
   ]},
  # Patlabor

  {"patlabor",
   [
     {"patlabor-the-movie-1989", 1},
     {"patlabor-2-the-movie-1993", 2}
   ]},
  # Rebirth of Mothra

  {"rebirth-of-mothra",
   [
     {"rebirth-of-mothra-1996", 1},
     {"rebirth-of-mothra-ii-1997", 2},
     {"rebirth-of-mothra-iii-1998", 3}
   ]},
  # Ring

  {"ring",
   [
     {"ring-1998", 1},
     {"spiral-1998", 2},
     {"ring-2-1999", 3},
     {"ring-0-birthday-2000", 4}
   ]},
  # Rurouni Kenshin

  {"rurouni-kenshin",
   [
     {"rurouni-kenshin-2012", 1},
     {"rurouni-kenshin-kyoto-inferno-2014", 2},
     {"rurouni-kenshin-the-legend-ends-2014", 3}
   ]},
  # Samurai Trilogy

  {"musashi-miyamoto",
   [
     {"samurai-i-musashi-miyamoto-1954", 1},
     {"samurai-ii-duel-at-ichijoji-temple-1955", 2},
     {"samurai-iii-duel-at-ganryu-island-1956", 3}
   ]},
  # Yojimbo & Sanjuro

  {"yojimbo",
   [
     {"yojimbo-1961", 1},
     {"sanjuro-1962", 2}
   ]},
  # Zeiram

  {"zeiram",
   [
     {"zeiram-1991", 1},
     {"zeiram-1994", 2}
   ]}
]

Repo.transaction(fn ->
  series
  |> Enum.map(fn s ->
    %FilmSeries{}
    |> FilmSeries.changeset(s)
    |> Repo.insert!()
  end)

  series_and_entries
  |> Enum.map(fn {series_slug, entries} ->
    series = Repo.get_by!(FilmSeries, slug: series_slug)

    Enum.map(entries, fn {film_slug, entry_number} ->
      film = Repo.get_by!(Film, slug: film_slug)

      %FilmSeriesEntry{}
      |> FilmSeriesEntry.changeset(%{
        film_id: film.id,
        film_series_id: series.id,
        entry_number: entry_number
      })
      |> Repo.insert!()
    end)
  end)
end)
