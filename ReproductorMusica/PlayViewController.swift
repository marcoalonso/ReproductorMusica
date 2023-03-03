//
//  PlayViewController.swift
//  ReproductorMusica
//
//  Created by Marco Alonso Rodriguez on 03/03/23.
//

import UIKit

class PlayViewController: UIViewController {
    
    @IBOutlet weak var playButton: UIButton!
    var nombreCancion: String?
    
    var audioManager = AudioManager()
    private var value: Double = 0.0
    @IBOutlet weak var tiempoActualLabel: UILabel!
    @IBOutlet weak var tiempoRestanteLabel: UILabel!
    var viewModel = CancionViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let nombreCancion else { return }
        print("nombreCancion", nombreCancion)
        configurarUI()
    }
    
    func configurarUI(){
        guard let player = audioManager.player else { return }
        tiempoActualLabel.text = "\(player.currentTime)"
        tiempoRestanteLabel.text = "\(player.duration)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let nombreCancion else { return }
        audioManager.startPlayer(track: nombreCancion)
        playButton.setBackgroundImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
    }
    
    @IBAction func progresoCancionSlider(_ sender: UISlider) {
        print(sender.value)
    }
    
    
    @IBAction func cerrarButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func playButton(_ sender: UIButton) {
        
        guard let player = audioManager.player else { return }
        
        if player.isPlaying {
            print("pause")
            playButton.setBackgroundImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        } else {
            playButton.setBackgroundImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
        }
        
        
        audioManager.playPause()
    }
    
    @IBAction func stopButton(_ sender: UIButton) {
        audioManager.stop()
        playButton.setBackgroundImage(UIImage(systemName: "play.circle.fill"), for: .normal)
    }
    

}
