import CommonConstants from '../common/CommonConstants'
import Home from '../common/component/Home'
import Mine from '../common/component/Mine'


@Entry
@Component
struct Index {
  @State fontColor: string = '#182431'
  @State selectedFontColor: string = '#007DFF'
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
      TabContent() {
        Home()
      }.tabBar(this.TabBuilder(CommonConstants.HOME_TITLE, CommonConstants.HOME_TAB_INDEX,
        $r('app.media.home_selected'), $r('app.media.home_normal')))

      TabContent() {
        Mine()
      }.tabBar(this.TabBuilder(CommonConstants.MINE_TITLE, CommonConstants.MINE_TAB_INDEX,
        $r('app.media.mine_selected'), $r('app.media.mine_normal')))
    }.onChange((index: number) => {
      this.currentIndex == index
    })
  }

  @Builder TabBuilder(title: string, index: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === index ? selectedImg : normalImg)
        .width(24).height(24).margin({ bottom: 4 }).objectFit(ImageFit.Contain)

      Text(title)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(10)
        .fontWeight(500)
        .lineHeight(14)
    }.width('100%')
    .onClick(() => {
      this.currentIndex = index
      this.controller.changeIndex(index)
    })
  }
}
