class CompaniesInformation {
  double total_holdings = 0;
  double total_value_usd = 0;
  double market_cap_dominance = 0;
  List<Company> companies = [];
}

class Company {
  String name = " ";
  String symbol = " ";
  String country = "";
  double total_holdings = 0;
  double total_entry_value_usd = 0;
  double total_current_value_usd = 0;
  double percentage_of_total_supply = 0;
}
