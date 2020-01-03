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
    var rating = 0{
        didSet {
            updateButtonSelectionStates()
        }
    }
    var starSize : CGSize = CGSize(width: 44.0, height: 44.0){
        //値が変更された直後に発火
        didSet {
            setupButtons()
        }
    }
    var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    private func setupButtons() {
        // clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        //load Button Images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        
        for index in 0..<starCount {
            let button = UIButton()
            
            //set the button image
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            button.accessibilityLabel =  "set \(index+1) star rating"
            button.addTarget(self, action: #selector(self.ratingButtonTapped(button:)), for: .touchUpInside)
            self.addArrangedSubview(button)
            ratingButtons.append(button)
        }
    }
    @objc func ratingButtonTapped(button: UIButton){
        guard let index = ratingButtons.firstIndex(of: button) else {
            fatalError("The button, \(button),is not in the ratingButtons array\(ratingButtons)")
        }
        // calculate the rating of the selected button
        let selectedRating = index + 1
        if selectedRating == rating {
            // if the selected star represents the current rating, reset to 0.
            rating = 0
        } else {
            //otherwise set the rating to the selected star
            rating = selectedRating
        }
    }
    private func updateButtonSelectionStates() {
        for (index,button) in ratingButtons.enumerated() {
            button.isSelected = index < rating
            
            // Set accessibility hint and value
            let hintString: String?
            if rating == index + 1 {
                hintString = "Tap to reset the rating to zero."
            } else {
                hintString = nil
            }

            let valueString: String
            switch (rating) {
            case 0:
                valueString = "No rating set."
            case 1:
                valueString = "1 star set."
            default:
                valueString = "\(rating) stars set."
            }
            
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
        }
    }
}
