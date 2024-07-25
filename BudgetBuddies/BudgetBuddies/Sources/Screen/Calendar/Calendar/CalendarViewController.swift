//
//  CalendarViewController.swift
//  BudgetBuddies
//
//  Created by 김승원 on 7/24/24.
//

import UIKit
import SnapKit

final class CalendarViewController: UIViewController {
    // MARK: - Properties
//    private let heightBetweenCells: CGFloat = 12
//    private let heightOfCell: CGFloat = 72
    
    // MARK: - UI Components
    lazy var tableView = UITableView()

    // MARK: - Life Cycle ⭐️
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = BudgetBuddiesAsset.AppColor.background.color
        
        setupNavigationBar()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBar()
    }
    
    // MARK: - Set up NavigationBar
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Set up TableView
    private func setupTableView() {
        
        registerTableViewCell()
        
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.allowsSelection = true
        tableView.showsVerticalScrollIndicator = false
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.view.addSubview(tableView)
        
        // 제약조건
        tableView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }
    
    // MARK: - Register TableView Cell
    private func registerTableViewCell() {
        tableView.register(BannerCell.self, forCellReuseIdentifier: BannerCell.identifier)
        tableView.register(MainCalendarCell.self, forCellReuseIdentifier: MainCalendarCell.identifier)
        tableView.register(InfoTitleWithButtonCell.self, forCellReuseIdentifier: InfoTitleWithButtonCell.identifier)
    }
}

// MARK: - UITableView DataSource
extension CalendarViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tempCell = UITableViewCell()
        tempCell.backgroundColor = .gray
        
        if indexPath.row == 0 { // 상단 배너
            let bannerCell = tableView.dequeueReusableCell(withIdentifier: BannerCell.identifier, for: indexPath) as! BannerCell
            return bannerCell
            
        } else if indexPath.row == 1 { // 메인 캘린더
            let mainCalendarCell = tableView.dequeueReusableCell(withIdentifier: MainCalendarCell.identifier, for: indexPath) as! MainCalendarCell
            return mainCalendarCell
            
        } else if indexPath.row == 2 { // 할인정보 타이틀, 전체보기 버튼
            let infoTitleWithButtonCell = tableView.dequeueReusableCell(withIdentifier: InfoTitleWithButtonCell.identifier, for: indexPath) as! InfoTitleWithButtonCell
            infoTitleWithButtonCell.configure(infoType: .discount)
            return infoTitleWithButtonCell
            
        } else if indexPath.row == 5 { // 지원정보 타이틀, 전체보기 버튼
            let infoTitleWithButtonCell = tableView.dequeueReusableCell(withIdentifier: InfoTitleWithButtonCell.identifier, for: indexPath) as! InfoTitleWithButtonCell
            infoTitleWithButtonCell.configure(infoType: .support)
            return infoTitleWithButtonCell
        }
        
        return tempCell
        
    }
}

// MARK: - UITableView Delegate
extension CalendarViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 { // 상단 배너
            return 127 //
            
        } else if indexPath.row == 1 { // 메인 캘린더
            return 532 + 6
            
        } else if indexPath.row == 2 { // 할인정보 타이틀, 전체보기 버튼
            return 64
            
        } else if indexPath.row == 5 { // 지원정보 타이틀, 전체보기 버튼
           return 64
           
       }
        
        return 100
    }
}
