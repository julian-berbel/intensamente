import procesosMentales.ProcesoDeAsentamiento.ProcesoDeAsentamiento

object asentamiento inherits ProcesoDeAsentamiento {
  override method recuerdosAAsentar(unaChica) {
    return unaChica.recuerdosDelDia()
  }
}
