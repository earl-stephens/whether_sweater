# frozen_string_literal: true

# class AppicationMailer
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
