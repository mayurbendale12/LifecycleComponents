import UIKit

class PageViewController: UIPageViewController {
    private var pages: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageViewController()
        customizePageControl()
    }

    private func configurePageViewController() {
        dataSource = self //Don't set this if you have to disable the swipe
        delegate = self

        let homeController = HomeController()
        homeController.delegate = self
        homeController.view.backgroundColor = .red

        let contactsViewController = ContactsViewController()
        contactsViewController.view.backgroundColor = .blue

        let downloadViewController = DownloadViewController()
        downloadViewController.view.backgroundColor = .green

        pages = [homeController, contactsViewController, downloadViewController]

        // Set the initial view controller
        setViewControllers([homeController], direction: .forward, animated: true, completion: nil)
        view.backgroundColor = UIColor.gray
    }

    private func customizePageControl() {
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = .red
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.backgroundColor = .white.withAlphaComponent(0.2)
    }

    private func goToPage(index: Int) {
        guard index >= 0 && index < pages.count else { return }
        setViewControllers([pages[index]], direction: .forward, animated: true, completion: nil)
    }
}

// MARK: - UIPageViewControllerDataSource
extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex > 0 else {
            return nil
        }
        return pages[currentIndex - 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex < pages.count - 1 else {
            return nil
        }
        return pages[currentIndex + 1]
    }

    // Implement below two methods to get PageControl 
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let currentVC = viewControllers?.first else { return 0 }
        return pages.firstIndex(of: currentVC) ?? 0
    }
}

// MARK: - UIPageViewControllerDelegate
extension PageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        print("Will transition to a new page")
    }

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            print("Transition to new page completed")
        } else {
            print("Transition to new page canceled")
        }
    }
}

extension PageViewController: HomeControllerDelegate {
    func didGoToNextPage() {
        goToPage(index: 1)
    }
}

protocol HomeControllerDelegate: AnyObject {
    func didGoToNextPage()
}

class HomeController: UIViewController {
    weak var delegate: HomeControllerDelegate?

    private lazy var goToNextPageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Go to Next Page", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemOrange
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToNextPage), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        title = "Home"
        addGoToNextPageButton()
    }

    private func addGoToNextPageButton() {
        view.addSubview(goToNextPageButton)
        NSLayoutConstraint.activate([
            goToNextPageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goToNextPageButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc private func goToNextPage() {
        delegate?.didGoToNextPage()
    }
}
