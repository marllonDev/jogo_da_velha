import 'package:jogo_da_velha/widgets/type_house.dart';

class TrayGame {
  var cardHouse = List<TypeHouse>.filled(9, TypeHouse.empty);

  //marcar a cardHouse
  void markHouse(int index, TypeHouse houseValue) {
    cardHouse[houseValue.index] = houseValue;
  }

  //passar a vez para o outro jogador
  void passTurn(int index, TypeHouse houseValue) {
    cardHouse[houseValue.index] == TypeHouse.X ? TypeHouse.O : TypeHouse.X;
  }

  //verificar se o jogador ganhou
  bool checkWin() {
    for (int i = 0; i < 9; i++) {
      if (cardHouse[i] == TypeHouse.empty) {
        return false;
      }
    }
    return true;
  }
}
