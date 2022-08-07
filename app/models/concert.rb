class Concert < ApplicationRecord
  belongs_to :group
  #kaminari:
  paginates_per 10
end
