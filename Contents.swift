import Cocoa
import Darwin

/**
 cmd + shift + enter ==> run the playgroud
 */
func print_title(title: String) -> Void
{
    print("\n")
    let targetStr = "============ " + title + " ============="
    print(targetStr)
}

func print_subTitle(sub: String) -> Void
{
    print("\n")
    let targetStr = ">>> " + sub
    print(targetStr)
}

print_title(title: "Value")
// 变量 var, 常量 let
print_subTitle(sub: "变量 var, 常量 let")
var variable = "a string variable"
let constant = "a string constant"

print(variable)
print(constant)

// value in string
print_subTitle(sub: "value in string")
let a = 3
let b = 4
let summary = "\(a) + \(b) = \(a + b)" // 显然这边允许放置的是一个表达式
print(summary)

print_subTitle(sub: "多行文本")
let quotation = """
I said "I have \(a) apples."
And then I said "I have \(a + b) pieces of fruit."
"""

print(quotation)

print_title(title: "Array and Dictionary")

print_subTitle(sub: "array")
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water" // 默认是可变的
print(shoppingList)

print("after append")
shoppingList.append("blue paint")
print(shoppingList)

print_subTitle(sub: "dictionary")
var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"

print(occupations)

print_subTitle(sub: "empty array & empty dictionary")
let emptyArray: [String] = []
let emptyDictionary: [String: Float] = [:]
print(emptyArray)
print(emptyDictionary)


print_title(title: "控制流")

print_subTitle(sub: "if 1 > 2 {} else {}")
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

print_subTitle(sub: "在类型后面加一个问号（?）来标记这个变量的值是可选的。")
var optionalString: String? = "Hello"
print(optionalString == nil)

//var optionalName: String? = "John Appleseed"
var optionalName: String? = nil
//var optionalName: String = "John Appleseed"
// 报错  error: initializer for conditional binding must have Optional type, not 'String'
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
    print(greeting)
} else {
    print("nil value")
}

print_subTitle(sub: "另一种处理可选值的方法是通过使用 ?? 操作符来提供一个默认值。")

let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"

print(informalGreeting)

print_subTitle(sub: "switch 支持任意类型的数据以及各种比较操作")

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

print_subTitle(sub: "for-in array and dictionary")
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)
// 输出 "25"


print_subTitle(sub: "while语句")
var n = 2
while n < 100 {
    n *= 2
}
print(n)

var m = 2
repeat {
    m *= 2
} while m < 100
print(m)

print_subTitle(sub: "奇怪的语法糖: ..<")
var total = 0
for i in 0..<4 {
    total += i
}
print(total)

print_title(title: "函数和闭包")

print_subTitle(sub: "函数")
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
let value:String = greet(person:"Bob", day: "Tuesday")

print(value)

print_subTitle(sub: "参数标签")
func greet(_ person: String, on day: String) -> String { // 比如这边的 on, _下划线表示不用参数标签
    return "Hello \(person), today is \(day)."
}
print(greet("John", on: "Wednesday")) // 调用函数的时候就可以用上


print_subTitle(sub: "元组返回值")
// 想问问是不是从Python抄过来的
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (min, max, sum)
}
let statistics = calculateStatistics(scores:[5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2) // 元组.2
print(type(of:statistics))


print_subTitle(sub: "函数可以嵌套")

func returnFifteen() -> Int {
    var y = 10
    func add() { // 还是挺有意思的
        y += 5
    }
    add()
    return y
}
var rst = returnFifteen()
print(rst)

// 函数是第一等类型，这意味着函数可以作为另一个函数的返回值。
print_subTitle(sub: "函数作为返回值")
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer() // 返回一个函数，(Int) -> Int， 参数是Int， 返回值是Int
rst = increment(7)
print(rst)

// 函数作为参数
print_subTitle(sub: "函数作为参数")
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func anyLessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
var boolRst = hasAnyMatches(list: numbers, condition: anyLessThanTen)
print(boolRst)

// 匿名闭包 {}
// 可以使用 {} 来创建一个匿名闭包。使用 in 将参数和返回值类型的声明与闭包函数体进行分离。
print_subTitle(sub: "匿名函数-闭包-Lambda表达式")
let lambdaRst = numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

print(lambdaRst)

// 闭包的简化语法，省略
// 1. 忽略了 参数、返回值
// 2. 单个语句闭包会把它语句的值当做结果返回 # 这可能是来自于ruby
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

let expression = {aa in aa >= 0}
print("省略单个参数的闭包:", expression)
//let expression2 = {aa, bb, cc in (aa + bb) + cc >= 0} // error: cannot find 'cc' in scope. 看来省略参数的语法糖，只适合 0 ~ 1 个参数
let expression2 = {aa in [aa, 1,2,3,4]} // 直接返回闭包呢， 是可以的
print("多个返回值的闭包:", expression2, expression2(-1))

// 通过参数位置而不是参数名字来引用参数
let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)

