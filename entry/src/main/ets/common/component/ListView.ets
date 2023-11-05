import { HomeArticle, HomeArticleModel, HomeArticleResponse } from '../http/response/HomeArticleResponse'
import router from '@ohos.router'
import { Logger } from '../utils/Logger'
import ApiManager from '../http/ApiManager'
import axios, { Axios, AxiosError, AxiosResponse } from '@ohos/axios'

@Component
export default struct ListView {
  @State homeArticleList: Array<HomeArticle> = new Array()
  @State page: number = 0

  aboutToAppear() {
    this.requestHomeArticle()
  }

  requestHomeArticle() {
    // ApiManager.getInstance().requestHomeArticle(this.page).then((resp: HomeArticleResponse) => {
    //   if (resp.errorCode == 0 && resp.data != null) {
    //     if (this.page === 0) {
    //       this.homeArticleList = resp.data.datas
    //     } else {
    //       if (resp.data != null && resp.data.datas != null) {
    //         resp.data.datas.forEach(item => {
    //           this.homeArticleList.push(item);
    //         })
    //       }
    //     }
    //     this.homeArticleList.forEach(item => {
    //       Logger.info("alex", item.title)
    //     })
    //   }
    // }).catch((e) => {
    //   Logger.info(e)
    // })

    let axios = globalThis.axios as Axios
    axios.get<HomeArticleResponse, AxiosResponse<HomeArticleResponse>, null>(`article/list/${this.page}/json`)
      .then((response: AxiosResponse<HomeArticleResponse>) => {
        if (this.page === 0) {
          this.homeArticleList = response.data.data.datas
        } else {
          if (response.data != null && response.data.data != null && response.data.data.datas != null) {
            response.data.data.datas.forEach(item => {
              this.homeArticleList.push(item);
            })
          }
        }
        this.homeArticleList.forEach(item => {
          Logger.info("alex", item.title)
        })
      }).catch((error: AxiosError) => {
    })

  }

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
        if (this.page != 0) {
          this.page = 0
          this.requestHomeArticle()
          Logger.error("alex", "onReachStart")
        }
      })
      .onReachEnd(() => {
        this.page = this.page + 1
        this.requestHomeArticle()
        Logger.error("alex", "onReachEnd")
      })
    }
    .height('100%')
    .backgroundColor(0xF1F3F5)
  }
}