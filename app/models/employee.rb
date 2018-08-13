class Employee < ApplicationRecord
  has_many :work_logs, dependent: :destroy
  validates_presence_of :job_group
end
