abstract class HasAccess {
  String get owner;
  Map<String, int> get members;

  bool hasReadAccess(String id) {
    if (owner == id) return true;
    return members.containsKey(id);
  }

  bool hasWriteAccess(String id) {
    if (owner == id) return true;
    final rights = members[id];
    if (rights == null) return false;
    return (rights & 0x01) != 0;
  }
}
