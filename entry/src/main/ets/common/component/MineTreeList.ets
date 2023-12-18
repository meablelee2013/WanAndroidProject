import axios, { Axios, AxiosError, AxiosResponse } from '@ohos/axios'
import FaultLogger from '@ohos.faultLogger'
import { TreeModel, TreeResponse } from '../http/response/TreeResponse'
import { Logger } from '../utils/Logger'

@Preview
@Component
export default struct MineTreeList {
  @State treeList: Array<TreeModel> = new Array()
  @State treeChildList: Array<TreeModel> = new Array()
  private controller: TabsController = new TabsController()
  // @State fontColor: string = '#ff36ea14'
  // @State selectedFontColor: string = '#ff0000'
  @State currentIndex: number = 0
  @State list: string[] = ["asdf", "124214", "asfsaf", "asdfafea", "fasdfsf", "fasdfsf", "fasdfsf"]
  @State fontColor: string = '#182431'
  @State selectedFontColor: string = '#007DFF'

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
      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        ForEach(this.list, (item: string, index: number) => {
          TabContent() {
            Text("test")
          }.tabBar(this.TabBuilder(index, item)).width('100%')
        })
      }
      .vertical(false)
      .barMode(BarMode.Fixed)
      .barHeight(56)
      .animationDuration(400)
      .onChange(index => {
        this.currentIndex = index
      })
      .backgroundColor('#F1F3F5')
    }.width('100%')
  }

  @Builder TabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? 500 : 400)
        .lineHeight(22)
        .margin({ top: 17, bottom: 7 });
      Divider()
        .strokeWidth(2)
        .color('#007DFF')
        .opacity(this.currentIndex === index ? 1 : 0);
    }.width('100%');
  }

  tabOnchange(index: number) {
    this.currentIndex = index
    this.controller.changeIndex(index)
  }
}