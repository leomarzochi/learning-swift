//
//  Item.swift
//  eggplant-2
//
//  Created by Kangu Tecnologia on 05/11/22.
//

import UIKit

class Item: NSObject {
    var nome: String
    var calorias: Double

    init(nome: String, calorias: Double) {
      self.nome = nome
      self.calorias = calorias
    }
}
