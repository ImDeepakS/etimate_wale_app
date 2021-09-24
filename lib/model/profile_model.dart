class ProfileDetails {
  String username = "", phoneno = "", email = "", zipcode = "", address = "";

  String rollId = "";

  String get user_name {
    return username;
  }

  set user_name(String user) {
    this.username = user;
  }

  String get phone_no {
    return phoneno;
  }

  set phone_no(String phone) {
    this.phoneno = phone;
  }

  String get e_mail {
    return email;
  }

  set e_mail(String mail) {
    this.email = mail;
  }

  String get zip_code {
    return zipcode;
  }

  set zip_code(String code) {
    this.zipcode = code;
  }

  String get address_txt {
    return address;
  }

  set address_txt(String adr) {
    this.address = adr;
  }

  String get role_id {
    return rollId;
  }

  set role_id(String id) {
    this.rollId = id;
  }
}
