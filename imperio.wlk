class Tarea{

    var property esfuerzo 

    method recursosProducidos(tiempo) {
      return 50 * (tiempo - self.desgaste(tiempo)) * self.esfuerzo()
    }

    method desgaste(tiempo)

    //method esfuerzo()

    method tiempoNormalDeTrabajo() 

}

class Siembra inherits Tarea{

  override method desgaste(tiempo) {
    if(tiempo > self.tiempoNormalDeTrabajo()){
      return self.tiempoNormalDeTrabajo() - tiempo
    }else{
      return 1
    }
  }



}