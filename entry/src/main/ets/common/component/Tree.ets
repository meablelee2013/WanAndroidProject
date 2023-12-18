import MineTreeList from './MineTreeList'
import {TitleBarComponent} from './TitleBarComponent'

@Preview
@Component
export default struct Tree {
  build() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Start, alignContent: FlexAlign.Start }) {

      TitleBarComponent({ isBack: false })
      MineTreeList()

    }.height('100%').width('100%')
  }
}