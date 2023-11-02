import { BaseResponse } from '../base/ApiResponse';

export interface HomeBannerResponse extends BaseResponse<HomeBanner[]> {}

export interface HomeBanner {
  desc: string
  id: number
  imagePath?: string
  isVisible: number
  order: number
  title: string
  type: number
  url: string
}

