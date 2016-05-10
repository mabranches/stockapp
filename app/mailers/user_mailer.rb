class UserMailer < ApplicationMailer

  layout 'mailer/common_layout'
  before_action :logo_customization

  def new_user_greeting(user)
    @user = user
    # attachments['attachment_logo.jpg'] = File.read("#{Rails.root}/app/assets/images/logo.jpg")
    mail to: @user.email, subject: "Welcome to StockApp" do |format|
      format.html {render "new_greeting_user"}
      format.text {render text: "Welcome to StockApp
        Now you can manage your Stock in a simple way!
        Thank you very much!!!,
        StockApp Team"}
    end
  end

  def logo_customization
    attachments.inline['logo.jpg'] = File.read("#{Rails.root}/app/assets/images/logo.jpg")
  end

end
