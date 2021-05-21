class Person < ApplicationRecord
  validation :name, presence: true

end

class House < ApplicationRecord
  validation :address, presence: true

  
end