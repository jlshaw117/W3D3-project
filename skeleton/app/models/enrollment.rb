# == Schema Information
#
# Table name: enrollments
#
#  id         :bigint(8)        not null, primary key
#  course_id  :integer
#  student_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Enrollment < ApplicationRecord
# define association with other tables (courses & users)
# enrollment is a joins-table between courses & users

belongs_to :user,
  primary_key: :id,
  foreign_key: :student_id,
  class_name: 'User'

# 'belongs_to' maintain primary-foreign key information between instances of two models
# for all associations -- primary_key is always the 'id' of that class
# 'belongs_to' -- foreign_key is also in the same class
# when foreign_key is present in the coloumn, association is 'belongs_to'


belongs_to :course,
  primary_key: :id,
  foreign_key: :course_id,
  class_name: 'Course'

end
