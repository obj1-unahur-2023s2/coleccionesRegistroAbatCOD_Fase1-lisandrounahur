

object registroAbatidosCOD {
	
	const dias = []
	const cantidadDeAbatidos = []
	
    method indexOf(element,list) {
        return (0..list.size()-1).find({index => list.get(index) == element})
    }    
	
	method agregarAbatidosDia(cantidad, dia){
		if(dias.contains(dia)){
			self.error("Ya existe registro para el dia indicado")
		}
		dias.add(dia)
		cantidadDeAbatidos.add(cantidad)
	}
	
	method agregarAbatidosVariosDias(listaCantidad, listaDia){
		
		if(listaCantidad.size() && listaDia.size()){
			dias.addAll(listaDia)
			cantidadDeAbatidos.addAll(listaCantidad)
		} else {
			self.error("El tamaño de las listas no coinciden")
		}
	}
	
	method eliminarElRegistroDelDia(dia){
		var index = self.indexOf(dia,dias)
		dias.remove(dia)
		cantidadDeAbatidos.remove(cantidadDeAbatidos.get(index))
	}
	
	method eliminarLosRegistrosDeDias(listaDia){
		listaDia.forEach
	}
	
	// Consultas
	
	method cantidadDeDiasRegistrados(){
		return dias.size()
	}
	
	method estaVacioElRegistro(){
		return dias.isEmpty()
	}
	
	method algunDiaAbatio(cantidad){
		return !cantidad.all({item => item != cantidad})
	}
	
	method primerValorDeAbatidos(){
		return cantidadDeAbatidos.get(0)
	}
	
	method ultimoValorDeAbatidos(){
		return cantidadDeAbatidos.last()
	}
	
	method maximoValorDeAbatidos(){
		return cantidadDeAbatidos.max()
	}
	
	method totalAbatidos(){
		return cantidadDeAbatidos.fold(0,{acum, item => item + acum})
	}
	
	method cantidadDeAbatidosElDia(dia){
		var index = self.indexOf(dia, dias)
		return cantidadDeAbatidos.get(index)
	}
	
	method ultimoValorDeAbatidosConSize(){
		return cantidadDeAbatidos.get(cantidadDeAbatidos.size()-1)
	}
	
	method diasConAbatidosSuperrioresA(cuanto){
		return cantidadDeAbatidos.filter({ item => item > cuanto }).size()
	}
	
	method valoresDeAbatidosPares(){
		return cantidadDeAbatidos.filter({ abatidos => abatidos % 2 == 0 })
	}
	
	method elValorDeAbatidos(cantidad){
		return cantidadDeAbatidos.find(cantidad)
	}
	
	method abatidosSumando(cantidad){
		return cantidadDeAbatidos.map({elem => elem + cantidad})
	}
	
	method abatidosEsAcotada(r1, r2){
		return cantidadDeAbatidos.all({ numero => numero > r1 and numero < r2})
	}
	
	method algunDiaAbatioMasDe(cantidad){
		return !cantidadDeAbatidos.all({numero => numero < cantidad})
	}
	
	method todosLosDiasAbatioMasDe(cantidad){
		return cantidadDeAbatidos.all({numero => numero > cantidad})
	}
	
	method cantidadAbatidosMayorALaPrimera(){
		return cantidadDeAbatidos.filter({ cantidad => cantidad > cantidadDeAbatidos.first()})
	}
	
	method esCrack(){
		const indexs = (1..cantidadDeAbatidos.size()-1)
		return indexs.all({ i => cantidadDeAbatidos.get(i-1) < cantidadDeAbatidos.get(i)})
	}
	
	
	
	
}