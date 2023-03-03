//
//  PreviewViewController.swift
//  ReproductorMusica
//
//  Created by Marco Alonso Rodriguez on 03/03/23.
//

import UIKit

class PreviewViewController: UIViewController {
    
    @IBOutlet weak var posterCancion: UIImageView!
    @IBOutlet weak var autorCancion: UILabel!
    @IBOutlet weak var nombreCancion: UILabel!
    @IBOutlet weak var playView: UIView!
    @IBOutlet weak var letraCancion: UITextView!
    
    var cancion: Cancion?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurarVistas()
        
    }
    
    func configurarVistas(){
        guard let cancion else { return }
        print(cancion)
        
        letraCancion.text = cancion.letra
        print(cancion.letra)
        nombreCancion.text = cancion.nombre
        autorCancion.text = cancion.autor
        posterCancion.image = cancion.imagen
        
        playView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(playAction)))
    }
    
    @objc func playAction(){
        reproducirCancion()
    }
    
    func reproducirCancion(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PlayViewController") as! PlayViewController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }

    @IBAction func playActionButton(_ sender: UIButton) {
        reproducirCancion()
    }
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    

}
