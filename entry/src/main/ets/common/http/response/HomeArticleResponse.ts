import { BaseResponse } from '../base/ApiResponse';

export interface HomeArticleResponse extends BaseResponse<HomeArticleModel> {}

export interface HomeArticleModel {
  curPage: number
  datas: Array<HomeArticle>
  offset: number
  over: boolean
  pageCount: number
  size: number
  total: number
}

export interface HomeArticle {
  adminAdd: Boolean
  apkLink: string
  audit: number
  author: string
  canEdit: Boolean
  chapterId: number
  chapterName:string
  collect: Boolean
  courseId: number
  desc: string
  descMd: string
  envelopPic: string
  fresh: Boolean
  host: string
  id: number
  isAdminAdd: Boolean
  link: string
  niceDate: string
  niceShareDate: string
  origin: string
  prefix: string
  projectLink: string
  publishTime: number
  realSuperChapterId: number
  selfVisible: number
  shareDate: number
  shareUser: string
  superChapterId: number
  superChapterName: string
  tags: string[]
  title: string
  type: number
  userId: number
  visible: number
  zan: number
}