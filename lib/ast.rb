module Lupin
  module AST
    class Node
      attr_accessor = :data
      def initialize(*args)
        @data = args
      end
    end
    class VarList < Node
    end
    class ExpList < Node
    end 
  end
end