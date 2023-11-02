export class ApiResponse<T> {
  code: number = 0
  message: string = ""
  result: T

  constructor(result?: T, code?: number, message?: string) {
    if (result != null) {
      this.result = result
    }
    if (code != undefined) {
      this.code = code
    }
    if (message != null) {
      this.message = message
    }
  }
}

export interface BaseResponse<T> {
  data: T
  errorMsg?: string
  errorCode: number
  ttl: number
}