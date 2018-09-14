//
//  GitHubReposViewController.swift
//  GitList
//
//  Created by Devon Boyer on 9/8/18.
//  Copyright © 2018 Devon Boyer. All rights reserved.
//

import UIKit

class GitHubReposViewController: UITableViewController {
    
    let client: GitHubClient
    
    // Our list of all the repos that will be displayed in the table
    var myRepos = [GitHubRepo]()
    
    init(client: GitHubClient) {
        self.client = client
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        // We won't support using Interface Builder for this class.
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        // Configure the table view
        tableView.register(GitHubRepoTableViewCell.self, forCellReuseIdentifier: "GitHubRepo")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = NavigationTitleView(title: "My Repos", username: client.username)
        
        // 3. Make an HTTP request for our GitHub repos
    }
    
    // MARK: UITableViewDataSource
    
    // 2. Implement UITableViewDataSource required methods.
    
    // MARK: UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        print("Tapped cell at row \(indexPath.row)")
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72.0
    }
}

class NavigationTitleView: UIView {
    
    let titleLabel = UILabel()
    let usernameLabel = UILabel()
    
    init(title: String, username: String) {
        super.init(frame: .zero)
        
        titleLabel.text = title
        usernameLabel.text = "@\(username)"
        
        addSubview(titleLabel)
        addSubview(usernameLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true

        usernameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0).isActive = true
        usernameLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        usernameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2).isActive = true
        
        // Fonts
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        usernameLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)

        // Text colors
        usernameLabel.textColor = Colors.lightTextColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        // We won't support using Interface Builder for this class.
        fatalError("init(coder:) has not been implemented")
    }
}

