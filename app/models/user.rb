# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  devise :database_authenticatable,
    :registerable,
    :validatable,
    :jwt_authenticatable,
    jwt_revocation_strategy: UserJwtDenylist

  has_many :courses_users
  has_many :courses, through: :courses_users

  validates :password, format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)/, message: 'must include at least one lowercase letter, one uppercase letter, and one digit' }

  ROLES = %w(super_admin student teacher)

  ROLES.each do |role_name|
    define_method "#{role_name}?" do
      role == role_name
    end
  end
end
