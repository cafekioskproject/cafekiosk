//
//  ViewController.swift
//  cafeKiosk
//
//  Created by 문기웅 on 4/1/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var categorySegmentControl: UISegmentedControl!
    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet weak var selectMenuTableView: UITableView!
    @IBOutlet weak var totalSelectCount: UILabel!
    @IBOutlet weak var totalSelectPrice: UILabel!
    
    var menuList: [MenuData] = []
    var selectedMenuList: [MenuData] = []
    var selectCount: Int = 0
    var selectPrice: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        menuList = coffeeMenuList
        
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        
        selectMenuTableView.delegate = self
        selectMenuTableView.dataSource = self
        
    }


    //  카테고리 탭 기능
    @IBAction func tappedCategory(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            menuList = coffeeMenuList
        case 1:
            menuList = beverageMenuList
        case 2:
            menuList = foodMenuList
        default:
            break
        }
        menuCollectionView.reloadData()
    }
    
    // 하단 버튼 alert (전체삭제버튼과 결제버튼에 테이블뷰를 비우는 작업 필요)
    @IBAction func callButton(_ sender: Any) {
        let alert1 = UIAlertController(title: "직원 호출", message: "직원을 호출하시겠습니까?", preferredStyle: .alert)
        let confirm1 = UIAlertAction(title: "예", style: .default)
        let cancel1 = UIAlertAction(title: "취소", style: .default)
        
        alert1.addAction(confirm1)
        alert1.addAction(cancel1)
        present(alert1, animated: true)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        let alert2 = UIAlertController(title: "주문 전체 삭제", message: "주문을 모두 삭제하시겠습니까?", preferredStyle: .alert)
        let confirm2 = UIAlertAction(title: "예", style: .default, handler: { [self]_ in 
            self.selectCount = 0
            self.selectPrice = 0
            self.totalSelectCount.text = String(selectCount)
            self.totalSelectPrice.text = String(selectPrice)
            self.selectedMenuList.removeAll()
            selectMenuTableView.reloadData()
        })
        let cancel2 = UIAlertAction(title: "취소", style: .default)
        
        alert2.addAction(confirm2)
        alert2.addAction(cancel2)
        present(alert2, animated: true)
    }
    
    @IBAction func payButton(_ sender: Any) {
        let alert3 = UIAlertController(title: "결제", message: "결제 하시겠습니까?", preferredStyle: .alert)
        let confirm3 = UIAlertAction(title: "예", style: .default, handler: { [self]_ in
            self.selectCount = 0
            self.selectPrice = 0
            self.totalSelectCount.text = String(selectCount)
            self.totalSelectPrice.text = String(selectPrice)
            self.selectedMenuList.removeAll()
            selectMenuTableView.reloadData()
        })
        let cancel3 = UIAlertAction(title: "취소", style: .default)
        
        alert3.addAction(confirm3)
        alert3.addAction(cancel3)
        present(alert3, animated: true)
    }
    

    
}

// 컬렉션뷰에 데이터 전달
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = menuCollectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! MenuCell
        cell.backgroundColor = .systemGray6
        cell.menuName.text = menuList[indexPath.row].name
        cell.menuImage.image = menuList[indexPath.row].image
        cell.menuPrice.text = menuList[indexPath.row].price
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedMenuList.append(menuList[indexPath.row])
        selectCount += 1
        selectPrice += Int(menuList[indexPath.row].price)!
        
        print("\(indexPath.row)선택됨")
        print(selectedMenuList)
        print(selectCount)
        totalSelectCount.text = String(selectCount)
        totalSelectPrice.text = String(selectPrice)
        
        selectMenuTableView.reloadData()
    }
}



class MenuCell: UICollectionViewCell {

    @IBOutlet weak var menuName: UILabel!
    @IBOutlet weak var menuPrice: UILabel!
    @IBOutlet weak var menuImage: UIImageView!
    
}



// 선택된 메뉴를 테이블뷰 데이터 전달
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedMenuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = selectMenuTableView.dequeueReusableCell(withIdentifier: "SelectedCell", for: indexPath) as! SelectedCell
        cell.selectImage.image = selectedMenuList[indexPath.row].image
        cell.selectMenuName.text = selectedMenuList[indexPath.row].name
        
        
        return cell
        
    }
    
    
    
}

class SelectedCell: UITableViewCell {
    
    @IBOutlet weak var selectImage: UIImageView!
    @IBOutlet weak var selectMenuName: UILabel!
    
}

