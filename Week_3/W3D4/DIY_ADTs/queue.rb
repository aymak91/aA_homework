class MyQueue
    

    def initialize
        @queue = []
    end

    def enqueue(ele)
        queue.unshift(ele)
        self
    end

    def dequeue
        queue.pop
    end

    def peek
        queue.last
    end

    def show
        queue.dup
    end

    def size
        queue.length
    end

    def empty?
        queue.empty?
    end


    private
    attr_reader :queue

end