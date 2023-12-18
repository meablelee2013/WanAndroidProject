import router from '@ohos.router'
import MineTreeList from './MineTreeList'
import {TitleBarComponent} from './TitleBarComponent'

@Component
export default struct Mine {
  build() {
    Button('Mine')
      .onClick(() => {
        router.pushUrl({
          url: "pages/SecondPage"
        })
      })
  }
}