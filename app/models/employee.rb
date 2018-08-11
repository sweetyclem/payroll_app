class Employee < ApplicationRecord
  has_many :work_logs, dependent: :destroy
end
