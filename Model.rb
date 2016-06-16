require 'csv'

class List
attr_accessor :tarea, :to_do_list
  def initialize
    @to_do_list = []
   
  end

  def index
    CSV.foreach("file.csv") do |row| #CSV regresa arreglos, por eso utilizamos [0]
    @to_do_list << Task.new(row[0], to_boolean(row[1]))
    end
    @to_do_list
  end

  def to_boolean(string)
    if string == "true"
      true
    else
      false
    end
  end

  def add(activity)
    new_task = Task.new(activity)
    @to_do_list << new_task
     CSV.open("file.csv", "a+") do |csv| # "a+" to append data to a CSV
       csv << [activity] # Al CSV sólo se le agrega texto
     end
     new_task
  end

  def delete(num_to_delete)
    p task_deleted = @to_do_list.delete_at(num_to_delete)
    CSV.open("file.csv", "wb") do |csv| # "a+" to append data to a CSV
       @to_do_list.each do |task| # Al CSV sólo se le agrega texto
         csv << [task.activity]
       end
     end
     task_deleted.activity
  end

  def complete(num_to_complete)
    @to_do_list[num_to_complete].complete = true
    @to_do_list[num_to_complete]
  end

end

class Task
attr_accessor :activity, :complete
  def initialize(activity, complete = false)
    @activity = activity
    @complete = complete
  end

end
