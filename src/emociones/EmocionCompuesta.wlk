class EmocionCompuesta {
  const componentes = #{}
  
	method asentar(unRecuerdo, unaChica) {
	  componentes.forEach { unaComponente => unaComponente.asentar(unRecuerdo, unaChica) }
	}
	
	method niega(unRecuerdo) {
    return componentes.all { unaComponente => unaComponente.niega(unRecuerdo) }
  }
  
  method esAlegre() {
    return componentes.any { unaComponente => unaComponente.esAlegre() }
  }
}
