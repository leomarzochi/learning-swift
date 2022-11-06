//
//  ViewController.swift
//  eggplant-2
//
//  Created by Kangu Tecnologia on 04/11/22.
//

import UIKit

protocol AdicionaRefeicaoDelegate {
    func add(_ refeicao: Refeicao)
}

class RefeicaoController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItemDelegate {
    // MARK: - Atributos
    
    var delegate: AdicionaRefeicaoDelegate?
    var itens: [Item] = [Item(nome: "Banana", calorias: 23.9),
                         Item(nome: "Manjericao", calorias: 120.99),
                         Item(nome: "Tomate", calorias: 120.99),
                         Item(nome: "Pera", calorias: 120.99)]
    var itensSelecionados: [Item] = []
    
    // MARK: - View Life Cycles
    
    override func viewDidLoad() {
        let adicionarItemButton = UIBarButtonItem(title: "Adicionar", style: .plain, target: self, action: #selector(self.adicionarItem))
        navigationItem.rightBarButtonItem = adicionarItemButton
    }
    
    @objc func adicionarItem () {
        let adicionarItemViewController = AdicionarItemViewController(delegate: self)
        navigationController?.pushViewController(adicionarItemViewController, animated: true)
    }
    
    func add(_ item: Item) {
        itens.append(item)
        itensTableController.reloadData()
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var itensTableController: UITableView!
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let item = itens[indexPath.row].nome
        celula.textLabel?.text = item
        return celula
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        
        if(celula.accessoryType == .none) {
            celula.accessoryType = .checkmark
            itensSelecionados.append(itens[indexPath.row])
            return
        } else {
            celula.accessoryType = .none
            let item = itens[indexPath.row]
            
            if let position = itensSelecionados.firstIndex(of: item) {
                itensSelecionados.remove(at: position)
            }
        }
        
    }
    
    // MARK: - IBActions
    
    @IBAction func adicionar () {
        guard let nomeDaRefeicao = nomeTextField?.text, let felicidadeRefeicao = felicidadeTextField?.text else {
            return
        }
        guard let felicidade = Int(felicidadeRefeicao) else {
            return
        }
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
        
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
    }
}
