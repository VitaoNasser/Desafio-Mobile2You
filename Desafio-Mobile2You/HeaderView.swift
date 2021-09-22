//
//  HeaderView.swift
//  Desafio-Mobile2You
//
//  Created by Rodrigo Dias on 16/09/21.
//

import UIKit
import Kingfisher

class HeaderView: UICollectionReusableView {
    
    // MARK: - Properties
    let titleLabel = UILabel()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .black
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    // MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        //Custom code for layout
        
        self.backgroundColor = .red
        
        addSubview(imageView)
        imageView.fillSuperView()
        
        setupGradientLayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
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
        
        titleLabel.font = .systemFont(ofSize: 24, weight: .heavy)
        titleLabel.textColor = .white
        
        let likeButton = UIButton()
        likeButton.setImage(#imageLiteral(resourceName: "big_like"), for: .normal)

        let likesImage = UIImageView()
        likesImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        likesImage.image = #imageLiteral(resourceName: "small_like")
        
        
        let likesLabel = UILabel()
        likesLabel.text = "Likes"
        likesLabel.font = .systemFont(ofSize: 12, weight: .regular)
        likesLabel.textColor = .white
        
        let halfMoonImage = UIImageView()
        halfMoonImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        halfMoonImage.image = #imageLiteral(resourceName: "half_moon")
        
        let heavyLabelTwoB = UILabel()
        heavyLabelTwoB.text = "Popularity"
        heavyLabelTwoB.font = .systemFont(ofSize: 12, weight: .regular)
        heavyLabelTwoB.textColor = .white
        
        let horizontalStackViewOne = UIStackView(arrangedSubviews: [titleLabel, likeButton])
        horizontalStackViewOne.distribution = .equalSpacing
        
        let horizontalStackViewTwoA = UIStackView(arrangedSubviews: [likesImage, likesLabel])
        
        let horizontalStackViewTwoB = UIStackView(arrangedSubviews: [halfMoonImage, heavyLabelTwoB])
        
        let horizontalStackViewTwo = UIStackView(arrangedSubviews: [horizontalStackViewTwoA, horizontalStackViewTwoB])
        horizontalStackViewTwo.axis = .horizontal
        horizontalStackViewTwo.distribution = .fillProportionally

        let verticalStackView = UIStackView(arrangedSubviews: [horizontalStackViewOne, horizontalStackViewTwo])
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 8
        
        addSubview(verticalStackView)
        
        verticalStackView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: -16, right: -16))
    }
    
    // MARK: - Public Methods
    func setupMovie(movie: Movie) {
        titleLabel.text = movie.title
        
        let url = URL(string: "https://image.tmdb.org/t/p/w500/\(movie.posterPath)")
        imageView.kf.setImage(with: url)

    }
}
