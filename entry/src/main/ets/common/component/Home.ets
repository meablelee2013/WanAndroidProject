import SwiperView from './SwiperView'
import TitleBarComponent from './TitleBarComponent'
import { HomeBanner, HomeBannerResponse } from '../http/response/HomeBannerResponse'
import ApiManager from '../http/ApiManager'
import { Logger } from '../utils/Logger'
import { HomeArticle, HomeArticleModel, HomeArticleResponse } from '../http/response/HomeArticleResponse'
import ListView from './ListView'
import { ApiResponse } from '../http/base/ApiResponse'

@Preview
@Component
export default struct Home {
  @State homeBannerList: HomeBanner[] = null
  // @State homeArticleModel: HomeArticleModel = null
  @State homeArticleList: HomeArticle[] = null
  @State page: number = 0

  aboutToAppear() {
    ApiManager.getInstance().requestHomeBanner().then((resp: HomeBannerResponse) => {
      if (resp.errorCode == 0) {
        this.homeBannerList = resp.data
      }
    }).catch((e) => {
      Logger.info(e)
    })
  }

  build() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Start, alignContent: FlexAlign.Center }) {

      TitleBarComponent({ isBack: false })
      SwiperView({ homeBannerList: $homeBannerList })
      ListView( )

    }.height('100%').width('100%')

  }
}

