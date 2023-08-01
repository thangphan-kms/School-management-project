# == Schema Information
#
# Table name: user_jwt_denylist
#
#  id         :bigint           not null, primary key
#  exp        :datetime
#  jti        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_user_jwt_denylist_on_jti  (jti)
#
class UserJwtDenylist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Denylist

  self.table_name = 'user_jwt_denylist'
end
