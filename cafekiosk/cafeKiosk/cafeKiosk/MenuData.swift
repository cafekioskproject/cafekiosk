//
//  MenuData.swift
//  cafeKiosk
//
//  Created by 문기웅 on 4/2/24.
//

import Foundation
import UIKit

struct MenuData {
    let name: String
    let price: String
    var image: UIImage
    
    init(name: String, price: String, image: UIImage) {
        self.name = name
        self.price = price
        self.image = image
    }
}

let ameri = MenuData(name: "아메리카노", price: "4500", image: UIImage(named: "ameri")!)
let latte = MenuData(name: "카페라떼", price: "5000", image: UIImage(named: "latte")!)
let caramel = MenuData(name: "카라멜마끼아또", price: "5500", image: UIImage(named: "caramel")!)
let dolce = MenuData(name: "돌체라떼", price: "5500", image: UIImage(named: "dolce")!)

var coffeeMenuList: [MenuData] = [ameri,latte,caramel,dolce]

let lemon = MenuData(name: "레몬에이드", price: "5500", image: UIImage(named: "lemon")!)
let milkChoco = MenuData(name: "밀크초코", price: "5500", image: UIImage(named: "milkChoco")!)
let matcha = MenuData(name: "말차라떼", price: "6000", image: UIImage(named: "matcha")!)
let mango = MenuData(name: "망고스무디", price: "6000", image: UIImage(named: "mango")!)

var beverageMenuList: [MenuData] = [lemon,milkChoco,matcha,mango]


let chocoCake = MenuData(name: "초코케이크", price: "5500", image: UIImage(named: "chocoCake")!)
let pecanPie = MenuData(name: "피칸파이", price: "5500", image: UIImage(named: "pecan")!)
let cheeseCake = MenuData(name: "바스크 치즈케이크", price: "5500", image: UIImage(named: "cheeseCake")!)

var foodMenuList: [MenuData] = [chocoCake,pecanPie,cheeseCake]
