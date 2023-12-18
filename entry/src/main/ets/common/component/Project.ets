import curves from '@ohos.curves'

@Component
export default struct Project {
  // @State animate: boolean = false
  // @State rotateValue: number = 0
  // @State translateY: number = 0
  // @State opacityValue: number = 1
  //
  // build() {
  //   Column() {
  //     Column() {
  //       Text("ArkUI")
  //         .fontWeight(FontWeight.Bold)
  //         .fontSize(20)
  //         .fontColor(Color.White)
  //     }
  //     .justifyContent(FlexAlign.Center)
  //     .width(150)
  //     .height(150)
  //     .borderRadius(10)
  //     .rotate({ angle: this.rotateValue })
  //     .backgroundColor(0xf56c6c)
  //
  //     // 组件二
  //     Column() {
  //       Text('ArkUI')
  //         .fontWeight(FontWeight.Bold)
  //         .fontSize(20)
  //         .fontColor(Color.White)
  //     }
  //     .justifyContent(FlexAlign.Center)
  //     .width(150)
  //     .height(150)
  //     .backgroundColor(0x67C23A)
  //     .borderRadius(10)
  //     .opacity(this.opacityValue)
  //     .translate({ y: this.translateY })
  //
  //     Button('Click')
  //       .margin({ top: 120 })
  //       .onClick(() => {
  //         this.animate = !this.animate
  //         animateTo({ curve: curves.springMotion() }, () => {
  //           this.rotateValue = this.animate ? 90 : 0
  //           // this.opacityValue = this.animate ? 0.6 : 1
  //           this.translateY = this.animate ? 100 : 0
  //         })
  //       })
  //
  //   }.width('100%')
  //   .height('100%').justifyContent(FlexAlign.Center)
  // }

  @State animate: boolean = false;
  // 第一步: 声明相关状态变量
  @State rotateValue: number = 0; // 组件一旋转角度
  @State translateY: number = 0; // 组件二偏移量
  @State color: Color = Color.White; // 组件二字体颜色
  @State opacityValue: number = 1; // 父组件透明度

  // 第二步：将状态变量设置到相关可动画属性接口
  build() {
    Column() {
      Column() {
        // 组件一
        Text('ArkUI')
          .fontWeight(FontWeight.Bold)
          .fontSize(20)
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)
          .borderRadius(10)
          .backgroundColor(0xf56c6c)
          .rotate({ angle: this.rotateValue })
            // 第三步：通过属性动画接口开启属性动画，控件的函数调用顺序是从下往上的，这个animation会作用到上面的rotate属性
          .animation({ curve: curves.springMotion(0.3, 1.0) })
          .width(150)
          .height(150)

        // 组件二
        Text('ArkUI')
          .fontWeight(FontWeight.Bold)
          .fontSize(20)
          .fontColor(this.color)
            // 第三步：通过属性动画接口开启属性动画，控件的函数调用顺序是从下往上的，这个animation会作用到上面的fontColor属性
          .animation({ curve: curves.springMotion(0.6, 1.2) })
          .textAlign(TextAlign.Center)
          .borderRadius(10)
          .backgroundColor(0x67C23A)
          .width(150)
          .height(150)
          .translate({ y: this.translateY })
            // 第三步：通过属性动画接口开启属性动画，控件的函数调用顺序是从下往上的，这个animation会作用到上面的translate属性
          .animation({ curve: curves.springMotion(0.3, 0.6) })
      }
      .justifyContent(FlexAlign.Center)
      .opacity(this.opacityValue)
      // 这个animation会作用到上面的opacity属性，父组件column的透明度变化，会导致其子节点的透明度也变化，所以这里会给column和其子节点的透明度属性都加动画
      .animation({ curve: curves.springMotion() })

      // 第四步：通过状态变量改变UI界面，系统会检测改变后的UI界面与之前的UI界面的差异，对有差异的部分添加动画
      Button('Click')
        .margin({ top: 120 })
        .onClick(() => {
          this.animate = !this.animate;
          // 组件一的rotate属性有变化，所以会给组件一加rotate动画
          this.rotateValue = this.animate ? 90 : 0;
          // 组件二的translate属性有变化，所以会给组件二加translate动画
          this.translateY = this.animate ? 100 : 0;
          // 组件二的fontColor属性有变化，所以会给组件二加fontColor动画
          this.color = this.animate ? Color.Black : Color.White;
          // 父组件column的opacity属性有变化，会导致其子节点的透明度也变化，所以这里会给column和其子节点的透明度属性都加动画
          this.opacityValue = this.animate ? 0.6 : 1;
        })

    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}