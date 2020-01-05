//
//  MealTableViewCell.swift
//  deleteStoryboard
//
//  Created by 三浦　知明 on 2020/01/03.
//  Copyright © 2020 三浦　知明. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    lazy var photoImageView = self.createImageView()
    lazy var namelabel = self.createNameLabel()
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(photoImageView)
        self.contentView.addSubview(namelabel)
        self.contentView.addSubview(ratingControl)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        ratingControl.topAnchor.constraint(equalTo: namelabel.bottomAnchor, constant: 15).isActive = true
        ratingControl.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 10).isActive = true
    }
    
    private func createNameLabel() -> UILabel  {
        let nameLabel = UILabel(frame: CGRect(x: photoImageView.frame.maxX + 15, y: 0, width: self.frame.width - (100+10), height: 30))
        nameLabel.textAlignment = .left
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        return nameLabel
    }
    
    private func createImageView() -> UIImageView {
        let photoImageView = UIImageView(image: UIImage(named: "defaultPhoto"))
        photoImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        return photoImageView
    }
    
}


