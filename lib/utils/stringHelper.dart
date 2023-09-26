String shortAddress({required String address}) {
  return "${address.substring(0, 5)}...${address.substring(address.length - 5)}";
}