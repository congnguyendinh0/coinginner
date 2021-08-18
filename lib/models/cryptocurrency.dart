class Cryptocurrency {
  String id = "";
  String symbol = "";
  String name = "";
  String image = "";
  double currentPrice = 0;
  double marketCap = 0;
  double marketCapRank = 0;
  double fullyDilutedValuation = 0;
  double totalVolume = 0;
  double high24h = 0;
  double low24h = 0;
  double priceChange24h = 0;
  double priceChangePercentage24h = 0;
  double marketCapChange24h = 0;
  double marketCapChangePercentage24h = 0;
  double circulatingSupply = 0;
  double totalSupply = 0;
  double maxSupply = 0;
  double ath = 0;
  double athChangePercentage = 0;
  String athDate = "";
  double atl = 0;
  double atlChangePercentage = 0;
  String atlDate = "";
  dynamic roi = 0;
  String lastUpdated = "";
  double priceChangePercentage7dInCurrency = 0;

  Cryptocurrency({
    String? id = "",
    String? symbol = "",
    String? name = "",
    String? image = "",
    double? currentPrice = 0,
    double? marketCap = 0,
    double? marketCapRank = 0,
    double? fullyDilutedValuation = 0,
    double? totalVolume = 0,
    double? high24h = 0,
    double? low24h = 0,
    double? priceChange24h = 0,
    double? priceChangePercentage24h = 0,
    double? marketCapChange24h = 0,
    double? marketCapChangePercentage24h = 0,
    double? circulatingSupply = 0,
    double? totalSupply = 0,
    double? maxSupply = 0,
    double? ath = 0,
    double? athChangePercentage = 0,
    String? athDate = "",
    double? atl = 0,
    double? atlChangePercentage = 0,
    String? atlDate = "",
    dynamic roi = 0,
    String? lastUpdated = "",
    double? priceChangePercentage7dInCurrency = 0,
  }) {
    this.id = id ?? "";
    this.symbol = symbol ?? "";
    this.name = name ?? "";
    this.image = image ?? "";
    this.currentPrice = currentPrice ?? 0;
    this.marketCap = marketCap ?? 0;
    this.marketCapRank = marketCapRank ?? 0;
    this.fullyDilutedValuation = fullyDilutedValuation ?? 0;
    this.totalVolume = totalVolume ?? 0;
    this.high24h = high24h ?? 0;
    this.low24h = low24h ?? 0;
    this.priceChange24h = priceChange24h ?? 0;
    this.priceChangePercentage24h = priceChangePercentage24h ?? 0;
    this.marketCapChange24h = marketCapChange24h ?? 0;
    this.marketCapChangePercentage24h = marketCapChangePercentage24h ?? 0;
    this.circulatingSupply = circulatingSupply ?? 0;
    this.totalSupply = totalSupply ?? 0;
    this.maxSupply = maxSupply ?? 0;
    this.ath = ath ?? 0;
    this.athChangePercentage = athChangePercentage ?? 0;
    this.athDate = athDate ?? "";
    this.atl = atl ?? 0;
    this.atlDate = atlDate ?? "";
    this.roi = roi ?? 0;
    this.lastUpdated = lastUpdated ?? "";
    this.priceChangePercentage7dInCurrency =
        priceChangePercentage7dInCurrency ?? 0;
  }

  factory Cryptocurrency.fromJSON(Map<String, dynamic> json) {
    return Cryptocurrency(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        image: json["image"],
        currentPrice: json["current_price"],
        marketCap: json["market_cap"],
        marketCapRank: json["market_cap_rank"],
        fullyDilutedValuation: json["fully_diluted_valuation"],
        totalVolume: json["total_volume"],
        high24h: json["high_24h"],
        low24h: json["low_24h"],
        priceChange24h: json["price_change_24h"],
        priceChangePercentage24h: json["price_change_percentage_24h"],
        marketCapChange24h: json["market_cap_change_24h"],
        marketCapChangePercentage24h: json["market_cap_change_percentage_24h"],
        circulatingSupply: json["circulating_supply"],
        totalSupply: json["total_supply"],
        maxSupply: json["max_supply"],
        ath: json["ath"],
        athChangePercentage: json["ath_change_percentage"],
        athDate: json["ath_date"],
        atl: json["atl"],
        atlChangePercentage: json["atl_change_percentage"],
        atlDate: json["atl_date"],
        roi: json["roi"],
        lastUpdated: json["last_updated"],
        priceChangePercentage7dInCurrency:
            json["price_change_percentage_7d_in_currency"]);
  }
}
