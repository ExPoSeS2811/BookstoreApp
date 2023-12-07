import UIKit

class HomeViewController: UIViewController {
    private var books = [Books]()
    private var generator = URLRequestGeneratore()
    private var networkSevice = NetworkManager()
    
    private lazy var categoryCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout(width: Constants.categoryWidth, height: Constants.categoryHeight))
        cv.backgroundColor = .clear
        cv.dataSource = self
        cv.register(HomeCategoryCollectionViewCell.self, forCellWithReuseIdentifier: HomeCategoryCollectionViewCell.identifier)
        return cv
    }()
    
    private lazy var topBooksCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout(width: Constants.booksWidth, height: Constants.booksHeight))
        cv.backgroundColor = .clear
        cv.dataSource = self
        cv.showsHorizontalScrollIndicator = false
        cv.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        return cv
    }()
    
    private lazy var recentBooksLabel = UILabel(text: "Recent Books", font: .systemFont(ofSize: 20, weight: .medium), textColor: .black)
    
    private lazy var recentBooksCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout(width: Constants.booksWidth, height: Constants.booksHeight))
        cv.backgroundColor = .clear
        cv.dataSource = self
        cv.showsHorizontalScrollIndicator = false
        cv.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        let requestBooks = generator.request(endpoint: "search.json", queryItems: [URLQueryItem(name: "q", value: "popular")])
        networkSevice.request(generator: requestBooks) { (result: Result<BookModel, Error>) in
            switch result {
            case .success(let success):
                self.books = success.docs
                self.topBooksCollectionView.reloadData()
            case .failure(let failure):
                print(failure.localizedDescription)
            }
            dispatchGroup.leave()
        }
    }
    
    
    private func setupFlowLayout(width: CGFloat, height: CGFloat) -> UICollectionViewFlowLayout {
        let flow = UICollectionViewFlowLayout()
        flow.itemSize = CGSize(width: width, height: height)
        flow.scrollDirection = .horizontal
        flow.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        return flow
    }
    
    private func setupUI() {
        view.addSubviews(categoryCollectionView, topBooksCollectionView, recentBooksLabel, recentBooksCollectionView)
        title = "Top Books"
        
        NSLayoutConstraint.activate([
            categoryCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            categoryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryCollectionView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            topBooksCollectionView.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: 15),
            topBooksCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topBooksCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topBooksCollectionView.heightAnchor.constraint(equalToConstant: 232)
        ])
        
        NSLayoutConstraint.activate([
            recentBooksLabel.topAnchor.constraint(equalTo: topBooksCollectionView.bottomAnchor, constant: 15),
            recentBooksLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            recentBooksCollectionView.topAnchor.constraint(equalTo: recentBooksLabel.bottomAnchor, constant: 15),
            recentBooksCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            recentBooksCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            recentBooksCollectionView.heightAnchor.constraint(equalToConstant: 232)
        ])
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView: return 3
        case topBooksCollectionView: return books.count
        case recentBooksCollectionView: return 20
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCategoryCollectionViewCell.identifier, for: indexPath) as? HomeCategoryCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
            
        case topBooksCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configureCell(with: books[indexPath.row])
            return cell
        case recentBooksCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        default: return UICollectionViewCell()
        }
    }
}


private extension HomeViewController {
    enum Constants {
        static let categoryHeight: CGFloat = 40
        static let categoryWidth: CGFloat = 86
        static let booksHeight: CGFloat = 232
        static let booksWidth: CGFloat = 176
    }
}

