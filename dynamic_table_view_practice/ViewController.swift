//
//  ViewController.swift
//  dynamic_table_view_practice
//
//  Created by 강대민 on 2021/11/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myTableView: UITableView!
    

    let contentArray = [
    "안녕?",
    "이건 두번째 셀이야.",
    "이건 세번째 셀이고.",
    "이건 긴 텍스트를 넣은 셀이야ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //셀 리소스 파일 가져오기
       // let myTableViewCellNib = UINib(nibName: "MyTableViewCell", bundle: Bundle?) 이렇게 해도 되고
        let myTableViewCellNib = UINib(nibName: String(describing: MyTableViewCell.self), bundle: nil)
        
        //셀에 리소스 등록
        //마이테이블뷰셀닙이라는 파일로 가져오고,  이름은 "마이테이블뷰셀"이다.
        self.myTableView.register(myTableViewCellNib, forCellReuseIdentifier: "myTableViewCell")
        
        //셀의 높이를 정하자, 오토매틱디멘션을 쓰면 알아서 정해줌.
        self.myTableView.rowHeight = UITableView.automaticDimension
        
        //디멘션만 걸어도 되는데 높이를 예측해보기 위한 코드
        self.myTableView.estimatedRowHeight = 120
        
        //아주 중요 이걸해야 델리게이트와 데이터소스가 연결됨.
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        
        print("contentArray.cont : \(contentArray.count)")
        
        
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    
    //테이블 뷰 셀의 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //카운트수만큼 어레이.
        return self.contentArray.count
    }
    
    
    //각 셀에 대한 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //디큐리저브셀은 재사용하는 셀이라는것
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myTableViewCell", for: indexPath) as! MyTableViewCell
        //as! MyTableViewCell은 나는 이놈으로 강제하겠다.라는 뜻
        cell.userContentLabel.text = contentArray[indexPath.row]
        
        return cell
        
    }
    
}
