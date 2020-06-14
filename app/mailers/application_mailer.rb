class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <makorsakova@gmail.com>}
  layout 'mailer'
end
