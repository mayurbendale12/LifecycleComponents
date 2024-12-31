import UIKit

extension UIView {
    func add(_ subView: UIView) {
        subView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subView)

        NSLayoutConstraint.activate([
            subView.leadingAnchor.constraint(equalTo: leadingAnchor),
            subView.trailingAnchor.constraint(equalTo: trailingAnchor),
            subView.topAnchor.constraint(equalTo: topAnchor),
            subView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func add(_ subView: UIView, constant: CGFloat) {
        subView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subView)

        NSLayoutConstraint.activate([
            subView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: constant),
            subView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: constant),
            subView.topAnchor.constraint(equalTo: topAnchor, constant: constant),
            subView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: constant)
        ])
    }
}
