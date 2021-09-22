//
//  MovieViewController.swift
//  Desafio-Mobile2You
//
//  Created by Rodrigo Dias on 16/09/21.
//

import UIKit

fileprivate let cellId = "cellId"
fileprivate let headerId = "headerId"
fileprivate let padding: CGFloat = 16

class MovieViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let service = MovieService()
    
    var movie: Movie?
    var similarMovies: [Movie]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchMovie()
        fetchSimilarMovie()
        
        setupCollectionViewLayout()
        setupCollectionView()
    }
    
    func fetchMovie() {
        service.fetchMovieDetails(id: "680") { (movie) in
            self.movie = movie
            self.collectionView.reloadData()
        }
    }
    
    func fetchSimilarMovie() {
        service.fetchSimilarMovies(id: "680") { (movies) in
            self.similarMovies = movies
            self.collectionView.reloadData()
        }
    }
    
    fileprivate func setupCollectionViewLayout() {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return.lightContent
    }
    
    fileprivate func setupCollectionView() {
        collectionView.backgroundColor = .black
        collectionView.contentInsetAdjustmentBehavior = .never
        
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! HeaderView
        if let movie = movie {
            header.setupMovie(movie: movie)
        }
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 400)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return similarMovies?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MovieCollectionViewCell
        if let movie = similarMovies?[indexPath.row] {
            cell.setupSimilarMovies(movie: movie)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 2 * padding, height: 50)
    }
    
}
