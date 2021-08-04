class Role < ApplicationRecord
    has_many :users  #[admin, teacher]
end
