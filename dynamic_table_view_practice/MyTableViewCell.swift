//
//  MyTableViewCell.swift
//  dynamic_table_view_practice
//
//  Created by 강대민 on 2021/11/05.
//

import Foundation
import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userProfileImg: UIImageView!
    @IBOutlet weak var userContentLabel: UILabel!
    
    
    //셀이 렌더링 될 때 (셀이 그려질 때)
    override func awakeFromNib() {
        super.awakeFromNib()
        
        print("MyTableViewCell - awakeFromNib() called")
        
        //프로필 사진 사각형틀에 라운드넣기
        userProfileImg.layer.cornerRadius = userProfileImg.frame.width / 2
        
        
        
    }
}
