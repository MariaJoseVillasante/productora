class Concert < ApplicationRecord
  belongs_to :group
  #kaminari:
  paginates_per 10
  # def groups
  #   Groups.where(concert_id: self.id)
  # end
end
