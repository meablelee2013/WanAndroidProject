import { BaseResponse } from '../base/ApiResponse';

export  interface TreeResponse extends BaseResponse<Array<TreeModel>> {}

export  interface TreeModel {

  articleList: Array<string>
  author: string
  children: Array<TreeModel>
  courseId: number
  cover: string
  desc: string
  id: number
  lisense: string
  lisenseLink: string
  name: string
  order: number
  parentChapterId: number
  type: number
  userControlSetTop: Boolean
  visible: number

}

