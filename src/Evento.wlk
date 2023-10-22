import emociones.alegria.alegria

class Evento {
  const descripcion
  const fecha
  const emocionDominante

  method asentarEn(unaChica) {
    emocionDominante.asentar(self, unaChica)
  }

  method esDificilDeExplicar() {
    return descripcion.words().size() > 10
  }

  method esAlegre() {
    return self.esDeEmocion(alegria)
  }

  method incluye(unaPalabra) {
    return descripcion.contains(unaPalabra)
  }

  method esDeEmocion(unaEmocion) {
    return emocionDominante == unaEmocion
  }

  method esMasAntiguoQue(otroEvento) {
    return otroEvento.pasoDespuesDe(fecha)
  }

  method pasoDespuesDe(unaFecha) {
    return fecha > unaFecha
  }

  method pasoHaceMasDeNAnios(unosAnios) {
    return new Date().year() - fecha.year() > unosAnios
  }
}
