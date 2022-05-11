# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :omniauthable, :recoverable,
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  enum role: { role_standard: 0, role_admin: 1 }
  after_initialize :set_default_role, if: :new_record?
  def set_default_role
    self.role ||= :role_user
  end
end
