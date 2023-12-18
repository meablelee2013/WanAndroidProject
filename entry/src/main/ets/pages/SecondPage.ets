@Entry
@Component
struct SecondPage {
  @State message: string = 'Hello World,this is the second page'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }

  pageTransition() {
    //从底部进来
    PageTransitionEnter({ duration: 600, curve: Curve.Smooth })
      .slide(SlideEffect.Bottom);
    //朝底部出去
    PageTransitionExit({ duration: 600, curve: Curve.Smooth })
      .slide(SlideEffect.Bottom);
  }
}