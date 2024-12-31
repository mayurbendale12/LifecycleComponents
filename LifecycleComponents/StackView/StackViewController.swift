import UIKit

class StackViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        configureStackView()
    }

    private func configureStackView() {
        let stackView = UIStackView()
        stackView.backgroundColor = .brown
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalToConstant: 300),
            stackView.heightAnchor.constraint(equalToConstant: 500),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        let view1 = createCustomView(withColor: .red)
        let view2 = createCustomView(withColor: .blue)
        let view3 = createCustomView(withColor: .green)

        stackView.addArrangedSubview(view1)
        stackView.addArrangedSubview(view2)
        stackView.addArrangedSubview(view3)

        stackView.setCustomSpacing(50, after: view2)

        //Remove particular view
//        stackView.removeArrangedSubview(view2)
//        view2.removeFromSuperview()
    }

    private func createCustomView(withColor color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 400).isActive = true
//        view.heightAnchor.constraint(equalToConstant: 100).isActive = true

        return view
    }

    private func removeAllArrangedSubviews(from stackView: UIStackView) {
        let arrangedSubviews = stackView.arrangedSubviews
        arrangedSubviews.forEach { subView in
            stackView.removeArrangedSubview(subView)
            subView.removeFromSuperview()
        }
    }

    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
        print("Layout margins did change.")
    }
}
