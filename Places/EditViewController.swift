//
//  EditViewController.swift
//  Places
//
//  Created by Olzhas Seiilkhanov on 21.06.2022.
//

import UIKit
import MapKit

class EditViewController: UIViewController {
    
    weak var delegate: EditLocationDelegate?

    private let titleTextField = UITextField()
    private let subtitleTextField = UITextField()
    
    var location: MKAnnotation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureTextFields()
        assignCurrentValues()
    }
    
    private func configureView() {
        title = "Edit"
        view.backgroundColor = .systemGreen
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneEditing))
        self.navigationItem.rightBarButtonItem?.tintColor = .black
        self.navigationController?.navigationBar.tintColor = UIColor.black
    }
    
    private func assignCurrentValues() {
        titleTextField.text = location?.title!
        subtitleTextField.text = location?.subtitle!
    }
    
    @objc private func doneEditing() {
        guard let title = titleTextField.text, titleTextField.hasText else { return }
        guard let subtitle = subtitleTextField.text, subtitleTextField.hasText else { return }

        delegate?.editLocation(title: title, subtitle: subtitle)
        navigationController?.popViewController(animated: true)
    }

    private func configureTextFields() {
        view.addSubview(titleTextField)
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        titleTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 160).isActive = true
        titleTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        titleTextField.textAlignment = .left
        titleTextField.layer.borderWidth = 2
        titleTextField.layer.cornerRadius = 5
        titleTextField.layer.borderColor = UIColor.black.cgColor
        titleTextField.setLeftPaddingPoints(10)
        titleTextField.becomeFirstResponder()
        titleTextField.clearButtonMode = .whileEditing
        titleTextField.backgroundColor = .white
        
        view.addSubview(subtitleTextField)
        subtitleTextField.translatesAutoresizingMaskIntoConstraints = false
        subtitleTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        subtitleTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        subtitleTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 160).isActive = true
        subtitleTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        subtitleTextField.textAlignment = .left
        subtitleTextField.layer.borderWidth = 2
        subtitleTextField.layer.cornerRadius = 5
        subtitleTextField.layer.borderColor = UIColor.black.cgColor
        subtitleTextField.setLeftPaddingPoints(10)
        subtitleTextField.becomeFirstResponder()
        subtitleTextField.clearButtonMode = .whileEditing
        subtitleTextField.backgroundColor = .white
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
