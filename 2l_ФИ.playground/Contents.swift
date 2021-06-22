/* task 1 */

func even_num (_ num: Int) {
    if num % 2 == 0 {
        print("Число четное.")
    } else {
        print("Число нечетное.")
    }
}
even_num(1001)

/* task 2 */

func mult_of_three(_ num: Int) {
    if num % 3 == 0 {
        print("Число кратно трем.")
    } else {
        print("Число не кратно трем.")
    }
}
mult_of_three(9991)

/* task 3 */

var arr = [Int] (0...99)

/* task 4 */

var arr_len = arr.count
var pos = 0

while true {
    if (arr[pos] % 2 == 0 || arr[pos] % 3 != 0) {
        arr.remove(at: pos)
        arr_len -= 1
    } else {
        pos += 1
    }
    
    if pos >= arr_len {
        break
    }
}
print("Полученный массив:")
print(arr)

/* task 5 */

func fib (_ arr: [Int]) -> Int {
    return arr[arr.count - 1] + arr[arr.count - 2]
}

var arr_fib = [Int] (0...1)

for i in 1...50 {
    arr_fib.append(fib(arr_fib))
}

print("Последовательность Фибоначчи:")
print(arr_fib)


/* task 6 */

var arr_er = [Int] (2...545)
var tmp: Int
var i = 0
arr_len = arr_er.count

while true {
    tmp = arr_er[i]
    pos = i + 1
    
    while true {
        if pos >= arr_len {
            break
        }
        
        if arr_er[pos] % tmp == 0 {
            arr_er.remove(at: pos)
            arr_len -= 1
        } else {
            pos += 1
        }
    }
    
    i = i + 1
    if i >= arr_len {
        break
    }
}

print("Простые чила:")
print(arr_er)
