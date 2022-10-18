//
//  MainTableHandler.swift
//  HummerSystemTestStore
//
//  Created by Vladimir Izmaylov on 17.10.2022.
//

import UIKit

protocol MainTableDelegate: AnyObject {
    func tableViewDidScroll(offset: CGFloat)
}

class MainTableHandler: NSObject,
                        MainTableHandlerProtocol {
    
    private weak var tableView: UITableView?
    private var data: FakeStore = []
    weak var delegate: MainTableDelegate?
    
    func attach(_ tableView: UITableView) {
        self.tableView = tableView
        tableView.register(UINib(nibName: ItemCell.cellID, bundle: nil), forCellReuseIdentifier: ItemCell.cellID)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UIScreen.main.bounds.height / 4.2
        tableView.reloadData()
    }
    
    func setData(_ data: FakeStore) {
        self.data = data
        tableView?.reloadData()
    }
}

extension MainTableHandler: UITableViewDelegate,
                            UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.cellID, for: indexPath) as? ItemCell else { return .init() }
        cell.setData(data[indexPath.row])
        return cell
    }
}

extension MainTableHandler: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegate?.tableViewDidScroll(offset: scrollView.contentOffset.y)
    }
}

extension MainTableHandler: MainSegmentDelegate {
    func didSelectSegment(_ value: Category) {
        if let index = data.firstIndex(where: {$0.category.rawValue == value.rawValue}) {
            tableView?.contentInset.top = 50
            tableView?.scrollToRow(at: IndexPath(row: index, section: 0), at: .top, animated: true)
            tableView?.contentInset.top = 175
        }
    }
}
