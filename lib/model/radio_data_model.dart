class BrandsList {
  String name;
  int index;

  BrandsList({required this.index, required this.name});
}

List<BrandsList> brandsList = [
  new BrandsList(index: 1, name: "ALL"),
  new BrandsList(index: 2, name: "IPHONE"),
  new BrandsList(index: 3, name: "SAMSUNG"),
  new BrandsList(index: 4, name: "OPPO"),
  new BrandsList(index: 5, name: "VIVO"),
  new BrandsList(index: 6, name: "MI"),
  new BrandsList(index: 7, name: "HONOR"),
  new BrandsList(index: 8, name: "OTHERS"),
];

class SpecialistList {
  String name;
  int index;

  SpecialistList({required this.index, required this.name});
}

List<SpecialistList> specialistList = [
  new SpecialistList(index: 1, name: "Iphone Repair Specialist"),
  new SpecialistList(index: 2, name: "Front Glass and Touch Change Specialist"),
  new SpecialistList(index: 3, name: "Edge Glass Change Specialist"),
  new SpecialistList(
      index: 4, name: "Specialist to Give Fast Service To Our Customers"),
  new SpecialistList(index: 5, name: "All Of The Above"),
  new SpecialistList(index: 6, name: "None Of These"),
  new SpecialistList(index: 7, name: "Others"),
];

class AgreeList {
  String name;
  int index;

  AgreeList({required this.name, required this.index});
}

List<AgreeList> agreeList = [
  new AgreeList(name: "YES", index: 1),
  new AgreeList(name: "NO", index: 2),
  new AgreeList(name: "OTHERS", index: 3),
];
