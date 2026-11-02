class Tarea{

    method recursosProducidos(tiempo) {
      return 50 * (tiempo - self.desgaste(tiempo)) * self.esfuerzo()
    }

    method desgaste(tiempo)

    method esfuerzo()
}

class Siembra inherits Tarea{
  const esfuerzo

  override method esfuerzo() = esfuerzo

  method tiempoNormalDeTrabajo()


  override method desgaste(tiempo) {
    if (tiempo > self.tiempoNormalDeTrabajo()){
      return 1 + (tiempo - self.tiempoNormalDeTrabajo())
    }else{
      return 1
    }
  }
}

class SiembraEnElValle inherits Siembra{
  override method tiempoNormalDeTrabajo(){
    return 8
  }

  override method recursosProducidos(tiempo) {
    if(estacion.esEpocaDeLLuvia()){
      return 0
    }else{
      return super(tiempo)
    }
    
  }
}

class SiembraEnTerrazas inherits Siembra{
  override method tiempoNormalDeTrabajo(){
    return 6
  }

  override method recursosProducidos(tiempo) {
    return super(tiempo) * 3
  }
}


class Mensaje inherits Tarea {
  override method desgaste(tiempo) {
    return tiempo/4
  }

  override method esfuerzo(){
    return 1.4
  }
}

class MensajeImperial inherits Mensaje {
  override method desgaste(tiempo) {
    return 1.max(super(tiempo) - 2)
  }  

  override method esfuerzo(){
    return 1.8
  }

}

/*
Mensaje imperial: Es un tipo especial de mensaje que lleva mensajes
urgentes con las siguientes diferencias. El esfuerzo es siempre 1.8 y el desgaste 
es de 2 horas menos de lo que se desgasta con un mensaje normal, pero el valor 1 es el mínimo posible.
*/
object estacion {
  method esEpocaDeLLuvia() {
    return false
  }
}