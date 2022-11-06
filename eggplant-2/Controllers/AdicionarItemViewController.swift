//
//  AdicionarRefeicoesViewController.swift
//  eggplant-2
//
//  Created by Kangu Tecnologia on 06/11/22.
//

import UIKit

protocol AdicionaItemDelegate {
    func add(_ item: Item)
}

class AdicionarItemViewController: UIViewController {
    // MARK: - Atributos
    
    var delegate: AdicionaItemDelegate?
    
    // MARK: - Init
    
    init(delegate: AdicionaItemDelegate) {
        super.init(nibName: "AdicionarItemViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - View Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var caloriasTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func AdicionarItem(_ sender: Any) {
        guard let nome = nomeTextField?.text, let caloriasString = caloriasTextField?.text else { return }
        guard let calorias = Double(caloriasString) else { return }
        
        let item = Item(nome: nome, calorias: calorias)
        delegate?.add(item)
        navigationController?.popViewController(animated: true)
    }
    
    
    
}
