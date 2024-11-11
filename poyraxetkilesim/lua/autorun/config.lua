Config = {}

Config.Language = "en"
Config.Languages = {
    "en", "tr", "de", "fr", "es", "it", "pt", "ru", "zh", "ja",
    "ko", "ar", "nl", "sv", "no", "da", "fi", "pl", "cs", "hu"
}

Config.AllowPlayerInteraction = true
Config.AllowPropInteraction = true

--Searchable Props
Config.SearchableProps = {
    {model = "models/props_c17/oildrum001.mdl", interactionLabel = "Search Oil Drum"},
}
--Search Rewards
Config.Rewards = {
    {type = "money", amount = 1000, message = "You Found 1000 Dollars"},
    {type = "weapon", class = "weapon_pistol", message = "You Found 9mm Pistol"},
}

--translate
Config.Translations = {
    ["en"] = {
        ["greet"] = "Greet",
        ["search"] = "You are searching the item",
        ["already_searched"] = "This has already been searched.",
        ["successful_search"] = "You found something!",
        ["failed_search"] = "Search failed.",
        ["examine"] = "Examine",
        ["slightly_injured"] = "Slightly injured",
        ["injured"] = "Injured",
        ["severely_injured"] = "Severely injured"
    },
    ["tr"] = {
        ["greet"] = "Selam Ver",
        ["search"] = "Eşyayı Arıyorsun",
        ["already_searched"] = "Bu çoktan aranmış.",
        ["successful_search"] = "Bir şey buldun!",
        ["failed_search"] = "Arama başarısız.",
        ["examine"] = "İncele",
        ["slightly_injured"] = "Hafif yaralı",
        ["injured"] = "Yaralı",
        ["severely_injured"] = "Ağır yaralı"
    },
    ["de"] = {
        ["greet"] = "Begrüßen",
        ["search"] = "Du durchsucht das Objekt",
        ["already_searched"] = "Dies wurde bereits durchsucht.",
        ["successful_search"] = "Du hast etwas gefunden!",
        ["failed_search"] = "Suche fehlgeschlagen.",
        ["examine"] = "Untersuchen",
        ["slightly_injured"] = "Leicht verletzt",
        ["injured"] = "Verletzt",
        ["severely_injured"] = "Schwer verletzt"
    },
    ["fr"] = {
        ["greet"] = "Saluer",
        ["search"] = "Vous cherchez l'objet",
        ["already_searched"] = "Cela a déjà été fouillé.",
        ["successful_search"] = "Vous avez trouvé quelque chose!",
        ["failed_search"] = "Recherche échouée.",
        ["examine"] = "Examiner",
        ["slightly_injured"] = "Légèrement blessé",
        ["injured"] = "Blessé",
        ["severely_injured"] = "Gravement blessé"
    },
    ["es"] = {
        ["greet"] = "Saludar",
        ["search"] = "Estás buscando el objeto",
        ["already_searched"] = "Esto ya ha sido buscado.",
        ["successful_search"] = "¡Has encontrado algo!",
        ["failed_search"] = "Búsqueda fallida.",
        ["examine"] = "Examinar",
        ["slightly_injured"] = "Ligeramente herido",
        ["injured"] = "Herido",
        ["severely_injured"] = "Gravemente herido"
    },
    ["it"] = {
        ["greet"] = "Salutare",
        ["search"] = "Stai cercando l'oggetto",
        ["already_searched"] = "Questo è già stato cercato.",
        ["successful_search"] = "Hai trovato qualcosa!",
        ["failed_search"] = "Ricerca fallita.",
        ["examine"] = "Esaminare",
        ["slightly_injured"] = "Leggermente ferito",
        ["injured"] = "Ferito",
        ["severely_injured"] = "Gravemente ferito"
    },
    ["pt"] = {
        ["greet"] = "Cumprimentar",
        ["search"] = "Você está procurando o item",
        ["already_searched"] = "Isto já foi pesquisado.",
        ["successful_search"] = "Você encontrou algo!",
        ["failed_search"] = "Pesquisa falhou.",
        ["examine"] = "Examinar",
        ["slightly_injured"] = "Levemente ferido",
        ["injured"] = "Ferido",
        ["severely_injured"] = "Gravemente ferido"
    },
    ["ru"] = {
        ["greet"] = "Приветствовать",
        ["search"] = "Вы ищете предмет",
        ["already_searched"] = "Это уже было обыскано.",
        ["successful_search"] = "Вы что-то нашли!",
        ["failed_search"] = "Поиск не удался.",
        ["examine"] = "Осмотреть",
        ["slightly_injured"] = "Легко ранен",
        ["injured"] = "Ранен",
        ["severely_injured"] = "Тяжело ранен"
    },
    ["zh"] = {
        ["greet"] = "打招呼",
        ["search"] = "你正在寻找物品",
        ["already_searched"] = "这已经被搜索过了。",
        ["successful_search"] = "你发现了什么！",
        ["failed_search"] = "搜索失败。",
        ["examine"] = "检查",
        ["slightly_injured"] = "轻伤",
        ["injured"] = "受伤",
        ["severely_injured"] = "重伤"
    },
    ["ja"] = {
        ["greet"] = "挨拶",
        ["search"] = "アイテムを検索しています",
        ["already_searched"] = "これらは既に検索されています。",
        ["successful_search"] = "何か見つけた！",
        ["failed_search"] = "検索に失敗しました。",
        ["examine"] = "調べる",
        ["slightly_injured"] = "軽傷",
        ["injured"] = "負傷",
        ["severely_injured"] = "重傷"
    },
    ["ko"] = {
        ["greet"] = "인사하다",
        ["search"] = "아이템을 검색 중입니다",
        ["already_searched"] = "이미 검색되었습니다.",
        ["successful_search"] = "무언가를 찾았습니다!",
        ["failed_search"] = "검색 실패.",
        ["examine"] = "검사",
        ["slightly_injured"] = "약간 부상",
        ["injured"] = "부상",
        ["severely_injured"] = "심각한 부상"
    },
    ["ar"] = {
        ["greet"] = "تحية",
        ["search"] = "أنت تبحث عن العنصر",
        ["already_searched"] = "تم البحث عن هذا بالفعل.",
        ["successful_search"] = "لقد وجدت شيئًا!",
        ["failed_search"] = "فشل البحث.",
        ["examine"] = "فحص",
        ["slightly_injured"] = "مصاب بجروح طفيفة",
        ["injured"] = "مصاب",
        ["severely_injured"] = "مصاب بجروح خطيرة"
    },
    ["nl"] = {
        ["greet"] = "Begroeten",
        ["search"] = "Je bent het object aan het doorzoeken",
        ["already_searched"] = "Dit is al doorzocht.",
        ["successful_search"] = "Je hebt iets gevonden!",
        ["failed_search"] = "Zoeken mislukt.",
        ["examine"] = "Onderzoeken",
        ["slightly_injured"] = "Lichtgewond",
        ["injured"] = "Gewond",
        ["severely_injured"] = "Zwaar gewond"
    },
    ["sv"] = {
        ["greet"] = "Hälsa",
        ["search"] = "Du söker föremålet",
        ["already_searched"] = "Detta har redan sökts.",
        ["successful_search"] = "Du hittade något!",
        ["failed_search"] = "Sökning misslyckades.",
        ["examine"] = "Undersöka",
        ["slightly_injured"] = "Lätt skadad",
        ["injured"] = "Skadad",
        ["severely_injured"] = "Allvarligt skadad"
    },
    ["no"] = {
        ["greet"] = "Hils",
        ["search"] = "Du søker etter elementet",
        ["already_searched"] = "Dette har allerede blitt søkt.",
        ["successful_search"] = "Du fant noe!",
        ["failed_search"] = "Søk mislyktes.",
        ["examine"] = "Undersøk",
        ["slightly_injured"] = "Lett skadet",
        ["injured"] = "Skadet",
        ["severely_injured"] = "Alvorlig skadet"
    },
    ["da"] = {
        ["greet"] = "Hilsen",
        ["search"] = "Du søger efter elementet",
        ["already_searched"] = "Dette er allerede blevet søgt.",
        ["successful_search"] = "Du fandt noget!",
        ["failed_search"] = "Søgning mislykkedes.",
        ["examine"] = "Undersøg",
        ["slightly_injured"] = "Lettere skadet",
        ["injured"] = "Skadet",
        ["severely_injured"] = "Alvorligt skadet"
    },
    ["fi"] = {
        ["greet"] = "Tervehtiä",
        ["search"] = "Etsit kohdetta",
        ["already_searched"] = "Tämä on jo haettu.",
        ["successful_search"] = "Löysit jotain!",
        ["failed_search"] = "Haku epäonnistui.",
        ["examine"] = "Tutkia",
        ["slightly_injured"] = "Lievästi loukkaantunut",
        ["injured"] = "Loukkantunut",
        ["severely_injured"] = "Vakavasti loukkaantunut"
    },
    ["pl"] = {
        ["greet"] = "Powitać",
        ["search"] = "Przeszukujesz przedmiot",
        ["already_searched"] = "To już zostało przeszukane.",
        ["successful_search"] = "Znalazłeś coś!",
        ["failed_search"] = "Nieudane wyszukiwanie.",
        ["examine"] = "Zbadać",
        ["slightly_injured"] = "Lekko ranny",
        ["injured"] = "Ranny",
        ["severely_injured"] = "Ciężko ranny"
    },
    ["cs"] = {
        ["greet"] = "Pozdravit",
        ["search"] = "Hledáte předmět",
        ["already_searched"] = "To již bylo prohledáno.",
        ["successful_search"] = "Našli jste něco!",
        ["failed_search"] = "Hledání selhalo.",
        ["examine"] = "Prozkoumat",
        ["slightly_injured"] = "Mírně zraněný",
        ["injured"] = "Zraněný",
        ["severely_injured"] = "Vážně zraněný"
    },
    ["hu"] = {
        ["greet"] = "Köszöntés",
        ["search"] = "Az elemet keresed",
        ["already_searched"] = "Ezt már megkeresték.",
        ["successful_search"] = "Találtál valamit!",
        ["failed_search"] = "A keresés sikertelen.",
        ["examine"] = "Megvizsgál",
        ["slightly_injured"] = "Enyhén sérült",
        ["injured"] = "Sérült",
        ["severely_injured"] = "Súlyosan sérült"
    }
}
