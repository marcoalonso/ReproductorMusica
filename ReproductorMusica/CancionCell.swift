//
//  CancionCell.swift
//  ReproductorMusica
//
//  Created by Marco Alonso Rodriguez on 03/03/23.
//

import UIKit

class CancionCell: UITableViewCell {

    @IBOutlet weak var autorCancion: UILabel!
    @IBOutlet weak var nombreCancion: UILabel!
    @IBOutlet weak var posterCancion: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
