//
//  TableController.swift
//  eggplant-2
//
//  Created by Kangu Tecnologia on 05/11/22.
//

import UIKit

class TableController: UITableViewController {
    let refeicoes = ["Banana", "Escondidinho", "Pera", "Feijoada", "Pizza", "Yakisoba"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("tableview controller carregou")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao
        return celula
    }
}
