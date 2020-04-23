module CoursesHelper
  def rec(course)
    arr = []
    students = Student.all
    students.each do |student|
      day = 0
      pts = 0
      g = false
      timecheck = false
      student.grades.each do |grade|
        if (grade.section == course.class_id) && ((grade.grade == 'A') || (grade.grade == 'A-') ||(grade.grade == 'A-'))
          g = true
          if grade.preference
            pts += 1
          end
        end
      end

      if (course.days.include? 'M') && (course.start > student.mondaystart) && (course.end < student.mondayend)
        day += 1
      end

      if (course.days.include? 'T') && (course.start > student.tuesdaystart) && (course.end < student.tuesdayend)
        day += 1
      end

      if (course.days.include? 'W') && (course.start > student.wednesdaystart) && (course.end < student.wednesdayend)
        day += 1

      end

      if (course.days.include? 'R') && (course.start > student.thursdaystart) && (course.end < student.thursdayend)
        day += 1
      end

      if (course.days.include? 'F') && (course.start > student.fridaystart) && (course.end < student.fridayend)
        day += 1
      end

      if course.days.length == day
        timecheck = true
      end

      recs = Recommendation.where(lastname: student.lastname, dotnumber: student.dotnumber, class_id: course.class_id )
      pts += recs.length

      reqs = Request.where(lastname: student.lastname, dotnumber: student.dotnumber, section: course.section )
      if(reqs.length > 0)
          pts += 10

      end

      if (g == true) && (timecheck == true)
        i = 0
        while ((i < arr.length) && (pts > arr[i][1]))
          i = i + 1
        end
        arr.insert(i, [student.email, pts])
      end

    end
    arr
  end
end
