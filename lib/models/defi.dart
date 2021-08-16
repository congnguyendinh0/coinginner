class DefiData {
  String defi_market_cap = "";
  String eth_market_cap = "";
  String defi_to_eth_ratio = "";
  String trading_volume_24h = "";
  String defi_dominance = "";
  String top_coin_name = "";
  double top_coin_defi_dominance = 0;

  DefiData(
      {String? defi_market_cap,
      String? eth_market_cap,
      String? defi_to_eth_ratio,
      String? trading_volume_24h,
      String? defi_dominance,
      String? top_coin_name,
      double? top_coin_defi_dominance}) {
    this.defi_market_cap = defi_market_cap ?? "";
    this.eth_market_cap = eth_market_cap ?? "";
    this.defi_to_eth_ratio = defi_to_eth_ratio ?? "";
    this.trading_volume_24h = trading_volume_24h ?? "";
    this.defi_dominance = defi_dominance ?? "";
    this.top_coin_name = top_coin_name ?? "";
    this.top_coin_defi_dominance = top_coin_defi_dominance ?? 0;
  }
  factory DefiData.fromJSON(Map<String, dynamic> json) {
    return DefiData(
      defi_market_cap: json["defi_market_cap"],
      eth_market_cap: json["eth_market_cap"],
      defi_to_eth_ratio: json["defi_to_eth_ratio"],
      trading_volume_24h: json["trading_volume_24h"],
      defi_dominance: json["defi_dominance"],
      top_coin_name: json["top_coin_name"],
      top_coin_defi_dominance: json["top_coin_defi_dominance"],
    );
  }
}
