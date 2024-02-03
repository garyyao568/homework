//
//  JDButton.swift
//  JetDevsHomeWork
//
//  Created by Anand Prakash on 03/02/24.
//

import UIKit

class JDButton: UIButton {
    
    var isButtonEnabled: Bool = false {
        didSet {
            isButtonEnabled ? enabledUI() : disabledUI()
        }
    }
    
    func initUI() {
        self.corner = 6
        self.titleLabel?.font = UIFont.latoSemiBoldFont(size: 18)
        self.setTitleColor(.white, for: .normal)
    }
    
    private func enabledUI() {
        isUserInteractionEnabled = true
        backgroundColor = UIColor.enableColor
    }
    
    private func disabledUI() {
        isUserInteractionEnabled = false
        backgroundColor = UIColor.disableColor
    }
}
