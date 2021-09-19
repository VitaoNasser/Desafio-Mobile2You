//
//  MovieCollectionViewCell.swift
//  Desafio-Mobile2You
//
//  Created by Rodrigo Dias on 18/09/21.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //Custom code for layout
        
        self.backgroundColor = .black
        
        setupCellLayer()
    }
    
    fileprivate func setupCellLayer() {
        
        let cellLayer = CAGradientLayer()
        cellLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        cellLayer.locations = [0.5, 1]
        
        let cellContainerView = UIView()
        addSubview(cellContainerView)
        cellContainerView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        cellContainerView.layer.addSublayer(cellLayer)
        
        // static frame
        cellLayer.frame = self.bounds
        cellLayer.frame.origin.y -= bounds.height
        
        let cellImageViewOne = UIImageView()
        cellImageViewOne.widthAnchor.constraint(equalToConstant: 20).isActive = true
        cellImageViewOne.backgroundColor = .yellow
        
        let descriptionLabelA = UILabel()
        descriptionLabelA.text = "Surf the web for courses"
        descriptionLabelA.font = .systemFont(ofSize: 16, weight: .heavy)
        descriptionLabelA.textColor = .white
        
        let descriptionLabelB = UILabel()
        descriptionLabelB.text = "Surf the web for courses"
        descriptionLabelB.font = .systemFont(ofSize: 12, weight: .heavy)
        descriptionLabelB.textColor = .white
    
        let cellImageViewTwo = UIImageView()
        cellImageViewTwo.backgroundColor = .systemPink
        cellImageViewTwo.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        let verticalStackViewTwo = UIStackView(arrangedSubviews: [descriptionLabelA, descriptionLabelB])
        verticalStackViewTwo.spacing = 8
        verticalStackViewTwo.axis = .vertical
        
        addSubview(verticalStackViewTwo)
        
        verticalStackViewTwo.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: -16, right: -16))

        let horizontalStackView = UIStackView(arrangedSubviews: [cellImageViewOne, verticalStackViewTwo, cellImageViewTwo])
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 8
        horizontalStackView.distribution = .fillProportionally
        
        addSubview(horizontalStackView)
        
        horizontalStackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: -16, right: -16))
        
    }
            
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
