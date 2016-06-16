require_relative "view"
require_relative "model"

class Controller

  def initialize#(argv)
    # p @argv = argv
    @view = View.new
    @list =  List.new
  end

  def index
    @view.index(@list.index) 
  end

  def add(activity)
    @view.add(@list.add(activity))

  end

  def delete(num_to_delete)
    @view.delete(@list.delete(num_to_delete))
    index
  end

  def complete(num_to_complete)
    @view.complete(@list.complete(num_to_complete))
    index
  end
end

# Controller.new.ARGV[0](ARGV[1])
cont = Controller.new
cont.index
# cont.add("Pasear a mi perro")
# cont.delete(2)
cont.complete(1)