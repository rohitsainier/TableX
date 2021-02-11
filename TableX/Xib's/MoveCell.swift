//
//  MoveCell.swift
//  TableX
//
//  Created by Rohit Saini on 10/02/21.
//

import UIKit

class MoveCell: UITableViewCell {

    //OUTLETS
    
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var removeBtn: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var nameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
