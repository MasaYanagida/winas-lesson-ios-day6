//
//  ViewController.swift
//  Day6Sample
//
//  Created by 柳田昌弘 on 2021/01/20.
//

import UIKit

class ViewController: UIViewController {
    
    private var contents = [Content]()

    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0 ..< 20 {
            contents.append(Content.create())
        }
                
        /*if let content = contents[safe: 20] {
            let controller = UIAlertController.init(title: "選択したセル", message: content.description, preferredStyle: .alert)
            controller.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
            present(controller, animated: true, completion: nil)
        } else {
            let controller = UIAlertController.init(title: "選択したセル", message: "NULL!!", preferredStyle: .alert)
            controller.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
            present(controller, animated: true, completion: nil)
        }*/
    }
    
    @IBOutlet private dynamic weak var button: UIButton!
    @IBOutlet private dynamic weak var stackView: UIStackView!
    @IBOutlet private dynamic weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    @IBAction private func buttonTouchUpInside(_ sender: UIButton) {
        //let controller = SampleHeaderViewController.fromStoryboard()
        //let controller = SampleScrollViewController.fromStoryboard()
        let controller = SampleCollectionViewController.fromStoryboard()
        navigationController?.pushViewController(controller, animated: true)
    }
}

// MARK: - SampleHeaderDelegate

extension ViewController: SampleHeaderDelegate {
    func sampleHeader(iconTouchUpInside view: SampleHeader) {
        // do nothing
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let content = contents[indexPath.row]
        let cell = UITableViewCell()
        cell.selectionStyle = .gray
        cell.textLabel?.text = content.name
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let content = contents[indexPath.row]
        let controller = UIAlertController.init(title: "選択したセル", message: content.description, preferredStyle: .alert)
        controller.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
        present(controller, animated: true, completion: nil)
    }
}

