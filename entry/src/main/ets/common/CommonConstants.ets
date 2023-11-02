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


  /**
   * The request content type enum.
   */
 }

export const enum ContentType {
  JSON = 'application/json'
}