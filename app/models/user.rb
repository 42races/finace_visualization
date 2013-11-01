class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :rememberable, :trackable, :omniauthable, :omniauth_providers => [:google_oauth2]

  def self.find_or_create(args)
    return nil unless $emails.include?(args[:email])
    user = User.find_by_uid(args[:uid]) || User.new(args)
    user.update_info(args) unless user.new_record?
    user.save
    user
  end

  def name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def update_info(args = {})
    [:email, :uid, :provider].each { |key| args.delete(key) }
    update_attributes(args)
  end
end

