//
//  SecondSubTableViewCell.swift
//  LastReportLine
//
//  Created by Endratno　Alvin on 2019/07/09.
//  Copyright © 2019 Endratno　Alvin. All rights reserved.
//

import UIKit

class SecondSubTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBOutlet weak var secImage: UIImageView!

    @IBOutlet weak var secChat: UILabel!
    @IBOutlet weak var secChatName: UILabel!
    
}
