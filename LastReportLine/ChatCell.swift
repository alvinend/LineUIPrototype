//
//  ChatCell.swift
//  LastReportLine
//
//  Created by Endratno　Alvin on 2019/07/16.
//  Copyright © 2019 Endratno　Alvin. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {

    let messageLabel = UILabel()
    let bubbleView = UIView()
    var leadingConstraint : NSLayoutConstraint!
    var trailingConstraint : NSLayoutConstraint!
    
    var chatMsg: ChatMsg!{
        didSet{
            bubbleView.backgroundColor = chatMsg.isIncoming ? .white : .green
            messageLabel.textColor = .black
            
            messageLabel.text = chatMsg.text
            
            if chatMsg.isIncoming{
                leadingConstraint.isActive = true
                trailingConstraint.isActive = false
            }else {
                leadingConstraint.isActive = false
                trailingConstraint.isActive = true
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        bubbleView.backgroundColor = .yellow
        bubbleView.layer.cornerRadius = 12
        addSubview(bubbleView)
        bubbleView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(messageLabel)
        messageLabel.text = "afwoihwgqwigojqwogjqwgjqwjg ASDAF ASFAS FA FA SF ASFA FA SFA FASFASFA"
        
        messageLabel.numberOfLines = 0
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints =
            
            [messageLabel.topAnchor.constraint(equalTo: topAnchor, constant : 32),
             messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
             messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
             
             bubbleView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16),
             bubbleView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -16),
             bubbleView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16),
             bubbleView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16)
        ]
        
        
        NSLayoutConstraint.activate(constraints)
        //messageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        leadingConstraint = messageLabel.leadingAnchor.constraint(equalTo:leadingAnchor, constant: 32)
        leadingConstraint.isActive = false
        
        trailingConstraint = messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        trailingConstraint.isActive = true
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init has not been implemented")
    }

}
