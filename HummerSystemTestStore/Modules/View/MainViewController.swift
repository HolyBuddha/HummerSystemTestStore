//
//  MainViewController.swift
//  HummerSystemTestStore
//
//  Created by Vladimir Izmaylov on 17.10.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainPresenterInput?
    var tableHandler: MainTableHandlerProtocol?
    var tableView: UITableView!
    var header = MainTableHeader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.attach(self)
        presenter?.viewDidLoad()
        tableHandler?.attach(tableView)
    }
}

extension MainViewController: MainPresenterOutput {
    
    func configureUi() {
        view.backgroundColor = .white
        tableView = UITableView(frame: view.frame, style: .grouped)
        tableView.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.contentInset.top = 175
        tableView.snp.makeConstraints() {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(view.snp.bottom)
        }
        view.addSubview(header)
        header.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .systemBackground
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        navigationItem.leftBarButtonItem = .init(title: "London", style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    func didReceiveMainData(catalog: FakeStore) {
        tableHandler?.setData(catalog)
    }
}

extension MainViewController: MainTableDelegate {
    func tableViewDidScroll(offset: CGFloat) {
       let zeroOffset = offset + 175
        let yOffset = zeroOffset >= 155 ? 155 : zeroOffset
        header.snp.updateConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(-yOffset)
        }
    }
}
