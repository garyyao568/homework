//
//  JDTextField.swift
//  JetDevsHomeWork
//
//  Created by Anand Prakash on 03/02/24.
//

import UIKit

class JDTextField: UIView {
    
    @IBOutlet private(set) weak var mainView: UIView!
    @IBOutlet private(set) weak var textFieldLabel: UILabel!
    @IBOutlet private(set) weak var textField: UITextField!
    
    // Closure properties for handling text field events.
    var textFieldDidChange: ((String) -> Void)?
    var textFieldShouldReturn: (() -> Void)?
    
    // Initializer for creating the view programmatically.
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    // Common setup tasks for the view.
    private func commonInit() {
        let nibName = String(describing: JDTextField.self)
        Bundle.main.loadNibNamed(nibName, owner: self)
        addSubview(mainView)
        
        mainView.frame = bounds
        mainView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    func setTextFieldLabel(with text: String) {
        textFieldLabel.text = text
    }
    
    // Configures the text field's placeholder text, keyboard type, and secure text entry mode.
    func setTextField(placeholder: String,
                      keyboardType: UIKeyboardType = .default,
                      secureEntry: Bool = false) {
        textField.placeholder = placeholder
        textField.keyboardType = keyboardType
        textField.isSecureTextEntry = secureEntry
    }
}

// UITextFieldDelegate conformance for handling text field events.
extension JDTextField: UITextFieldDelegate {
    
    // Called when the text in the text field changes.
    @objc func textFieldDidChange(_ textField: UITextField) {
        textFieldDidChange?(textField.text ?? "")
    }
    // Called when the user taps the return key on the keyboard.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldShouldReturn?()
        return true
    }
}
