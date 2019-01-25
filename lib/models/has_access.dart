abstract class HasAccess {
  String get owner;

  Map<String, int> get members;

  bool hasReadAccess(String id) {
    if (owner == id) return true;
    if (members == null) return false;
    return members.containsKey(id);
  }

  bool hasWriteAccess(String id) {
    if (owner == id) return true;
    if (members == null) return false;
    final rights = members[id];
    if (rights == null) return false;
    return (rights & 0x01) != 0;
  }
}
