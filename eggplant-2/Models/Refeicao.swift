//
//  Refeicao.swift
//  eggplant-2
//
//  Created by Kangu Tecnologia on 05/11/22.
//

import UIKit

class Refeicao: NSObject {
    var nome: String
    var felicidade: Int
    var items: [Item] = []
    
    init(nome: String, felicidade: Int) {
        self.nome = nome
        self.felicidade = felicidade
    }
    
    func totalDeCaloriasRefeicao () -> Double {
        var total = 0.0
        for item in items {
            total += item.calorias
        }
        return total
    }
}
