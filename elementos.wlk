import plagas.*

class Hogar {
    var mugre
    var confort
    method esBueno() = confort >= mugre / 2
    method atacarCon(unaPlaga) {
        mugre += unaPlaga.daño()
    }
}

class Huerta {
    var produccion
    method esBueno() = produccion > nivelMinimoProduccion.valor()
    method atacarCon(unaPlaga) {
        if (unaPlaga.transmiteEnfermedades()) produccion = 0.max(produccion - unaPlaga.daño() * 0.1 - 10) 
        else produccion = 0.max(produccion - unaPlaga.daño() * 0.1)
    }
}

object nivelMinimoProduccion {
    var property valor = 100
}

class Mascota { 
    var salud 
    method esBueno() = salud > 250
    method atacarCon(unaPlaga) {
        if (unaPlaga.transmiteEnfermedades()) salud = 0.max(salud - unaPlaga.daño())
    }
}

class Barrio {
    const elementos = []
    method esBueno(unElemento) = unElemento.esBueno()
    method esCopado() = self.cantElementosBuenos() > self.cantElementosMalos()
    method cantElementosBuenos() = elementos.count({e=>e.esBueno()})
    method cantElementosMalos() = elementos.size() - self.cantElementosBuenos()
}