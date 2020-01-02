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
    lazy var mealNameLabel = self.createMealLabel()
    lazy var nameTextField = self.createNameTextField()
    lazy var textButton = self.createTextButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutView()
        nameTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func createMealLabel() -> UILabel {
        let mealNameLabel = UILabel(frame: CGRect(x: 0, y:view.safeAreaInsets.top + 80  , width: view.frame.width, height:30 ))
        mealNameLabel.text = "Meal Name"
        mealNameLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        return mealNameLabel
    }
    
    private func createNameTextField() -> UITextField {
        let nameTextField: UITextField = UITextField(frame:CGRect(x: 0, y: mealNameLabel.frame.maxY+12, width: view.frame.width, height: 30))
        nameTextField.delegate = self
        nameTextField.placeholder = "Enter meal name"
        nameTextField.borderStyle = .roundedRect
        //リターンキーがdoneになる
        nameTextField.returnKeyType = UIReturnKeyType.done
        //空欄時にdoneを押せなくする
        nameTextField.enablesReturnKeyAutomatically = true
        return nameTextField
    }
    
    private func createTextButton() -> UIButton {
        let textButton = UIButton(frame: CGRect(x: 0, y: nameTextField.frame.maxY+12, width: 200, height: 30))
        textButton.setTitle("Set Default Label Text", for: .normal)
        textButton.setTitleColor(.black, for: .normal)
        textButton.contentHorizontalAlignment = .left
        textButton.addTarget(self, action: #selector(self.setDefaultLabelText(_:)), for:.touchUpInside)
        return textButton
    }
    private func layoutView() {
        self.view.addSubview(mealNameLabel)
        self.view.addSubview(nameTextField)
        self.view.addSubview(textButton)
    }
    
    @objc private func setDefaultLabelText(_ sender:UIButton){
        mealNameLabel.text = "Defalut Text"
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //doneを押した時にキーボードを閉じる
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
}

