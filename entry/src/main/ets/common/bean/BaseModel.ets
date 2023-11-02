export default class BaseModel<T = any> {
  errorCode: Number = -1;
  errorMsg: String = '';
  // @ts-ignore
  data: T = '';
}