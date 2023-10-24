class Partido {}

class _GameSet {}

//La clase juego maneja cada uno de los jeugos dentro de un set
//La barra baja se utiliza para indicar que es privada
class _Juego {
  //Lista para simplificar la logica al manejar los puntos y dos variables
  //para llevar la cuenta de los puntos dentro del juego
  //final se utiliza para indicar que la variable no va a cambiar
  final List<String> _listPuntos = ["00", "15", "30", "40", "AV"];
  late int _pJueLoc;
  late int _pJueVis;

  _Juego() {
    _pJueLoc = 0;
    _pJueVis = 0;
  }

  /*Añade un punto al contador al juegador local, devuelve true si termina el juego */
  bool addPuntoLocal() {
    //Sumo el punto al Local
    _pJueLoc++;
    //Compruebo si tiene 40 o mas puntos y si tiene ventaja de dos, si es asi devuelve true
    if (_pJueLoc > 3 && (_pJueLoc - _pJueVis) >= 2) {
      return true;
      //En el caso de que empanten a AV vuelven ambos a 40 puntos y devuelve false
    } else if (_pJueLoc == 4 && _pJueVis == 4) {
      _pJueLoc = 3;
      _pJueVis = 3;
      return false;
    } else {
      //Si no hay ninguna situacion especial devuelve false
      return false;
    }
  }

/*Añade un punto al contador al juegador local, devuelve true si termina el juego */
//funciona igual que el addPuntoLocal()
  bool addPuntoVisitante() {
    _pJueVis++;
    if (_pJueVis > 3 && (_pJueVis - _pJueLoc) >= 2) {
      return true;
    } else if (_pJueLoc == 4 && _pJueVis == 4) {
      _pJueLoc = 3;
      _pJueVis = 3;
      return false;
    } else {
      return false;
    }
  }

  //Obtener los valores del juego, traducciendo los valores de los puntos
  //de numeros enteros a como se puntua en el tenis

  Map getPuntos() {
    return <String, String>{
      "Puntos Local": _listPuntos[_pJueLoc],
      "Puntos Visitante": _listPuntos[_pJueVis]
    };
  }
}
