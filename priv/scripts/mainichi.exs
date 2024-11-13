ordinal = 23
year = 1968
best_picture = "神々の深き欲望"

"""
監督賞	岡本喜八「肉弾」肉弾をつくる会　ATG
脚本賞	今村昌平　長谷部慶次「神々の深き欲望」今村プロ
男優主演賞	寺田 農「肉弾」劇団「雲」肉弾をつくる会　ATG
女優主演賞	乙羽信子「藪の中の黒猫」近代映画協会　日映新社、「強虫女と弱虫男」近代映画協会
男優助演賞	嵐 寛寿郎「神々の深き欲望」今村プロ
女優助演賞	山岡久乃「眠れる美女」近代映画協会、「女と味噌汁」東宝、「カモとねぎ」東宝
撮影賞	黒田清己「藪の中の黒猫」近代映画協会　日映新社、「強虫女と弱虫男」近代映画協会
美術賞	阿久根 巌「首」東宝、「肉弾」肉弾をつくる会　ATG、「斬る」東宝
音楽賞	佐藤 勝「肉弾」肉弾をつくる会　ATG、「祇園祭」日本映画復興協会、「首」東宝
録音賞	安田哲男　紅谷愃一「黒部の太陽」三船プロ　石原プロ
教育文化映画賞	記録映画：「松本城」記録映画社
社会教育映画：「竜門の人びと」桜映画社
科学映画：「もんしろちょう」岩波映画製作所
一般教養映画：「シベリア人の世界」日本映画新社
ニュース映画賞	東映ニュース第471号「日本列島'68 ８月15日」朝日テレビニュース社
大藤信郎賞	学習研究社人形アニメーション映画「みにくいあひるのこ」作品において衆知の題材（アンデルセン童話）をとりあげながら永年の技術の蓄積を生かし、新しい作風でまとめあげた

"""
|> String.split("\n")
|> Enum.map(&String.trim/1)
|> Enum.reject(&(String.length(&1) < 1))
|> Enum.with_index(1)
|> Enum.map(fn {s, i} ->
  %{"category" => category} = Regex.named_captures(~r/^(?<category>\S+)/, s)

  if category not in ["教育文化映画賞", "ニュース映画賞", "大藤信郎賞"] do
    people = Regex.scan(~r/\t([^\x{300C}]+)\x{300C}/u, s)
    people = Enum.flat_map(people, fn [_, capture] -> String.split(capture, "\u3000") end) |> Enum.map(&String.replace(&1, " ", "")) |> Enum.join(",")
    films = Regex.scan(~r/\x{300C}([^\x{300C}\x{300D}]+)\x{300D}/u, s)
    films = Enum.map(films, fn [_, capture] ->
      capture
      end) |> Enum.join(",")
    [ordinal, year, category, i, people, films, s]
  else
    [ordinal, year, category, i, "", "", s]
  end
end)
|> then(&([[ordinal, year, "日本映画大賞", 0, "", best_picture, ""] | &1]))
|> IO.inspect()
