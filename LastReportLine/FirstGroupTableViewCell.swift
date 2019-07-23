//
//  FirstGroupTableViewCell.swift
//  LastReportLine
//
//  Created by Endratno　Alvin on 2019/07/09.
//  Copyright © 2019 Endratno　Alvin. All rights reserved.
//

import UIKit

class FirstGroupTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupImg: UIImageView!
}
