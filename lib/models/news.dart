// https://api.coinstats.app/public/v1/news/trending?skip=0&limit=4

class News {
  String id = "";
  int feedDate = 0;
  String title = "";
  String icon = "";
  String imgURL = "";
  String link = "";
  String sourceLink = "";
  String description = "";
  List<String> relatedCoins = [];
  Object reactionsCount = 1;
  List<Coin> coins = [];
  News(
      {String? id,
      int? feedDate,
      String? title,
      String? icon,
      String? imgURL,
      String? link,
      String? sourceLink,
      String? description}) {
    this.id = id ?? "";
    this.feedDate = feedDate ?? 0;
    this.title = title ?? "";
    this.description = description ?? "";
    this.sourceLink = sourceLink ?? "";
    this.icon = icon ?? "";
    this.link = link ?? "";
    this.imgURL = imgURL ?? "";
  }

  factory News.fromJSON(Map<String, dynamic> json) {
    return News(
      imgURL: json["imgURL"],
      id: json["id"],
      feedDate: json["feedDate"],
      title: json["title"],
      description: json["description"],
      sourceLink: json["sourceLink"],
      icon: json["icon"],
      link: json["link"],
    );
  }
}

class Coin {
  String coinKeyWords = "";
  double coinPercent = 0;
  String coinTitleKeyWords = "";
  String coinNameKeyWords = "";
  String coinIdKeyWords = "";
  Coin(String? coinKeyWords, double? coinPercent, String? coinTitleKeyWords,
      String? coinNameKeyWords, String? coinIdKeyWords) {
    this.coinIdKeyWords = "";
    this.coinPercent = 0;
    this.coinTitleKeyWords = "";
    this.coinNameKeyWords = "";
    this.coinIdKeyWords = "";
  }
}
