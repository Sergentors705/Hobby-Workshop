enum Status { unassembled, assembled, basecoated, painted }

class Miniature {
  final String name;
  final String game;
  final String faction;
  final Status status;

  Miniature({
    required this.name,
    required this.game,
    required this.faction,
    required this.status,
  });
}
