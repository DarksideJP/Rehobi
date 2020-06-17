class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :contacts
         has_many :favorites
         acts_as_paranoid
  def self.search(search)
    if search
      where(['last_name || first_name LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
