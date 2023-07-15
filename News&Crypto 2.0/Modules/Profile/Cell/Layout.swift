import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {
    
    init(width: CGFloat, height: CGFloat) {
        super.init()
        scrollDirection = .horizontal
        itemSize = .init(width: width, height: height)
        sectionInsetReference = .fromLayoutMargins
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = self.collectionView else {
            return targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        }
        
        let horizontalOffset = proposedContentOffset.x
        let targetRect = CGRect.init(origin: .init(x: proposedContentOffset.x,
                                                   y: 0),
                                     size: collectionView.bounds.size)
        
        var offsetAdjustment = CGFloat.greatestFiniteMagnitude
        
        if let layoutAttributesArray = super.layoutAttributesForElements(in: targetRect) {
            for layoutAttributes in layoutAttributesArray {
                let itemOffset = layoutAttributes.frame.origin.x
                
                if (abs(itemOffset - horizontalOffset) < abs(offsetAdjustment)) {
                    offsetAdjustment = itemOffset - horizontalOffset
                }
            }
        }
        return CGPoint.init(x: proposedContentOffset.x + offsetAdjustment - collectionView.layoutMargins.left,
                            y: proposedContentOffset.y)
    }
}
