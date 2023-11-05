import {
  BaseService,
  ServiceBuilder,
  GET,
  POST,
  DELETE,
  PUT,
  UrlPath,
  Body,
  BasePath,
  Response,
  Header,
  Headers,
  Query,
} from '@ohos/retrofit';
import { HomeArticleResponse } from '../response/HomeArticleResponse';
import { HomeBannerResponse } from '../response/HomeBannerResponse';

@BasePath("/")
export default class DataService extends BaseService {
  @GET("banner/json")
  async getHomeBanner(): Promise<Response<HomeBannerResponse>> {
    return <Response<HomeBannerResponse>> {}
  }

  @GET("article/list/{page}/json")
  async getHomeArticle(@UrlPath("page")  page: number): Promise<Response<HomeArticleResponse>> {
    return <Response<HomeArticleResponse>> {}
  }
}