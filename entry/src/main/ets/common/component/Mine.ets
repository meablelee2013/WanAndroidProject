@Preview
@Component
export default struct Mine {
  build() {
    Text('mine')
      .width('100%')
      .alignSelf(ItemAlign.Center)
      .border({ width: 1, color: Color.Red })
      .height('100%')
      .backgroundColor(Color.Gray)
  }
}