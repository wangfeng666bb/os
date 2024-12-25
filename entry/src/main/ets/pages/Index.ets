@Entry
@Component
struct Index {
  // 添加状态变量来存储演示结果
  @State unaryResults: string[] = []
  @State decrementResults: string[] = []
  @State comparisonResults: string[] = []
  @State equalityResults: string[] = []
  @State logicalResults: string[] = []
  @State precedenceResults: string[] = []

  aboutToAppear() {
    // 在组件出现前计算所有结果
    this.calculateUnaryOperator()
    this.calculateDecrementOperator()
    this.calculateComparisonOperator()
    this.calculateEqualityDemo()
    this.calculateLogicalOperator()
    this.calculateOperatorPrecedence()
  }

  @Builder
  ResultCard(title: string, results: string[]) {
    Column() {
      Text(title)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
      
      Column() {
        ForEach(results, (item: string) => {
          Text(item)
            .fontSize(16)
            .margin(5)
            .backgroundColor('#F5F5F5')
            .padding(10)
            .borderRadius(6)
            .width('100%')
        })
      }
      .backgroundColor(Color.White)
      .padding(15)
      .borderRadius(12)
      .width('100%')
    }
    .margin({ bottom: 20 })
  }

  build() {
    Scroll() {
      Column() {
        Text('JavaScript 运算符演示')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, bottom: 20 })
        
        this.ResultCard('一元运算符示例', this.unaryResults)
        this.ResultCard('自减运算符示例', this.decrementResults)
        this.ResultCard('比较运算符示例', this.comparisonResults)
        this.ResultCard('相等性比较示例', this.equalityResults)
        this.ResultCard('逻辑运算符示例', this.logicalResults)
        this.ResultCard('运算符优先级示例', this.precedenceResults)
      }
      .width('100%')
      .padding({ left: 16, right: 16 })
    }
    .scrollBar(BarState.Auto)
    .width('100%')
    .height('100%')
    .backgroundColor('#F0F0F0')
  }

  private calculateUnaryOperator() {
    let num: number = 10
    let res1: number = num++
    this.unaryResults.push(`res1: ${res1}`) // 10
    this.unaryResults.push(`num: ${num}`)   // 11

    let num2: number = 10
    let res2: number = ++num2
    this.unaryResults.push(`res2: ${res2}`) // 11
    this.unaryResults.push(`num2: ${num2}`) // 11
  }

  private calculateDecrementOperator() {
    let num2: number = 10
    let res2: number = --num2
    this.decrementResults.push(`res2: ${res2}`) // 9
    this.decrementResults.push(`num2: ${num2}`) // 9
  }

  private calculateComparisonOperator() {
    let num1: number = 11
    let num2: number = 11
    this.comparisonResults.push(`num1 > num2: ${num1 > num2}`)  // false
    this.comparisonResults.push(`num1 < num2: ${num1 < num2}`)  // false
    this.comparisonResults.push(`num1 >= num2: ${num1 >= num2}`) // true
  }

  private calculateEqualityDemo() {
    let num1: number = 200
    let num2: number = 201
    this.equalityResults.push(`num1 == num2: ${num1 == num2}`) // false

    let password: string = '123456'
    let password2: string = '123456'
    this.equalityResults.push(`password == password2: ${password == password2}`) // true
  }

  private calculateLogicalOperator() {
    this.logicalResults.push(`3 > 5 && 5 < 9: ${3 > 5 && 5 < 9}`) // false
    this.logicalResults.push(`5 > 2 && 5 < 9: ${5 > 2 && 5 < 9}`) // true
    this.logicalResults.push(`3 > 5 || 5 < 9: ${3 > 5 || 5 < 9}`) // true
    this.logicalResults.push(`5 > 20 || 5 < 1: ${5 > 20 || 5 < 1}`) // false
    this.logicalResults.push(`!true: ${!true}`) // false
  }

  private calculateOperatorPrecedence() {
    this.precedenceResults.push(`2 + 2 * 3 = ${2 + 2 * 3}`) // 8
    this.precedenceResults.push(`(2 + 2) * 3 = ${(2 + 2) * 3}`) // 12
    this.precedenceResults.push(`2 * 3 > 4 == false: ${2 * 3 > 4 == false}`) // false
    this.precedenceResults.push(`!true == 3 * 3 > 4: ${!true == 3 * 3 > 4}`) // false
  }
}
