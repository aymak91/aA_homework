class Stack
    

    def initialize
        @stack = []
    end

    def inspect #overrides existing default inspect method
        "#<Stack:#{self.object_id}, #{@stack.last}>"
    end
    def push(ele)
        stack.push(ele)
    end

    def pop
        stack.pop
        self
    end

    def peek
        stack.last
    end

    def size
        stack.length
    end

    def empty?
        stack.empty?
    end
    private # makes it so that you can't mutate through the attr_reader
    attr_reader :stack #can still mutate, just cant reassign w/o writer

end