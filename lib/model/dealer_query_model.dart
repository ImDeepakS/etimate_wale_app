class DealerQueriesModel {
  final String mobileName, distance, problem, amount;
  final int srNo;

  DealerQueriesModel({
    required this.mobileName,
    required this.distance,
    required this.problem,
    required this.amount,
    required this.srNo,
  });
}

List<DealerQueriesModel> dealerQueryData = [
  new DealerQueriesModel(
    mobileName: "IPhone 6",
    distance: "5 KM",
    problem: "LCD Broken",
    amount: "5000",
    srNo: 1,
  ),
  new DealerQueriesModel(
    mobileName: "IPhone 6",
    distance: "5 KM",
    problem: "LCD Broken",
    amount: "5000",
    srNo: 2,
  ),
  new DealerQueriesModel(
    mobileName: "IPhone 6",
    distance: "5 KM",
    problem: "LCD Broken",
    amount: "5000",
    srNo: 3,
  ),
];
