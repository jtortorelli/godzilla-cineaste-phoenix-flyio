alias GodzillaCineaste.{Person, Repo}

data = [
  %{
    slug: "adams-nick",
    death_place: %{
      city: "Beverly Hills",
      country_subdivision: "California",
      country: "United States"
    }
  },
  %{
    slug: "amamoto-hideyo",
    death_place: %{city: "Wakamatsu", country_subdivision: "Fukuoka", country: "Japan"}
  },
  %{
    slug: "anzai-kyoko",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "arikawa-sadamasa",
    death_place: %{city: "Kamo", country_subdivision: "Shizuoka", country: "Japan"}
  },
  %{
    slug: "chiaki-minoru",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  },
  %{slug: "conway-harold", death_place: %{city: nil, country_subdivision: nil, country: "Japan"}},
  %{
    slug: "dan-ikuma",
    death_place: %{city: "Suzhou", country_subdivision: "Jiangsu", country: "China"}
  },
  %{
    slug: "dunham-robert",
    death_place: %{city: "Sarasota", country_subdivision: "Florida", country: "United States"}
  },
  %{slug: "fujiki-yu", death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}},
  %{
    slug: "fujita-susumu",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "hara-setsuko",
    death_place: %{city: "Kanagawa", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "hodgson-william-hope",
    death_place: %{city: "Ypres", country_subdivision: nil, country: "Belgium"}
  },
  %{
    slug: "hoshi-yuriko",
    death_place: %{city: "Kyoto", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "ifukube-akira",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  },
  %{slug: "ikebe-ryo", death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}},
  %{
    slug: "ito-jerry",
    death_place: %{
      city: "Los Angeles",
      country_subdivision: "California",
      country: "United States"
    }
  },
  %{
    slug: "kato-shigeo",
    death_place: %{city: "Kamakura", country_subdivision: "Kanagawa", country: "Japan"}
  },
  %{
    slug: "kobayashi-keiju",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "kouchi-momoko",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "kurosawa-akira",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "matsumoto-somesho",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "matsumura-tatsuo",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "mifune-toshiro",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "miyauchi-kunio",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "murakami-fuyuki",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "nakakita-chieko",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "nakamaru-tadao",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "nakamura-nobuo",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "oshikawa-shunro",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "ozawa-eitaro",
    death_place: %{city: "Zushi", country_subdivision: "Kanagawa", country: "Japan"}
  },
  %{
    slug: "rankin-arthur",
    death_place: %{city: "Harrington Sound", country_subdivision: nil, country: "Bermuda"}
  },
  %{
    slug: "reason-rhodes",
    death_place: %{
      city: "Palm Springs",
      country_subdivision: "California",
      country: "United States"
    }
  },
  %{
    slug: "sakai-frankie",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "sanjo-miki",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "sasaki-takamaru",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "sato-makoto",
    death_place: %{city: "Kawasaki", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "senda-koreya",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "shimozawa-kan",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "shimura-takashi",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "shiozawa-toki",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "shirakawa-yumi",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "sugimura-haruko",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "takashima-tadao",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "tanaka-kinuyo",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "tani-akira",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "tazaki-jun",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "tono-eijiro",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "tsuburaya-eiji",
    death_place: %{city: "Ito", country_subdivision: "Shizuoka", country: "Japan"}
  },
  %{
    slug: "ueda-kichijiro",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "wakayama-setsuko",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  },
  %{
    slug: "yamamura-so",
    death_place: %{city: "Tokyo", country_subdivision: nil, country: "Japan"}
  }
]

for d <- data do
  person = Repo.get_by!(Person, slug: d.slug)
  person |> Person.changeset(%{death_place: d.death_place}) |> Repo.update!()
end
