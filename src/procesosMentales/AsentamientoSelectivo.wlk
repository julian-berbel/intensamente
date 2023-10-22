import procesosMentales.ProcesoDeAsentamiento.ProcesoDeAsentamiento

class AsentamientoSelectivo inherits ProcesoDeAsentamiento {
  const palabraClave

  override method recuerdosAAsentar(unaChica) {
    return unaChica.recuerdosDelDiaQueIncluyen(palabraClave)
  }
}
