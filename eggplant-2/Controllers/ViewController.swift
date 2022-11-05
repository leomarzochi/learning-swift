//
//  ViewController.swift
//  eggplant-2
//
//  Created by Kangu Tecnologia on 04/11/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    
    @IBAction func adicionar () {
//        if let nomeRefeicao = nomeTextField?.text, let felicidadeRefeicao = felicidadeTextField?.text {
//            let nome = nomeRefeicao
//            if let felicidade = Int(felicidadeRefeicao) {
//                let refeicao = Refeicao(nome: nome, felicidade: felicidade)
//                print("Comi \(refeicao.nome) e fiquei com felicidade nivel: \(refeicao.felicidade)")
//            } else {
//                print("Erro ao criar uma refeicao")
//            }
//        }
        
        guard let nomeDaRefeicao = nomeTextField?.text, let felicidadeRefeicao = felicidadeTextField?.text else {
            return
        }
        
        
        guard let felicidade = Int(felicidadeRefeicao) else {
            return
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade)
        print("Comi \(refeicao.nome) e fiquei com felicidade nivel: \(refeicao.felicidade)")
    }
}

