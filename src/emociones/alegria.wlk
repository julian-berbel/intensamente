object alegria {
	method asentar(unRecuerdo, unaChica) {
	  if (unaChica.estaFeliz()) {
	    unaChica.centralizar(unRecuerdo)
	  }
	}
	
	method niega(unRecuerdo) {
	  return !unRecuerdo.esAlegre()
	}
	
	method esAlegre() {
	  return true
	}
}
