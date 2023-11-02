import { Logger } from '../utils/Logger'
import { HomeBannerResponse } from './response/HomeBannerResponse'

import { TaskManager } from './TaskManager'

export default class ApiManager {
  public static getInstance(): ApiManager {
    if (globalThis.instance == null) {
      globalThis.instance = new ApiManager()
    }
    return globalThis.instance
  }

  async requestHomeBanner(): Promise<HomeBannerResponse> {
    var response = await TaskManager.getInstance().requestHomeBanner()
    if (response.code == -1) {

    }
    if (response.result != null) {
      Logger.info("requestHomeBanner", JSON.stringify(response.result))
    }
    return response.result

  }
}