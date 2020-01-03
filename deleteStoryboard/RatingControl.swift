//
//  RatingControl.swift
//  deleteStoryboard
//
//  Created by 三浦　知明 on 2020/01/02.
//  Copyright © 2020 三浦　知明. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {
    
    private var ratingButtons = [UIButton]()
    var rating = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    private func setupButtons() {
        
        for _ in 0..<5 {
            let button = UIButton()
            button.backgroundColor = .blue
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
            button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
            button.addTarget(self, action: #selector(self.ratingButtonTapped(button:)), for: .touchUpInside)
            self.addArrangedSubview(button)
            ratingButtons.append(button)
        }
    }
    @objc func ratingButtonTapped(button: UIButton){
        print("button tap!!")
    }
}
