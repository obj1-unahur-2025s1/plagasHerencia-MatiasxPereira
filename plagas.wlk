import elementos.*
class Plaga { 
    var poblacion
    method transmiteEnfermedades() = poblacion >= 10 && self.condicionAdicional()
    method condicionAdicional() = true
    method daño() = poblacion
    method efectoAlAtacar() = poblacion * 1.1
    method atacar(unElemento) {self.efectoAlAtacar() unElemento.atacarCon(self)}
}


class Cucarachas inherits Plaga {
    var pesoPromedioBicho
    override method daño() = super() / 2
    override method condicionAdicional() = pesoPromedioBicho >= 10
    override method efectoAlAtacar() = super() && pesoPromedioBicho + 2dog
}


class Pulgas inherits Plaga {
    override method daño() = super() * 2
}

class Garrapatas inherits Pulgas {
    override method efectoAlAtacar() = super() + poblacion * 0.1
}

class Mosquitos inherits Plaga { 
    override method condicionAdicional() = poblacion % 3 == 0
}