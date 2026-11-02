import imperio.*

class Habitante{

    var energia

    method energiaPerdida(tarea) {
      self.ValidarTarea(tarea.recursosProducidos(self.tiempoQueEjercita()) / self.indiceDeResistencia())
      return tarea.recursosProducidos(self.tiempoQueEjercita()) / self.indiceDeResistencia()
    }

    method tiempoQueEjercita()

    method ValidarTarea(energiaAPerder) {
      
      if (self.energiaActual() < energiaAPerder){
        self.error("No tengo suficiente energia")
      }
    }


    method energiaActual(){
       return energia
    }

    method nuevaEnergiaActual(energiaNueva){
      energia = energiaNueva
    }

    method indiceDeResistencia()

    method realizarTarea(tarea) {
      energia -= self.energiaPerdida(tarea)
    }

}

class HabitanteCampesino inherits Habitante{

  const tiempoDeEjercicio 

  override method indiceDeResistencia(){
    return 10
  }

  override method tiempoQueEjercita(){
    return tiempoDeEjercicio
  }

}

class HabitanteDeElite inherits Habitante{

  override method indiceDeResistencia(){
    return 12
  }

  override method tiempoQueEjercita(){
    return 10
  }

  
  override method energiaPerdida(tarea) {
    return super(tarea) - 5
  }

  override method realizarTarea(tarea) {
      if(tarea.recursosProducidos(self.tiempoQueEjercita()) > 500){
        super(tarea)
      }
    }

}