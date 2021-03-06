//
//  StretchyHeaderLayout.swift
//  Desafio-Mobile2You
//
//  Created by Rodrigo Dias on 16/09/21.
//

import UIKit

class StretchyHeaderLayout: UICollectionViewFlowLayout {
    
    // we want to modify the attributes of our header component somehow
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        layoutAttributes?.forEach({ (attributes) in
            
            if attributes.representedElementKind == UICollectionView.elementKindSectionHeader &&
                attributes.indexPath.section == 0 {
                
                guard let collectionView = collectionView else { return }
                
                let contentOffSetY = collectionView.contentOffset.y
//                print(contentOffSetY)
                
                if contentOffSetY > 0 {
                    return
                }
                
                let width = collectionView.frame.width
                let height = attributes.frame.height - contentOffSetY
                
                //header
                attributes.frame = CGRect(x: 0, y: contentOffSetY, width: width, height: height)
            }
            
        })
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

}
