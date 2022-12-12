//
//  JDTextField.swift
//  JetDevsHomeWork
//
//  Created by Shibili Areekara on 12/12/22.
//

import UIKit

class JDTextField: UIView {
    
    @IBOutlet private(set) weak var mainView: UIView!
    @IBOutlet private(set) weak var textFieldLabel: UILabel!
    @IBOutlet private(set) weak var textField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    private func commonInit() {
        let nibName = String(describing: JDTextField.self)
        Bundle.main.loadNibNamed(nibName, owner: self)
        addSubview(mainView)
        
        mainView.frame = bounds
        mainView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func setTextFieldLabel(with text: String) {
        textFieldLabel.text = text
    }
    
    func setTextField(placeholder: String,
                      keyboardType: UIKeyboardType = .default,
                      returnKeyType: UIReturnKeyType = .next,
                      secureEntry: Bool = false) {
        textField.placeholder = placeholder
        textField.keyboardType = keyboardType
        textField.isSecureTextEntry = secureEntry
        textField.returnKeyType = returnKeyType
    }
}
