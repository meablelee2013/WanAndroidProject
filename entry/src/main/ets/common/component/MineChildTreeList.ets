import axios, { Axios, AxiosError, AxiosResponse } from '@ohos/axios'
import { TreeModel, TreeResponse } from '../http/response/TreeResponse'

@Component
export default struct MineTreeList {
  @Link treeList: Array<TreeModel>

  build() {
    Column() {
      List({ space: 10 }) {
        ForEach(this.treeList, (item: TreeModel) => {
          ListItem() {
            Text(item.name)
          }
        })
      }
      .divider({ strokeWidth: 2, color: 0xFFFFFF, startMargin: 16, endMargin: 16 })
      .listDirection(Axis.Horizontal) // 排列方向
      .edgeEffect(EdgeEffect.Spring) // 滑动到边缘无效果

    }.height('100%')
    .backgroundColor(0xF1F3F5)

  }
}