import emociones.EmocionNoAlegre.EmocionNoAlegre

object tristeza inherits EmocionNoAlegre {
	method asentar(unRecuerdo, unaChica) {
    unaChica.centralizar(unRecuerdo)
    unaChica.entristecerEnProporcion(0.1)
	}
	
	 method niega(unRecuerdo) {
    return unRecuerdo.esAlegre()
  }
}
