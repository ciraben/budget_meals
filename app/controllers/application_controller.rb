class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.

  # slackened the safari constraint so my old phone can view things!
  versions = ActionController::AllowBrowser::BrowserBlocker::SETS[:modern]
    .tap { |v| v[:safari] = 15.6 }
  allow_browser versions:
end
