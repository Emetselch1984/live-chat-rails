class Like < ApplicationRecord
  t.references :user
  t.references :message
end
