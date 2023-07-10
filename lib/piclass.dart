class PIItem {
  final String id;
  final String fullname;
  final String email;
  final String tel;
  final String address;
  final String postcode;
  final bool done;
  PIItem(
      {required this.id,
      required this.fullname,
      required this.email,
      required this.tel,
      required this.address,
      required this.postcode,
      required this.done});

  factory PIItem.fromMap(Map map) {
    return PIItem(
        id: map["id"],
        fullname: map["fullname"],
        email: map["email"],
        tel: map["tel"],
        address: map["address"],
        postcode: map["postcode"],
        done: map["done"] == 1);
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullname': fullname,
      'email': email,
      'tel': tel,
      'address': address,
      'postcode': postcode,
      'done': done ? 1 : 0,
    };
  }
}
