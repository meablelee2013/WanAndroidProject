@Entry
@Component
struct WidgetCard {
  /*
   * The title.
   */
  readonly TITLE: string = 'Hello World,this is the first card';

  /*
   * The action type.
   */
  readonly ACTION_TYPE: string = 'router';

  /*
   * The ability name.
   */
  readonly ABILITY_NAME: string = 'EntryAbility';

  /*
   * The message.
   */
  readonly MESSAGE: string = 'add detail';

  /*
   * The with percentage setting.
   */
  readonly FULL_WIDTH_PERCENT: string = '100%';

  /*
   * The height percentage setting.
   */
  readonly FULL_HEIGHT_PERCENT: string = '100%';

  build() {
    Column() {
      Row() {
        Column() {
          Text(this.TITLE)
            .fontSize($r('app.float.font_size'))
          Text("Test").width('100%').height(40)
            .border({width:2,color:Color.Red})
        }
        .width(this.FULL_WIDTH_PERCENT)
      }
      .height('100%')
      .onClick(() => {
        postCardAction(this, {
          "action": this.ACTION_TYPE,
          "abilityName": this.ABILITY_NAME,
          "params": {
            "message": this.MESSAGE
          }
        });
      })


    }
  }
}