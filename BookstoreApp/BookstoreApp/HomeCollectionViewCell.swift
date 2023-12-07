import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    static let identifier = "HomeCollectionViewCell"
    let generator = URLRequestGeneratore()
    let networkService = NetworkManager()
    private lazy var bookImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "DorianGray"))
        image.contentMode = .scaleAspectFill
        return image
    }()

    private lazy var descriptionBookView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 12
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return view
    }()

    private lazy var genderLabel = UILabel(text: "Classics", font: .italicSystemFont(ofSize: 10), textColor: .lightGray)
    private lazy var bookTitleLabel: UILabel = {
        let label = UILabel(text: "The picture of Dorian Gray", font: .boldSystemFont(ofSize: 15), textColor: .white)
        label.numberOfLines = 0
        return label
    }()

    private lazy var authorLabel = UILabel(text: "Oscar Wilde", font: .systemFont(ofSize: 11), textColor: .white)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureCell(with model: Books) {
        guard let cover = model.coverEditionKey else { return }
        let requestCover = self.generator.request(baseURL: .coverData, endpoint: "b/olid/\(cover).jpg")
        self.networkService.requestImage(generator: requestCover) { (result: Result<Data, Error>) in
            switch result {
            case .success(let success):
                self.bookImage.image = UIImage(data: success)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
        
    override func prepareForReuse() {
        super.prepareForReuse()
        bookImage.image = nil
    }
    
    private func setupUI() {
        self.layer.cornerRadius = 12
        self.backgroundColor = .lightGray
        
        addSubviews(bookImage, descriptionBookView)
        descriptionBookView.addSubviews(genderLabel, bookTitleLabel, authorLabel)
        
        NSLayoutConstraint.activate([
            bookImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            bookImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
            bookImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45),
            bookImage.heightAnchor.constraint(equalToConstant: 140)
        ])
        
        NSLayoutConstraint.activate([
            descriptionBookView.bottomAnchor.constraint(equalTo: bottomAnchor),
            descriptionBookView.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionBookView.trailingAnchor.constraint(equalTo: trailingAnchor),
            descriptionBookView.heightAnchor.constraint(equalToConstant: 90)
        ])
        
        NSLayoutConstraint.activate([
            genderLabel.topAnchor.constraint(equalTo: descriptionBookView.topAnchor, constant: 12),
            genderLabel.leadingAnchor.constraint(equalTo: descriptionBookView.leadingAnchor, constant: 10),
            genderLabel.trailingAnchor.constraint(equalTo: descriptionBookView.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            bookTitleLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor),
            bookTitleLabel.leadingAnchor.constraint(equalTo: descriptionBookView.leadingAnchor, constant: 10),
            bookTitleLabel.trailingAnchor.constraint(equalTo: descriptionBookView.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: bookTitleLabel.bottomAnchor, constant: 8),
            authorLabel.leadingAnchor.constraint(equalTo: descriptionBookView.leadingAnchor, constant: 10)
        ])
    }
}
