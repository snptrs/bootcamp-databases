require_relative 'cohort'
require_relative 'student'

class CohortRepository
  def find_with_students(cohort)
    @students = []
    
    sql = 'SELECT cohorts.id,
         cohorts.name,
         cohorts.start_date,
         students.id AS student_id,
         students.name AS student_name
    FROM cohorts
    JOIN students ON students.cohort_id = cohorts.id
    WHERE cohorts.id = $1;'
    params = [cohort]
    result = DatabaseConnection.exec_params(sql, params)
    
    cohort = Cohort.new
    
    cohort.id = result.first['id']
    cohort.name = result.first['name']
    
    result.each do |record|
      student = Student.new
      student.id = record['student_id']
      student.name = record['student_name']
      
      cohort.students << student
    end
    return cohort
  end
end
