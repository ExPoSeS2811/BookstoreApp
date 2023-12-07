import UIKit

class HomeCategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "HomeCategoryCollectionViewCell"
    private lazy var categoryLabel = UILabel(text: "This week", font: .systemFont(ofSize: 14), textColor: .white)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.layer.cornerRadius = 12
        self.backgroundColor = .black
        
        addSubviews(categoryLabel)
        
        NSLayoutConstraint.activate([
            categoryLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            categoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
