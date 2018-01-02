require 'pathname'

class Function
  def initialize (source)
    if source == nil
      raise ArgumentError, "Function source code not provided"
    end

    @sourcePath = Pathname.new(source)
    if @sourcePath != nil && @sourcePath.exist? && @sourcePath.extname == ".rb"
      @func = eval @sourcePath.read
    else
      raise ArgumentError, "Function file #{source} does not exist or is not a Ruby file"
    end

  end

  def invoke(arg)
    @func.call(arg)
  end

end
