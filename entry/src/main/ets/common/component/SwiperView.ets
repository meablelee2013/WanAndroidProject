import router from '@ohos.router';
import CommonConstants from '../CommonConstants'
import { HomeBanner } from '../http/response/HomeBannerResponse'


@Component
export default struct SwiperView {
  @StorageProp('currentDeviceSize') currentDeviceSize: string = CommonConstants.SM;
  private swiperController: SwiperController = new SwiperController()
  @Link homeBannerList: HomeBanner[]

  build() {
    Swiper(this.swiperController) {
      ForEach(this.homeBannerList, (item: HomeBanner) => {
        Image(item.imagePath)
          .borderRadius('16vp')
          .width('100%')
          .height(160)
          .objectFit(ImageFit.Contain)
          .onClick(() => {
            router.pushUrl({
              url: 'pages/ArticleDetailWebPage',
              params: { path: item.url }
            })
          })
      }, (item: Resource) => JSON.stringify(item))
    }
    .displayCount(CommonConstants.SWIPER_CACHE_COUNT)
    .autoPlay(true)
    .width('100%')
    .height(180)
    .interval(3000)
    .itemSpace(this.currentDeviceSize === CommonConstants.SM ?
      0 : 12)
    .margin('12vp')
    .displayCount(this.currentDeviceSize === CommonConstants.SM ?
      1 : (this.currentDeviceSize === CommonConstants.MD ? 2 : 3))
  }
}