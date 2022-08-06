
Pod::Spec.new do |spec|

  spec.name         = "LMStickerView"
  spec.version      = "0.0.1"
  spec.summary      = "贴纸、文本编辑视图"

  spec.description  = <<-DESC
  贴纸、文本编辑视图可以旋转和调整大小
  DESC

  spec.homepage     = "https://github.com/ailiuming/LMStickerView"

  spec.license      = "MIT"

  spec.author    = "luckyLM"

  spec.platform     = :ios, "10.0"
  spec.source       = { :git => "https://github.com/ailiuming/LMStickerView.git", :tag => "0.0.1" }

  spec.source_files  =  "LMStickerView/**/*.{h,m}"
  spec.public_header_files = "LMStickerView/**/*.h"

  spec.frameworks = "Foundation", "UIKit"

  spec.requires_arc = true

end
