import UIKit

class ViewController: UIViewController {
    @IBAction private func didTapUITableViewButton(_ sender: Any) {
        navigationController?.pushViewController(TableViewController(), animated: true)
    }

    @IBAction private func didTapUICollectionViewButton(_ sender: Any) {
        navigationController?.pushViewController(CollectionViewController(), animated: true)
    }

    @IBAction private func didTapUITabBarControllerButton(_ sender: Any) {
        navigationController?.pushViewController(TabbarController(), animated: true)
    }

    @IBAction private func didTapUIPageViewControllerButton(_ sender: Any) {
        let pageViewController = PageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        navigationController?.pushViewController(pageViewController, animated: true)
    }

    @IBAction private func didTapUIStackViewButton(_ sender: Any) {
        navigationController?.pushViewController(StackViewController(), animated: true)
    }

    // Creates a view controller with data in an unarchiver.
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // Creates a view controller with the nib file in the specified bundle.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    // Called when the view controller's view is requested but has not been set yet.
    // You override this method to create and assign the view for the view controller.
    override func loadView() {
        super.loadView()
    }

    // Called after the view has been loaded into memory.
    // It is often used for one-time setup tasks, such as initializing data, configuring the user interface, or setting up observers.
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Called just before the view is about to be added to the view hierarchy.
    // It is a good place to perform tasks that need to happen every time the view is about to appear,
    // such as refreshing data.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // Called when the view is becoming visible at the beginning of the appearance transition,
    // after it has been added to the hierarchy and been laid out by its superview.
    // This method is very similar to -viewWillAppear: and is always called shortly afterwards.
    // When -viewIsAppearing: is called all of the following are valid for the view controller and its own view:
    //    - View controller and view's trait collection
    //    - View's superview chain and window
    //    - View's geometry (e.g. frame/bounds, safe area insets, layout margins)
    // Choose this method instead of -viewWillAppear:
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
    }

    // Called after the view has been added to the view hierarchy.
    // It is often used for tasks that should happen every time the view becomes visible,
    // such as starting animations or fetching data from a server.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    // Called just before the view is about to be removed from the view hierarchy.
    // It is useful for tasks like saving the current state or stopping animations.
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    // Called after the view has been removed from the view hierarchy.
    // It is often used for cleanup tasks or releasing resources.
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    // Called just before the view's bounds change.
    // You can override this method to make changes before the layout of subviews occurs.
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }

    // Called after the view's bounds have changed and its subviews have been laid out.
    // It is often used for additional layout adjustments after the initial layout pass.
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    // Called when a view controller is added to or removed from a parent view controller.
    // These methods are useful when working with container view controllers.
    override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)
    }

    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
    }

    // Called when the object is being deallocated.
    // Use this method for any cleanup tasks or releasing resources.
    deinit {
        print("deinit")
    }
}