// 普通的函数能省略参数吗
func funcExample(param1: String, param2: String) {
    print("input:\(param1) \(param2)")
}

//funcExample "a","b" // 是不行的， 和 ruby 的差别还是有不少的

////////////////////////////////////////////////////////////////////////////////////////
///
///                对象和类
///
////////////////////////////////////////////////////////////////////////////////////////

print_title(title: "对象和类")

print_subTitle(sub: "class")

class Shape {
    var numberOfSides = 0 // 边的个数
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
print(shapeDescription)

class NamedShape {
    var numberOfSides: Int = 0 // 边的个数
    var name: String // 名字

    init(name: String) {
        self.name = name
    }

    func simpleDescription() -> String {
        return "A shape named:\(name) with \(numberOfSides) sides."
    }
}

var nameShape = NamedShape(name: "rectAngle")
nameShape.numberOfSides = 4
print(nameShape.simpleDescription())

class Square: NamedShape {
    var sideLength: Double

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name) // 调用 super
        numberOfSides = 4
    }

    func area() ->  Double {
        return sideLength * sideLength // 注意这里没有用 self
    }

    override func simpleDescription() -> String { // 重写父类的操作
        return "A square with sides of length \(sideLength)."
    }
}

let test = Square(sideLength: 5.2, name: "my test square")
test.area()
print(test.simpleDescription())

print_subTitle(sub: "getter and setter")

// 等边三角形
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }

    var perimeter: Double {
        // 三角形周长的获取
        get { // 这..这tm看着是直接放一个函数指针在这里
            return 3.0 * sideLength
        }
        // 三角形周长的设置
        set { // 哪里来的 newValue -> 是语法糖，编译器会去处理，
            sideLength = newValue / 3.0
        }
    }

    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

print_subTitle(sub: "willSet and didSet")

class TriangleAndSquare {
    var triangle: EquilateralTriangle { // 等边三角形
        willSet { /// 将要设置自己的变量triangle
            square.sideLength = newValue.sideLength
        }
        didSet {
            
        }
    }
    var square: Square { // 正方形
        willSet {
            triangle.sideLength = newValue.sideLength
        }
        didSet
        {
            
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)

print_subTitle(sub: "可选值 ?")
/**
 * 可选值
 处理变量的可选值时，你可以在操作（比如方法、属性和子脚本）之前加 ?。如果 ? 之前的值是 nil，? 后面的东西都会被忽略，并且整个表达式返回 nil。否则，可选值会被解包，之后的所有代码都会按照解包后的值运行。在这两种情况下，整个表达式的值也是一个可选值。
 * /// 子脚本 应该说的是subscripte, 下标方法
 */
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength


print_title(title: "枚举和结构体")
enum Rank: Int {
    case ace = 1 // 你也可以使用字符串或者浮点数作为枚举的原始值。# 真的可以吗? 枚举在这里，和结构体， 和类的区别， 越来越小了
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue // rawValue 看着也是个语法糖
print(ace, aceRawValue)


print_subTitle(sub: "枚举值创建")
// init?(rawValue:)
if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
    print(threeDescription)
}


// 枚举值是实际值，并不是原始值的另一种表达方法。
enum Suit {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self { // 在 switch 里，枚举成员使用缩写 .hearts 来引用，因为 self 的值已经是一个 suit 类型。在任何已知变量类型的情况下都可以使用缩写。
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
print(heartsDescription)

//
enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")

switch success {
case let .result(sunrise, sunset): // 这也可以啊.. sunrise， sunset 是局部变量， 什么奇怪语法糖
    print("Sunrise is at \(sunrise) and sunset is at \(sunset)")
case let .failure(message):
    print("Failure...  \(message)")
}


print_subTitle(sub: "结构体")
// 使用 struct 来创建一个结构体。结构体和类有很多相同的地方，包括方法和构造器。它们之间最大的一个区别就是结构体是传值，类是传引用。
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
print(threeOfSpadesDescription)


print_title(title: "协议和扩展")

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}






