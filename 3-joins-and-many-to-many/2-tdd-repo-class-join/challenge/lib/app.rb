require_relative 'database_connection'
require_relative 'cohort_repository'

class App
  DatabaseConnection.connect('student_directory_2')
  repo = CohortRepository.new
  cohort = repo.find_with_students(1)
  
  puts "#{cohort.name} cohort"
  cohort.students.each do |student|
    puts "#{student.id} - #{student.name}"
  end
end
