//
//  NewsTableViewController.swift
//  RxSwiftMVVMNewsApp
//
//  Created by Evgeniy Uskov on 18.12.2020.
//

import UIKit
import RxSwift
import RxCocoa

class NewsTableViewController : UITableViewController {
    let disposeBag = DisposeBag()
    
    var viewModel: ArticleListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIHelper.setupNavBar(vc: self)
        populateNews()
    }
}

extension NewsTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.articleViewModels.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.newsCellId, for: indexPath) as? NewsCell else {fatalError("Unable to dequeue newsCell")}
        
        if let articleViewModel = viewModel?.article(at: indexPath.row) {
            articleViewModel.title.asDriver(onErrorJustReturn: "")
                .drive(cell.titleLabel.rx.text)
                .disposed(by: disposeBag)
            articleViewModel.description.asDriver(onErrorJustReturn: "")
                .drive(cell.descriptionLabel.rx.text)
                .disposed(by: disposeBag)
            cell.setup()
        }
        return cell
    }

}

extension NewsTableViewController {
    private func populateNews() {
        guard let url = URL.urlForNewsAPI() else {return}
        let resource = Resource<ArticleResponse>(url: url)
        
        URLRequest.load(resource: resource)
            .subscribe(onNext: {
                articleResponse in
                let articles = articleResponse.articles
                self.viewModel = ArticleListViewModel(articles: articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } )
            .disposed(by: disposeBag)
    }
}
