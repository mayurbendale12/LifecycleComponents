import UIKit

class TableViewController: UIViewController {
    private var items = (0..<5).map { "Item \($0)" }
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private lazy var toggleEditingModeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Toggle Editing Mode", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(toggleEditingMode), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var tableHeaderView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        view.backgroundColor = .red
        let label = UILabel()
        label.text = "Table Header View"
        label.textColor = .black
        view.add(label)

        return view
    }()

    private lazy var tableFooterView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        view.backgroundColor = .green
        let label = UILabel()
        label.text = "Table Footer View"
        label.textColor = .black
        view.add(label)

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addToggleEditingModeButton()
        addTableView()
        setupTableView()
        view.backgroundColor = .white
        title = "UITableView"
    }

    private func addToggleEditingModeButton() {
        view.addSubview(toggleEditingModeButton)
        NSLayoutConstraint.activate([
            toggleEditingModeButton.widthAnchor.constraint(equalToConstant: 200),
            toggleEditingModeButton.heightAnchor.constraint(equalToConstant: 50),
            toggleEditingModeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            toggleEditingModeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
    }

    private func addTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: toggleEditingModeButton.bottomAnchor, constant: 50),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    private func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        tableView.tableHeaderView = tableHeaderView
        tableView.tableFooterView = tableFooterView
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 50
        tableView.sectionFooterHeight = UITableView.automaticDimension
        tableView.estimatedSectionFooterHeight = 50
        tableView.allowsSelectionDuringEditing = true
    }

    @objc private func toggleEditingMode() {
        let editingMode = !tableView.isEditing
        tableView.setEditing(editingMode, animated: true)
    }
}

extension TableViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            return UITableViewCell()
        }

        var content = cell.defaultContentConfiguration()
        content.text = items[indexPath.row]
        content.secondaryText = "Description"
        cell.contentConfiguration = content
         */
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) as? TableViewCell else {
            return UITableViewCell()
        }
        let text = items[indexPath.row]
        cell.configure(with: text)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected IndexPath: \(indexPath)")
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Header Section \(section)"
    }

    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Footer Section \(section)"
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let lable = UILabel()
        lable.text = "Header View \(section)"
        return lable
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let lable = UILabel()
        lable.text = "Footer View \(section)"
        return lable
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print("Deleting IndexPath: \(indexPath)")
        if editingStyle == .delete {
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        print("Moving IndexPath: \(sourceIndexPath) to \(destinationIndexPath)")
        let movedItem = items.remove(at: sourceIndexPath.item)
        items.insert(movedItem, at: destinationIndexPath.item)
    }
}

class TableViewCell: UITableViewCell {
    static let identifier = "TableViewCell"

    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with text: String) {
        label.text = text
    }
}
