# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord

has_many :enrollments,
  primary_key: :id,
  foreign_key: :student_id,
  class_name: 'Enrollment'

# Question: why are the primary/foreign keys in a symbol? is :symbol the default data type that RoR stores column info?

has_many :enrolled_courses, 
  through: :enrollments, 
  source: :course
  # source: calls the .course method in 'Enrollment' class

end
