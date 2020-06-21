require 'set'

class GraphNode
    attr_accessor :val, :neighbors

    def initialize(val)
        self.val = val
        self.neighbors = []

        def add_neighbor(node)
            self.neighbors << node
        end
    end

end

def bfs(starting_node, target_value)
    queue = [starting_node] #start queue with starting node
    visited = [] #keep  track of visited with array
  
    until queue.empty? #keep running until nothing left in queue
      node = queue.shift # node is the first ele. shift out the ele
      unless visited.include?(node) #dont run if visited already
        return node.val if node.val == target_value #return the node value if we found it
        visited << node # otherwise add it to list of visited nodes
        queue += node.neighbors #add all neighbors into the queue
      end
    end
    
    return nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(a, "b")
p bfs(a, "f")
p bfs(a, "e")