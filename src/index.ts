import path from 'path'
import shell from 'shelljs'
export default class XCFrameworkTransformer {
  /**
   * Name of this transformer
   */
  get name(): string {
    return 'xcframework'
  }

  /**
   * Supported platforms
   */
  get platforms(): string[] {
    return ['ios']
  }

  /**
   * Transform the container
   */
  public async transform({
    containerPath
  }: {
    containerPath: string
  }) {
    const scriptPath = path.join(__dirname, "generate-xcframework.sh");
    const scriptResult = shell.exec(scriptPath, {cwd:containerPath})
    if (scriptResult.code !== 0) {
      this.throwError(`script execution failed with code ${scriptResult.code}`)
    }
  }

  public throwError(msg: string) {
    throw new Error(`[XCFrameworkTransformer] ${msg}`)
  }
}
