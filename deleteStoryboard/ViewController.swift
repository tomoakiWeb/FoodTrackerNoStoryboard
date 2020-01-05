//
//  ViewController.swift
//  deleteStoryboard
//
//  Created by 三浦　知明 on 2020/01/01.
//  Copyright © 2020 三浦　知明. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    //参照されるときに初めて初期値が設定されるプロパティ プロパティが必要になったときに初めて値を設定したいときに使える機能
    lazy var nameTextField = self.createNameTextField()
    lazy var photoImageView = self.createPhotoImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutView()
        nameTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
        self.constraints()
    }
    
    private func createNameTextField() -> UITextField {
        let nameTextField: UITextField = UITextField(frame:CGRect(x: 20, y: 15, width: view.frame.width - 20*2, height: 30))
        nameTextField.delegate = self
        nameTextField.placeholder = "Enter meal name"
        nameTextField.borderStyle = .roundedRect
        //リターンキーがdoneになる
        nameTextField.returnKeyType = UIReturnKeyType.done
        //空欄時にdoneを押せなくする
        nameTextField.enablesReturnKeyAutomatically = true
        return nameTextField
    }
    
    private func createPhotoImageView() -> UIImageView {
        let photoImageView = UIImageView(image: UIImage(named: "defaultPhoto"))
        photoImageView.frame = CGRect(x: 20, y: nameTextField.frame.maxY+5, width: view.frame.width - 20*2, height: view.frame.width - 20*2)
        photoImageView.isUserInteractionEnabled = true
        photoImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.selectImageFromPhotoLibrary(_:))))
        return photoImageView
    }
    //RatingControl.swiftのratingControlのインスタンスを生成
    let ratingControl: RatingControl = {
        let stackView = RatingControl()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    } ()
    
    private func layoutView() {
        self.view.addSubview(nameTextField)
        self.view.addSubview(photoImageView)
        self.view.addSubview(self.ratingControl)
    }
    
    private func constraints() {
        ratingControl.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 10).isActive = true
        ratingControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
}

extension ViewController: UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //doneを押した時にキーボードを閉じる
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController,animated: true, completion: nil)
    }
}

