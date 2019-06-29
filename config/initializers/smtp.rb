ActionMailer::Base.smtp_settings = {
  address: "smtp.sendgrid.net",
  # port: 465,
  port: 587,
  domain: 'financermonautonomie.herokuapp.com',
  user_name: ENV['USERNAME_KEY'],
  password: ENV['SENDGRID_API_KEY'],
  authentication: :login,
  enable_starttls_auto: true
}


