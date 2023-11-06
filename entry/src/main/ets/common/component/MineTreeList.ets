import axios, { Axios, AxiosError, AxiosResponse } from '@ohos/axios'
import { TreeModel, TreeResponse } from '../http/response/TreeResponse'
import { Logger } from '../utils/Logger'

@Component
export default struct MineTreeList {
  @State treeList: Array<TreeModel> = new Array()
  @State treeChildList: Array<TreeModel> = new Array()

  aboutToAppear() {
    let axios = globalThis.axios as Axios

    axios.get<TreeResponse, AxiosResponse<TreeResponse>, null>('tree/json').then((response: AxiosResponse<TreeResponse>) => {
      this.treeList = response.data.data
      Logger.info("alex", JSON.stringify(response.data.data))
    }).catch((error: AxiosError) => {

    })
  }

  build() {
    Column() {

      List({ space: 10 }) {
        ForEach(this.treeList, (item: TreeModel) => {
          ListItem() {
            Column() {
              Text(item.name)
                .fontSize(18)
                .fontWeight(FontWeight.Medium)
                .textAlign(TextAlign.Start)
                .width('100%')
                .padding({ left: 16, top: 16 })
              Row() {
                ForEach(item.children, (item: TreeModel) => {
                  Text(item.name).margin({ left: 16 })
                })
              }.margin({ top: 16, bottom: 16 }).flexShrink(10).width('100%').justifyContent(FlexAlign.Start)
            }
          }
        })
      }.divider({ strokeWidth: 2, color: 0xFFFFFF, startMargin: 16, endMargin: 16 })
      .listDirection(Axis.Vertical) // 排列方向
      .edgeEffect(EdgeEffect.Spring) // 滑动到边缘无效果

    }.height('100%')
    .backgroundColor(0xF1F3F5)

  }
}