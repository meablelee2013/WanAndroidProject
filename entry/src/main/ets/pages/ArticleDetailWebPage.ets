import webview from '@ohos.web.webview';
import router from '@ohos.router';
import CommonConstant from '../common/CommonConstants'
import promptAction from '@ohos.promptAction';

@Entry
@Component
struct ArticleDetailPage {
  @State message: string = 'Hello World'
  webController: webview.WebviewController = new webview.WebviewController();
  @State params: object = router.getParams();
  @State progressVal: number = 0;
  @State isLoading: boolean = true;
  @State intervalLoading: number = -1;

  aboutToAppear() {
    this.intervalLoading = setInterval(() => {
      this.progressVal = this.progressVal >= CommonConstant.WebConstant_PROGRESS_MAX ?
      CommonConstant.WebConstant_PROGRESS_MIN : (this.progressVal + CommonConstant.WebConstant_PROGRESS_STEP);
    }, CommonConstant.WebConstant_MILLI_SECONDS);
  }

  build() {
    Stack() {
      Web({ src: this.params['path'], controller: this.webController })
        .zoomAccess(false)
        // .aspectRatio(1)
        // .margin({ left: CommonConstant.WebConstant_MARGIN_LEFT, right: CommonConstant.WebConstant_MARGIN_RIGHT,
        //   top: CommonConstant.WebConstant_MARGIN_TOP })
        .javaScriptAccess(true)
        .onlineImageAccess(true)
        .onConfirm((event) => {
          AlertDialog.show({
            message: CommonConstant.WEB_ALERT_DIALOG_TEXT_VALUE + event?.message,
            confirm: {
              value: 'comfirm',
              action: () => {
                event?.result.handleConfirm();
              }
            },
            cancel: () => {
              event?.result.handleCancel();
            }
          });
          return true;
        })
        .onErrorReceive((event) => {
          if (event?.error.getErrorInfo() === 'ERR_INTERNET_DISCONNECTED') {
            promptAction.showToast({
              message: 'failed to load the network',
              duration: CommonConstant.WebConstant_DURATION
            })
          }
          if (event?.error.getErrorInfo() === 'ERR_CONNECTION_TIMED_OUT') {
            promptAction.showToast({
              message: 'failed to load the network',
              duration: CommonConstant.WebConstant_DURATION
            })
          }
        })
        .onProgressChange((event) => {
          if (event?.newProgress === CommonConstant.WebConstant_PROGRESS_MAX) {
            this.isLoading = false;
            clearInterval(this.intervalLoading);
            this.intervalLoading = -1;
          }
        }).height('100%').width('100%').border({width:1,color:Color.Red})

      if (this.isLoading) {
        Progress({
          value: CommonConstant.WebConstant_PROGRESS_MIN,
          total: CommonConstant.WebConstant_PROGRESS_MAX,
          type: ProgressType.ScaleRing
        })
          .color(Color.Grey)
          .value(this.progressVal)
          .width(CommonConstant.WebConstant_PROGRESS_WIDTH)
          .style({
            strokeWidth: CommonConstant.WebConstant_PROGRESS_STROKE_WIDTH,
            scaleCount: CommonConstant.WebConstant_PROGRESS_SCALE_COUNT,
            scaleWidth: CommonConstant.WebConstant_PROGRESS_SCALE_WIDTH
          })
          .zIndex(1)
          .position({
            x: CommonConstant.WebConstant_PROGRESS_POSITION_X,
            y: CommonConstant.WebConstant_PROGRESS_POSITION_Y
          })
      }

    }
  }
}