import UIKit

class TabbarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupViewControllers()
        setupDragAndDrop()
        customizeTabBar()
        addFloatingButton()
        addBadge()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //Add custom shapes or shadows
        tabBar.layer.cornerRadius = 20
        tabBar.layer.masksToBounds = true
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.2
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -3)
        tabBar.layer.shadowRadius = 10

        //Custom tabbar height
        var tabBarFrame = tabBar.frame
        tabBarFrame.size.height = 80
        tabBarFrame.origin.y = view.frame.height - 80
        tabBar.frame = tabBarFrame
    }

    private func addFloatingButton() {
        let button = UIButton(frame: CGRect(x: (view.frame.width - 60) / 2, y: view.frame.height - 110, width: 60, height: 60))
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 30
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(floatingButtonTapped), for: .touchUpInside)

        view.addSubview(button)
    }

    @objc private func floatingButtonTapped() {
        print("Floating button tapped!")
    }

    private func addBadge() {
        tabBar.items?.first?.badgeValue = "5"
        tabBar.items?.first?.badgeColor = .systemRed
    }

    private func setupViewControllers() {
        let homeViewController = HomeViewController()
        let contactsViewController = ContactsViewController()
        let downloadViewController = DownloadViewController()

        homeViewController.tabBarItem = UITabBarItem(title: "Home",
                                                     image: UIImage(systemName: "house"),
                                                     selectedImage: UIImage(systemName: "house.fill"))
        contactsViewController.tabBarItem = UITabBarItem(title: "Contacts",
                                                         image: UIImage(systemName: "person.crop.circle"),
                                                         selectedImage: UIImage(systemName: "person.crop.circle.fill"))
        downloadViewController.tabBarItem = UITabBarItem(title: "Downloads",
                                                         image: UIImage(systemName: "arrow.down.circle"),
                                                         selectedImage: UIImage(systemName: "arrow.down.circle.fill"))
        viewControllers = [homeViewController, contactsViewController, downloadViewController]
    }

    private func setupDragAndDrop() {
        let dragInteraction = UIDragInteraction(delegate: self)
        let dropInteraction = UIDropInteraction(delegate: self)
        tabBar.addInteraction(dragInteraction)
        tabBar.addInteraction(dropInteraction)
    }

    private func customizeTabBar() {
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .systemGray
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.lightGray]

            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = appearance
        } else {
            tabBar.barTintColor = .systemGray
            tabBar.tintColor = .white
            tabBar.unselectedItemTintColor = .lightGray
        }
    }

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Did select view controller: \(viewController.title ?? "Unknown")")
        //Custom Animations
        let transition = CATransition()
        transition.type = .fade
        transition.duration = 0.5
        tabBarController.view.layer.add(transition, forKey: kCATransition)
    }
}

// MARK: - UIDragInteractionDelegate
extension TabbarController: UIDragInteractionDelegate {
    func dragInteraction(_ interaction: UIDragInteraction, itemsForBeginning session: UIDragSession) -> [UIDragItem] {
        let itemProvider = NSItemProvider(object: "Dragged Item" as NSString)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        return [dragItem]
    }

    func dragInteraction(_ interaction: UIDragInteraction, sessionAllowsMoveOperation session: UIDragSession) -> Bool {
        return true
    }
}

// MARK: - UIDropInteractionDelegate
extension TabbarController: UIDropInteractionDelegate {
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: NSString.self)
    }

    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy)
    }

    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        session.loadObjects(ofClass: NSString.self) { items in
            if let strings = items as? [String] {
                print("Dropped items: \(strings)")
            }
        }
    }
}

class HomeViewController: UIViewController {
    private lazy var downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Go to Downloads", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemOrange
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToDownloads), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        title = "Home"
        addGoToDownloadsButton()
    }

    private func addGoToDownloadsButton() {
        view.addSubview(downloadButton)
        NSLayoutConstraint.activate([
            downloadButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            downloadButton.widthAnchor.constraint(equalTo: view.widthAnchor),
            downloadButton.heightAnchor.constraint(equalToConstant: 72),
        ])
    }

    @objc private func goToDownloads() {
        tabBarController?.selectedIndex = 2
    }
}

class ContactsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        title = "Contacts"
    }
}

class DownloadViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        title = "Download"
    }
}
