ActionMailer::Base.smtp_settings = {
  address: "smtp.gmail.com",
  port: 465,
  # port: 587,
  domain: 'financermonautonomie.fr',
  user_name: ENV['GMAIL_ADDRESS'],
  password: ENV['GMAIL_APP_PASSWORD'],
  authentication: :login,
  enable_starttls_auto: true
}
