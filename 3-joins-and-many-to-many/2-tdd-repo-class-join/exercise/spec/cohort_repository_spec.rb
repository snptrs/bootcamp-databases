require 'cohort_repository'

RSpec.describe CohortRepository do
  def reset_tables
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'student_directory_2' })
    connection.exec(seed_sql)
  end
  
  before(:each) do 
    reset_tables
  end
  
  context "finding students by cohort" do
    it "returns the cohort" do
      repo = CohortRepository.new
      cohort = repo.find_with_students(1)
      expect(cohort.name).to eq 'May 2023'
      expect(cohort.students.length).to eq 2
    end
  end
end
