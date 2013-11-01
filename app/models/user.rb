class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :rememberable, :trackable, :omniauthable, :omniauth_providers => [:google_oauth2]

  def self.find_or_create(args)
    user = User.find_by_uid(args[:uid])
    return user if user.present?
    return nil unless $emails.include?(args[:email])
    user = User.new(args)
    user.save
    user
  end

  def name
    "#{first_name} #{last_name}"
  end
end

