import emociones.EmocionNoAlegre.EmocionNoAlegre

class EmocionPasiva inherits EmocionNoAlegre {
  method asentar(unRecuerdo, unaChica) {
    
  }
  
  method niega(unRecuerdo) {
    return false
  }
}

const furia = new EmocionPasiva()
const temor = new EmocionPasiva()
const disgusto = new EmocionPasiva()