//
//  Refeicao.swift
//  eggplant-2
//
//  Created by Kangu Tecnologia on 05/11/22.
//

import UIKit

class Refeicao: NSObject {
    // MARK: - Init
    init(nome: String, felicidade: Int, itens: [Item] = []) {
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
    }
    
    // MARK: - Atributos
    
    let nome: String
    let felicidade: Int
    var itens: [Item]
    
    //MARK: - Metodos
    
    func totalDeCaloriasRefeicao () -> Double {
        var total = 0.0
        for item in itens {
            total += item.calorias
        }
        return total
    }
}
