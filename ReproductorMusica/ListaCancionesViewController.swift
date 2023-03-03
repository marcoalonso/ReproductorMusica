//
//  ViewController.swift
//  ReproductorMusica
//
//  Created by Marco Alonso Rodriguez on 03/03/23.
//

import UIKit

class ListaCancionesViewController: UIViewController {
    
    @IBOutlet weak var tablaCanciones: UITableView!
    var viewModel = CancionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tablaCanciones.delegate = self
        tablaCanciones.dataSource = self
        
        tablaCanciones.register(UINib(nibName: "CancionCell", bundle: nil), forCellReuseIdentifier: "celda")
        
        
    }
    
}

extension ListaCancionesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.canciones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! CancionCell
        celda.posterCancion.image = viewModel.canciones[indexPath.row].imagen
        celda.nombreCancion.text = viewModel.canciones[indexPath.row].nombre
        celda.autorCancion.text = viewModel.canciones[indexPath.row].autor
        
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PreviewViewController") as! PreviewViewController
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        vc.cancion = viewModel.canciones[indexPath.row]
        present(vc, animated: true)
    }
}

