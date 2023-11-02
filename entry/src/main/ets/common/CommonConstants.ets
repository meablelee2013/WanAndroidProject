export default class CommonConstants {
  /**
   * Title text of the home page
   */
  static readonly HOME_TITLE = '首页';

  /**
   * Title text of the setting page
   */
  static readonly MINE_TITLE = '我的';

  /**
   * Home tab index
   */
  static readonly HOME_TAB_INDEX = 0;

  /**
   * Mine tab index
   */
  static readonly MINE_TAB_INDEX = 1;

  /**
   * baseUrl
   */
  static readonly BASE_URL="https://www.wanandroid.com"

  /**
   * The http timeout duration.
   */
  static readonly HTTP_READ_TIMEOUT: number = 10000;
  /**
   * Http request success status code.
   */
  static readonly HTTP_CODE_200: number = 200;
  /**
   * The request success status code.
   */
  static readonly SERVER_CODE_SUCCESS: string = 'success';
  static readonly SERVER_CODE: Number =0;
  /**
   * Break point sm of the tag.
   */
  static readonly SM: string = 'sm';

  /**
   * Break point md of the tag.
   */
  static readonly MD: string = 'md';

  /**
   * Break point lg of the tag.
   */
  static readonly LG: string = 'lg';

  /**
   * Swiper cache count of the number 3.
   */
  static readonly SWIPER_CACHE_COUNT: number = 3;

  static readonly WEB_ALERT_DIALOG_TEXT_VALUE: string = '恭喜您抽中:';

  static readonly WebConstant_FULL_WIDTH: string = '100%';
  static readonly WebConstant_FULL_HEIGHT: string = '100%';
  static readonly WebConstant_WIDTH: string = '93.3%';
  static readonly WebConstant_HEIGHT: string = '55.9%';
  static readonly WebConstant_MARGIN_TOP: string = '7.1%';
  static readonly WebConstant_MARGIN_LEFT: string = '3.3%';
  static readonly WebConstant_MARGIN_RIGHT: string = '3.3%';
  static readonly WebConstant_TOP_ROW_HEIGHT: string = '7.2%';
  static readonly WebConstant_IMAGE_WIDTH: string = '5.6%';
  static readonly WebConstant_IMAGE_HEIGHT: string = '32%';
  static readonly WebConstant_IMAGE_MARGIN_LEFT: string = '7.2%';
  static readonly WebConstant_TEXT_VALUE_WIDTH: string = '35.6%';
  static readonly WebConstant_TEXT_VALUE_HEIGHT: string = '3.1%';
  static readonly WebConstant_TEXT_VALUE_MARGIN_TOP: string = '3.1%';
  static readonly WebConstant_TEXT_VALUE_FONT_SIZE: number = 18;
  static readonly WebConstant_TEXT_VALUE_FONT_WEIGHT: number = 500;
  static readonly WebConstant_TIP_TEXT_VALUE_WIDTH: string = '15.6%';
  static readonly WebConstant_TIP_TEXT_VALUE_HEIGHT: string = '2.4%';
  static readonly WebConstant_TIP_TEXT_VALUE_FONT_SIZE: number = 14;
  static readonly WebConstant_TIP_TEXT_VALUE_MARGIN_TOP: string = '0.9%';
  static readonly WebConstant_TIP_TEXT_VALUE_OPACITY: number = 0.6;
  static readonly WebConstant_TOP_TEXT_WIDTH: string = '82.2%';
  static readonly WebConstant_TOP_TEXT_HEIGHT: string = '50%';
  static readonly WebConstant_TOP_TEXT_MARGIN_LEFT: string = '5%';
  static readonly WebConstant_TOP_TEXT_FONT_SIZE: number = 20;
  static readonly WebConstant_BUTTON_WIDTH: string = '86.7%';
  static readonly WebConstant_BUTTON_HEIGHT: string = '5.1%';
  static readonly WebConstant_BUTTON_MARGIN_TOP: string = '10%';
  static readonly WebConstant_BUTTON_BORDER_RADIUS: string = '20';
  static readonly WebConstant_BUTTON_FONT_SIZE: number = 16;
  static readonly WebConstant_DURATION: number = 3000;
  static readonly WebConstant_PROGRESS_MIN: number = 0;
  static readonly WebConstant_PROGRESS_MAX: number = 100;
  static readonly WebConstant_PROGRESS_STEP: number = 10;
  static readonly WebConstant_MILLI_SECONDS: number = 100;
  static readonly WebConstant_PROGRESS_STROKE_WIDTH: number = 15;
  static readonly WebConstant_PROGRESS_SCALE_COUNT: number = 15;
  static readonly WebConstant_PROGRESS_SCALE_WIDTH: number = 5;
  static readonly WebConstant_PROGRESS_WIDTH: number = 80;
  static readonly WebConstant_PROGRESS_POSITION_X: string = '40%';
  static readonly WebConstant_PROGRESS_POSITION_Y: string = '30%';

  static readonly MainConstant_FULL_HEIGHT: string = '100%';
  static readonly MainConstant_IMAGE_HEIGHT: string = '38.7%';
  static readonly MainConstant_BUTTON_MARGIN_TOP_BUTTON: string = '3.1%';
  static readonly MainConstant_BUTTON_HEIGHT: string = '5.1%';
  static readonly MainConstant_BUTTON_MARGIN_TOP: string = '4.6%';
  static readonly MainConstant_BUTTON_WIDTH: string = '86.7%';
  static readonly MainConstant_BUTTON_BORDER_RADIUS: number = 20;
  static readonly MainConstant_BUTTON_FONT_SIZE: number = 16;
  /**
   * The request content type enum.
   */
 }

export const enum ContentType {
  JSON = 'application/json'
}