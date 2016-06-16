require_relative "view"
require_relative "model"

class Controller

  def initialize(argv)
    @view = View.new
    @list =  List.new
    @argv = argv
    command = @argv[0]
    arguments = arg(@argv)
    if command == "add"
      add(arguments)
    elsif command == "delete"
      delete(arguments.to_i)
    elsif command == "index"
      index
    elsif command == "complete"
      complete(arguments.to_i)
    end
  end

  def arg(array)
    array.delete_at(0)
    array.join(' ')
  end

  def index
    @view.index(@list.index) 
  end

  def add(activity)
    @view.add(@list.add(activity))
  end

  def delete(num_to_delete)
    @view.delete(@list.read_csv[num_to_delete - 1])
    @view.index(@list.delete(num_to_delete - 1))
  end

  def complete(num_to_complete)
    # @view.complete(@list.complete(num_to_complete)[num_to_complete])
    @view.complete(@list.read_csv[num_to_complete - 1])
    @view.index(@list.complete(num_to_complete - 1))
  end
end

Controller.new(ARGV)
# cont = Controller.new
# cont.index
# cont.add("Pasear a mi perro")
# cont.delete(2)
# cont.complete(1)