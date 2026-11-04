import imperio.*
import habitantes.*


object ayllu {
  const colcas = #{}

  method laMejorColcaPara(habitante) {
    return colcas.max({colca => colca.cantRecursosQueProduce(habitante)})
  }

  method colcasSuavesPara(habitante) {
    return colcas.filter({colca => colca.tieneAlMenosUnaTareaQuProduceMenos(habitante)})
  }

  method tareasMasExigentesPara(habitante) {
    return colcas.map({colca => colca.tareaMasExigentePara(habitante)}).asSet()
  }

  method agregarColca(colca) {
    colcas.add(colca)
  }

  
}


class Colca {
  const tareasHabilitadas = #{}

  method cantRecursosQueProduce(habitante) {
    return tareasHabilitadas.sum({tarea => tarea.recursosProducidos(habitante.tiempoQueEjercita())})
  }

  method tieneAlMenosUnaTareaQuProduceMenos(habitante) {
    return tareasHabilitadas.any({tarea => tarea.recursosProducidos(habitante.tiempoQueEjercita()) < 200})
  }

  method tareaMasExigentePara(habitante) {
    return tareasHabilitadas.max({tarea => tarea.recursosProducidos(habitante.tiempoQueEjercita())})
  }
}

/*
* Conocer las tareas más exigentes del Ayllu para un habitante: 
Es el conjunto formado por la tarea más exigente de cada Colca para ese habitante. 
La tarea más exigente es la que más recursos le hace producir al habitante.

*/