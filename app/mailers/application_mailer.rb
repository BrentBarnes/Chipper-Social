class ApplicationMailer < ActionMailer::Base
  default from: "Brent@hobbyist.com",
          to: "to@example.org"
  layout "mailer"
end
