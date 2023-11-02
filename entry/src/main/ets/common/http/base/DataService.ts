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
  Query
} from '@ohos/retrofit';
import { HomeBannerResponse } from '../response/HomeBannerResponse';

@BasePath("/")
export default class DataService extends BaseService {
  @GET("banner/json")
  async getHomeBanner(): Promise<Response<HomeBannerResponse>> {
    return <Response<HomeBannerResponse>> {}
  }
}