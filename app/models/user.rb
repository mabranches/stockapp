class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :confirmable

  has_attached_file :avatar,  styles: { medium: "300 x 300>", thumb: "100x100"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  after_create :sign_up_new_user_email

  def sign_up_new_user_email()
    UserMailer.new_user_greeting(self).deliver
  end
end
