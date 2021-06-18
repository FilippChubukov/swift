import Darwin

/* First task */

/* ax^2 + b + c = 0 */
let a: Double = 1
let b: Double = 3
let c: Double = -4

let disc: Double = (b * b) - (4 * a * c)
let disc_sqr: Double = sqrt(disc)

if disc == 0 {
    print ("Корень один: \((-1.0) * b / (2.0 * a))")
} else if disc > 0 {
    print ("Первый корень: \(((-1.0) * Double(b) + disc_sqr) / (2.0 * a))")
    print ("Второй корень: \(((-1.0) * Double(b) - disc_sqr) / (2.0 * a))")
} else {
    print("Корней нет")
}
    
/* Second task */

let cathet_a: Double = 6
let cathet_b: Double = 8

let hypotinuse = sqrt(cathet_a * cathet_a + cathet_b * cathet_b)

print("Гипотинуза: \(hypotinuse)")
print("Периметр: \(cathet_a + cathet_b + hypotinuse)")
print("Площадь: \(cathet_a * cathet_b * 0.5)")

/* Third task */
/* Playground can't readline */
var money: Double = 100
let percent: Double = 10

for i in 1...5 {
    money = money + money * (percent / 100)
}

print("Сумма вклада спустя 5 лет : \(money)")
