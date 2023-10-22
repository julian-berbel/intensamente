import Evento.Evento
import excepciones.QuedoMuyTristeException.QuedoMuyTristeException

class Chica {
	var nivelDeFelicidad = 1000
	var emocionDominante
	var edad
	var pensamientoActual
	
	const recuerdosDelDia = #{}
	const pensamientosCentrales = #{}
	const procesosMentales = #{}
	const memoriaALargoPlazo = []
	
	method vivirUnEvento(unaDescripcion) {
	  recuerdosDelDia.add(
	    new Evento(
	      descripcion = unaDescripcion,
	      fecha = new Date(),
	      emocionDominante = emocionDominante
	    )
	  )
	}
	
	method asentar(unRecuerdo) {
	  unRecuerdo.asentarEn(self)
	}
	
	method estaFeliz() {
	  return nivelDeFelicidad > 500
	}
	
	method centralizar(unRecuerdo) {
	  pensamientosCentrales.add(unRecuerdo)
	}
	
	method entristecerEnProporcion(unPorcentaje) {
	  const nuevoNivelDeFelicidad = nivelDeFelicidad * (1 - unPorcentaje)
	  
	  if (nivelDeFelicidad < 1) throw new QuedoMuyTristeException()
	  
	  nivelDeFelicidad = nuevoNivelDeFelicidad
	}
	
	method recuerdosRecientes() {
	  return recuerdosDelDia.take(5)
	}
	
	method pensamientosCentrales() {
	  return pensamientosCentrales
	}
	
	method pensamientosCentralesDificilesDeExplicar() {
	  return pensamientosCentrales.filter { unPensamiento => unPensamiento.esDificilDeExplicar() }
	}
	
	method niega(unRecuerdo) {
	  return emocionDominante.niega(unRecuerdo)
	}
	
	method dormir() {
	  procesosMentales.forEach { unProcesoMental => unProcesoMental.efectuarSobre(self) }
	}
	
	method asentarRecuerdos(unosRecuerdos) {
	  unosRecuerdos.forEach { unRecuerdo => self.asentar(unRecuerdo) }
	}
	
	method recuerdosDelDia() {
	  return recuerdosDelDia
	}
	
	method recuerdosDelDiaQueIncluyen(unaPalabra) {
	  return recuerdosDelDia.filter { unRecuerdo => unRecuerdo.incluye(unaPalabra) }
	}
	
	method memorizar(unosRecuerdos) {
	  memoriaALargoPlazo.addAll(unosRecuerdos)
	}
	
	method profundizarRecuerdos() {
	  self.memorizar(self.recuerdosMemorizables())
	}
	
	method recuerdosMemorizables() {
	  return self.recuerdosNoCentralesDelDia().filter { unRecuerdo => !emocionDominante.niega(unRecuerdo) }
	}
	
	method recuerdosNoCentralesDelDia() {
	  return recuerdosDelDia.difference(pensamientosCentrales)
	}
	
	method estaDesequilibrada() {
	  return self.estaRecordandoElPasado() || self.tuvoDiaMonotono()
	}
	
	method estaRecordandoElPasado() {
	  return pensamientosCentrales.any { unPensamiento => memoriaALargoPlazo.contains(unPensamiento) }
	}
	
	method tuvoDiaMonotono() {
	  return recuerdosDelDia.all { unRecuerdo => unRecuerdo.esDeEmocion(self.emocionDelDia()) }
	}
	
	method emocionDelDia() {
	  return recuerdosDelDia.last().emocionDominante()
	}
	
	method producirDesequilibrioHormonal() {
	  self.entristecerEnProporcion(0.15)
	  
	  pensamientosCentrales.removeAll(self.pensamientosCentralesPorAntiguedad().take(3))
	}
	
	method pensamientosCentralesPorAntiguedad() {
	  return pensamientosCentrales.sortedBy { unPensamiento, otroPensamiento => unPensamiento.esMasAntiguoQue(otroPensamiento) }
	}
	
	method alegrar(unaCantidad) {
	  nivelDeFelicidad = (nivelDeFelicidad + unaCantidad).min(1000)
	}
	
	method liberarRecuerdosDelDia() {
	  recuerdosDelDia.clear()
	}
	
	method rememorar() {
	  pensamientoActual = self.recuerdosViejos().anyOne()
	}
	
	method recuerdosViejos() {
	  return memoriaALargoPlazo.filter { unRecuerdo => unRecuerdo.pasoHaceMasDeNAnios(edad / 2) }
	}
	
	method cuantasVecesRecuerda(unRecuerdo) {
	  return memoriaALargoPlazo.occurrencesOf(unRecuerdo)
	}
	
	method tieneUnDejaVu() {
	  return memoriaALargoPlazo.contains(pensamientoActual)
	}
}
