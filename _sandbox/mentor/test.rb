namespace :sample_data do

  desc 'Load all sample data'
  task load: :environment do
    Rake::Task["sample_data:admin"].invoke
    Rake::Task["sample_data:other"].invoke
  end

  desc "Add admin user"
  task admin: :environment do
    AdminUser.where(
      first_name: "Thomas",
      surname: "Anderson",
      email: "admin@gmail.com",
    ).first_or_create!(password: "123456", password_confirmation: "123456")
  end

  desc "Add custom admin user"
  task :cadmin, [:first_name, :surname, :email, :password ] => :environment do |task, args|
    AdminUser.where(
        first_name: args.first_name,
        surname: args.surname,
        email: args.email,
    ).first_or_create!(password: args.password, password_confirmation: args.password)
  end

  desc "Seed database with example data"
  task other: :environment do

    teacher_1 = Teacher.where(
      first_name: "Peter",
      surname: "Šťastný",
      email: "teacher1@gmail.com",
    ).first_or_create!(password: "123456", password_confirmation: "123456")

    # TODO: simplify this creation process with array
    student_1 = Student.where(
      first_name: "Marián",
      surname: "Vermunt",
      email: "student1@gmail.com"
    ).first_or_create!(password: "123456", password_confirmation: "123456")

    student_2 = Student.where(
      first_name: "Janka",
      surname: "Sabová",
      email: "student2@gmail.com"
    ).first_or_create!(password: "123456", password_confirmation: "123456")

    student_3 = Student.where(
      first_name: "Peter",
      surname: "Koloman",
      email: "student3@gmail.com"
    ).first_or_create!(password: "123456", password_confirmation: "123456")

    student_4 = Student.where(
      first_name: "Lubos",
      surname: "Štastný",
      email: "student4@gmail.com"
    ).first_or_create!(password: "123456", password_confirmation: "123456")



    course_1 = Course.where(
      name: "Webdesigner",
      description: "Pre úplných začiatočníkov, html, css a javascript",
      published: true
    ).first_or_create!

    course_2 = Course.where(
      name: "Webdeveloper",
      description: "Základy budovania webových aplikácií v Ruby on Rails. Nadväzuje na kurz Webdesigner",
      published: true
    ).first_or_create!




    chapter_1 = course_1.chapters.where(
      name: "Úvod do HTML"
    ).first_or_create!

    chapter_2 = course_1.chapters.where(
      name: "Úvod do CSS"
    ).first_or_create!

    chapter_3 = course_1.chapters.where(
      name: "Javascript",
      course_id: course_1
    ).first_or_create!

    group_1 = Group.where(
      name: "Mladý webdizajnér",
      description: "Po kurze ti nebude robiť problém dať dokopy vlastnú webstránku",
      teacher_id: teacher_1,
      course_id: course_1,
    ).first_or_create!(
      city: "Bratislava",
      venue: "Narnia",
      min_limit: 5,
      max_limit: 15,
      price: 39,
      duration: "3 mesiace",
      start_date: DateTime.now,
      end_date: DateTime.now + 3.months
    )

    # assign student into group
    [student_1, student_2, student_3, student_4].each do |student|
      group_1.students << student unless group_1.students.include?(student)
    end
  end
end
