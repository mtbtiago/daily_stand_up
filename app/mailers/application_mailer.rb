class ApplicationMailer < ActionMailer::Base
  layout 'mailer'
  default from: 'mtb.tiago@gmail.com'

  def admin_emails_plus_this_list(emails)
    admin_list = User.where(receive_admin_emails: true).pluck(:email)
    if emails
      admin_list + emails.delete_if(&:nil?)
    else
      admin_list
    end
  end

  def check_env_emails(to_list)
    if Rails.env.development?
      logger.info "<*\\/*>Original email list for #{self.class.name}: #{to_list}"
      'tiago@sistemasc.net'
    else
      to_list
    end
  end
  layout 'mailer'
end
