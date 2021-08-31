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
  double priceChangePercentage30dInCurrency = 0;
  double priceChangePercentage1yInCurrency = 0;
  Map<String, dynamic> sparkline = Map();
  // Sparkline sparkline;

  Cryptocurrency(
      {String? id = "",
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

      // checken nochmal
      Map<String, dynamic>? sparkline = null}) {
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

    this.sparkline = sparkline ?? {};

    // pruefen
  }

  factory Cryptocurrency.fromJSON(Map<String, dynamic> json) {
    return Cryptocurrency(
      id: json["id"],
      symbol: json["symbol"],
      name: json["name"],
      image: json["image"],
      currentPrice: (json["current_price"])?.toDouble() ?? 0.0,
      marketCap: (json["market_cap"])?.toDouble() ?? 0.0,
      marketCapRank: (json["market_cap_rank"])?.toDouble() ?? 0.0,
      fullyDilutedValuation:
          (json["fully_diluted_valuation"])?.toDouble() ?? 0.0,
      totalVolume: (json["total_volume"])?.toDouble() ?? 0.0,
      high24h: (json["high_24h"])?.toDouble() ?? 0.0,
      low24h: (json["low_24h"])?.toDouble() ?? 0.0,
      priceChange24h: (json["price_change_24h"])?.toDouble() ?? 0.0,
      priceChangePercentage24h:
          (json["price_change_percentage_24h"])?.toDouble() ?? 0.0,
      marketCapChange24h: (json["market_cap_change_24h"])?.toDouble() ?? 0.0,
      marketCapChangePercentage24h:
          (json["market_cap_change_percentage_24h"])?.toDouble() ?? 0.0,
      circulatingSupply: (json["circulating_supply"])?.toDouble() ?? 0.0,
      totalSupply: (json["total_supply"])?.toDouble() ?? 0.0,
      maxSupply: (json["max_supply"])?.toDouble() ?? 0.0,
      ath: (json["ath"])?.toDouble() ?? 0.0,
      athChangePercentage: (json["ath_change_percentage"])?.toDouble() ?? 0.0,
      athDate: json["ath_date"] ?? '',
      atl: (json["atl"])?.toDouble() ?? 0.0,
      atlChangePercentage: (json["atl_change_percentage"])?.toDouble() ?? 0.0,
      atlDate: json["atl_date"] ?? '',
      roi: json["roi"],
      lastUpdated: json["last_updated"],
      //pruefen
      sparkline: json["sparkline_in_7d"],
      priceChangePercentage7dInCurrency:
          (json["price_change_percentage_7d_in_currency"])?.toDouble() ?? 0.0,
    );
  }
}

// class Sparkline {
//   List<double> price = [];

//   Sparkline({List<double>? price}) {
//     this.price = price ?? [];
//   }

//   factory Sparkline.fromJson(Map<String, dynamic> json) {
//     return Sparkline(price: json["price"]);
//   }
// }
