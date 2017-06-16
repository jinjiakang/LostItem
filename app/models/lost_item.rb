class LostItem < ApplicationRecord
  belongs_to :user
  validates :title, :description, presence: true
    
  scope :available, -> { where(is_approved: true) }
    
  def self.available_for(user)
      case user.role
          when "staff"
            all
      else
            available
 
      end

  end
    
end
