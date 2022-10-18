//
//  MainTableHeader.swift
//  HummerSystemTestStore
//
//  Created by Vladimir Izmaylov on 17.10.2022.
//

import UIKit

protocol MainSegmentDelegate: AnyObject {
    func didSelectSegment(_ value: Category)
}

class MainTableHeader: UIView {
    
    var deliveryView: UIView!
    var bannerView: UIView!
    weak var delegate: MainSegmentDelegate?
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UINib(nibName: CategoryCell.cellID, bundle: nil), forCellWithReuseIdentifier: CategoryCell.cellID)
        return collectionView
    }()
    
    private let categories = Category.allCases
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        configureCategory()
        configureBannerView()
    
        snp.makeConstraints{
            $0.height.equalTo(216)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureBannerView() {
        bannerView = BannerView()
        addSubview(bannerView)
        bannerView.snp.makeConstraints() {
            $0.left.equalTo(snp.left).offset(8)
            $0.right.equalTo(snp.right).offset(-8)
            $0.bottom.equalTo(collectionView.snp.top).offset(-24)
            $0.height.equalTo(112)
        }
        
    }
    
    private func configureCategory() {
        backgroundColor = .white
        addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.bottom.equalTo(snp.bottom).offset(-24)
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().offset(-8)
            $0.height.equalTo(32)
        }
        
        layer.shadowOffset = .init(width: 0, height: 20)
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.09
    }
    
}

extension MainTableHeader: UICollectionViewDelegate,
                           UICollectionViewDataSource,
                           UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.cellID, for: indexPath) as? CategoryCell else { return .init() }
        cell.setLabel(categories[indexPath.row].rawValue)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 110, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectSegment(categories[indexPath.row])
    }
}
