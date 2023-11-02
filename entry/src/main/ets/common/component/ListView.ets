import { HomeArticle, HomeArticleModel } from '../http/response/HomeArticleResponse'
import router from '@ohos.router'

@Component
export default struct ListView {
  @Link homeArticleList: HomeArticle[]

  build() {
    Column() {
      List({ space: 10 }) {
        ForEach(this.homeArticleList, (item: HomeArticle) => {
          ListItem() {
            Text(item.title)
              .width('100%')
              .height(60)
              .fontSize(18)
              .fontColor(Color.Black)
              .textAlign(TextAlign.Start)
              .padding({ left: 16, right: 16 })
              .onClick(() => {
                router.pushUrl({
                  url: 'pages/ArticleDetailWebPage',
                  params: { path: item.link }
                })
              })
          }
        })
      }
      .divider({ strokeWidth: 2, color: 0xFFFFFF, startMargin: 16, endMargin: 16 })
      .listDirection(Axis.Vertical) // 排列方向
      .edgeEffect(EdgeEffect.Spring) // 滑动到边缘无效果
      .onReachStart(() => {

      })
      .onReachEnd(() => {

      })
    }
    .height('100%')
    .backgroundColor(0xF1F3F5)
  }
}