module Concerns
    # Module code here

    module Findable

        def find_by_name(name)
        self.all.find {|x| x.name == name}
    
      end
    
      def find_or_create_by_name(name)
        
        self.find_by_name(name) || self.create(name) # If self.find_by_name(name) is value than do the other thing
      end
    end
end