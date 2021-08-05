class Role < ApplicationRecord
    has_many :users  #[Admin, Teacher]
end
