class View

  def index(tasks)
    tasks.each_with_index do |task, index|
     complete = task.complete ? "X" :  " " ;
      puts "#{index + 1}.- [#{complete}] #{task.activity}"
    end
  end

  def add(task)
    puts "Agregaste la tarea \"#{task.activity}\" a tu lista" #Se escaparon las comillas con la diagonal invertida para que no las tome en cuenta en el string#
  end

  def delete(num_to_delete)
    puts "Eliminaste la tarea #{num_to_delete}"
  end

  def complete(task)
    puts "Se ha completado la tarea #{task.activity}"
  end

end