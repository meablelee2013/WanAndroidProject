import { ApiResponse } from './base/ApiResponse'
import { HomeBannerResponse } from './response/HomeBannerResponse'
import taskPool from '@ohos.taskpool';
import { Response, ServiceBuilder } from '@ohos/retrofit'
import CommonConstants from '../CommonConstants';
import DataService from './base/DataService'

export class TaskManager {
  public static getInstance(): TaskManager {
    if (globalThis.taskManager == null) {
      globalThis.taskManager = new TaskManager()
    }
    return globalThis.taskManager
  }

  async requestHomeBanner(): Promise<ApiResponse<HomeBannerResponse>> {
    var task = new taskPool.Task(requestHomeBannerFuc);
    var response = await taskPool.execute(task) as ApiResponse<HomeBannerResponse>
    return response
  }
}

async function requestHomeBannerFuc(): Promise<ApiResponse<HomeBannerResponse>> {
  "use concurrent"
  let code: number = 0
  let message: string = ""
  let result: HomeBannerResponse
  try {
    let dataService = new ServiceBuilder().setEndpoint(CommonConstants.BASE_URL).build(DataService)
    let resp: Response<HomeBannerResponse> = await dataService.getHomeBanner()
    code = resp.code();
    message = resp.message()
    result = resp.result
  } catch (e) {
    code = -1
    message = e + "";
  }
  return new ApiResponse(result, code, message)

}