class AddCourseImgToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :course_img, :string
  end
end
