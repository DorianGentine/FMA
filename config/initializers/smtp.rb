ActionMailer::Base.smtp_settings = {
  address: "smtp.sendgrid.net",
  # port: 465,
  port: 587,
  domain: 'financermonautonomie.herokuapp.com',
  user_name: ENV['SENDGRID_USERNAME'],
  password: ENV['SENDGRID_PASSWORD'],
  authentication: :login,
  enable_starttls_auto: true
}


