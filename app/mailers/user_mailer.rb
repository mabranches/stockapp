class UserMailer < ApplicationMailer
  def new_user_greeting(user)
    @user = user
    mail to: @user.email, subject: "Welcome to StockApp" do |format|
      format.html {render "new_greeting_user"}
      format.text {render text: "Welcome to StockApp
        Now you can manage your Stock in a simple way!
        Thank you very much!!!,
        StockApp Team"}
    end
  end
end
