//
//  MovieCollectionViewCell.swift
//  Desafio-Mobile2You
//
//  Created by Rodrigo Dias on 18/09/21.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    let titleLable = UILabel()
    let descriptionLable = UILabel()
    let posterImage = UIImageView()
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        //Custom code for layout
        
        self.backgroundColor = .black
        
        setupCellLayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods
    fileprivate func setupCellLayer() {
        
        let cellContainerView = UIView()
        addSubview(cellContainerView)
        cellContainerView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
//        cellContainerView.layer.addSublayer(cellLayer)
        
        // static framet
        
        titleLable.font = .systemFont(ofSize: 16, weight: .heavy)
        titleLable.textColor = .white
        
        descriptionLable.font = .systemFont(ofSize: 12, weight: .heavy)
        descriptionLable.textColor = .white
    
//        let check = UIImageView()
//        check.image = #imageLiteral(resourceName: "check")
//        posterImage.widthAnchor.constraint(equalToConstant: -20).isActive = true
        
        let verticalStackViewTwo = UIStackView(arrangedSubviews: [titleLable, descriptionLable])
        verticalStackViewTwo.spacing = 8
        verticalStackViewTwo.axis = .vertical
        
        addSubview(verticalStackViewTwo)
        
        verticalStackViewTwo.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: -16, right: -16))
        
        posterImage.contentMode = .scaleAspectFit
        let horizontalStackView = UIStackView(arrangedSubviews: [posterImage, verticalStackViewTwo/*, check*/])
        horizontalStackView.distribution = .fill
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 8
        
        
        addSubview(horizontalStackView)
        
        horizontalStackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: -16, right: -16))
        
    }
            
    // MARK: - Public Methods
    func setupSimilarMovies(movie: Movie) {
        titleLable.text = movie.title
        descriptionLable.text = movie.releaseDate
        
        let url = URL(string: "https://image.tmdb.org/t/p/w500/\(movie.posterPath)")
        posterImage.kf.setImage(with: url)
        posterImage.widthAnchor.constraint(equalToConstant: 20).isActive = true

    }
    
}
