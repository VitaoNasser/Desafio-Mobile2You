//
//  HeaderView.swift
//  Desafio-Mobile2You
//
//  Created by Rodrigo Dias on 16/09/21.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "stretchy_header"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //Custom code for layout
        
        self.backgroundColor = .red
        
        addSubview(imageView)
        imageView.fillSuperView()
        
        setupGradientLayer()
    }
    
    fileprivate func setupGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.5, 1]
        
        let gradientContainerView = UIView()
        addSubview(gradientContainerView)
        gradientContainerView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        gradientContainerView.layer.addSublayer(gradientLayer)
        
        // static frame
        gradientLayer.frame = self.bounds
        gradientLayer.frame.origin.y -= bounds.height
        
        let heavyLabelOne = UILabel()
        heavyLabelOne.text = "Surf the web for courses"
        heavyLabelOne.font = .systemFont(ofSize: 24, weight: .heavy)
        heavyLabelOne.textColor = .white
        
        let buttonOne = UIButton()
        buttonOne.backgroundColor = .red

        let imageViewTwoA = UIImageView()
        imageViewTwoA.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageViewTwoA.backgroundColor = .yellow
        
        let heavyLabelTwoA = UILabel()
        heavyLabelTwoA.text = "Likes"
        heavyLabelTwoA.font = .systemFont(ofSize: 12, weight: .regular)
        heavyLabelTwoA.textColor = .white
        
        let imageViewTwoB = UIImageView()
        imageViewTwoB.backgroundColor = .blue
        imageViewTwoB.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        let heavyLabelTwoB = UILabel()
        heavyLabelTwoB.text = "Surf the web for courses"
        heavyLabelTwoB.font = .systemFont(ofSize: 12, weight: .regular)
        heavyLabelTwoB.textColor = .white
        
        let horizontalStackViewOne = UIStackView(arrangedSubviews: [heavyLabelOne, buttonOne])
        
        let horizontalStackViewTwoA = UIStackView(arrangedSubviews: [imageViewTwoA, heavyLabelTwoA])
        
        let horizontalStackViewTwoB = UIStackView(arrangedSubviews: [imageViewTwoB, heavyLabelTwoB])
        
        let horizontalStackViewTwo = UIStackView(arrangedSubviews: [horizontalStackViewTwoA, horizontalStackViewTwoB])
        horizontalStackViewTwo.axis = .horizontal
        horizontalStackViewTwo.distribution = .fillProportionally

        let verticalStackView = UIStackView(arrangedSubviews: [horizontalStackViewOne, horizontalStackViewTwo])
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 8
        
        addSubview(verticalStackView)
        
        verticalStackView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: -16, right: -16))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
}
