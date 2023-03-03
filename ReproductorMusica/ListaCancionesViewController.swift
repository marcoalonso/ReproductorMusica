//
//  ViewController.swift
//  ReproductorMusica
//
//  Created by Marco Alonso Rodriguez on 03/03/23.
//

import UIKit

class ListaCancionesViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tablaCanciones: UITableView!
    var viewModel = CancionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tablaCanciones.delegate = self
        tablaCanciones.dataSource = self
        
        tablaCanciones.register(UINib(nibName: "CancionCell", bundle: nil), forCellReuseIdentifier: "celda")
        
        
    }
}

extension ListaCancionesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.canciones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! CancionCell
        
        return celda
    }
    
    
}

