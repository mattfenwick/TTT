//
//  TTTCell.swift
//  TTT
//
//  Created by MattF on 12/5/14.
//  Copyright (c) 2014 MattF. All rights reserved.
//

import UIKit

class TTTCell: UICollectionViewCell {
    
    @IBOutlet var button : UIButton!
    @IBOutlet var xview : UIView!
    @IBOutlet var oview : UIView!
    var _status : Status!
    var action : (NSIndexPath -> ())!
    var path : NSIndexPath!

    enum Status {
        case Empty
        case X
        case O
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setStatus(.Empty)

    }
    
    func setStatus(status: Status) {
        self._status = status
        switch (status) {
        case .Empty:
            self.button.hidden = false
            self.xview.hidden = true
            self.oview.hidden = true
        case .X:
            self.button.hidden = true
            self.xview.hidden = false
            self.oview.hidden = true
        case .O:
            self.button.hidden = true
            self.xview.hidden = true
            self.oview.hidden = false
        }
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        self.action(self.path)
    }

}
