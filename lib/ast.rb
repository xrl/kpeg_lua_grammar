module Lupin
  module AST
    class Node
      attr_accessor = :data
      def initialize(*args)
        raise "ASDSF"
        @data = args
      end
    end
    class Assignment < Node
    end
    class VarList < Node
    end
    class ExpList < Node
    end 
  end
end