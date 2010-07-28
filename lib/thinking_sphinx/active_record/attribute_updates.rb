module ThinkingSphinx
  module ActiveRecord
    module AttributeUpdates
      
      private
            
      def updatable_attributes(index)
        index.attributes.select { |attrib| attrib.updatable? }
      end
      
      def attribute_values_for_index(index)
        updatable_attributes(index).inject({}) { |hash, attrib|
          hash[attrib.unique_name.to_s] = attrib.live_value self
          hash
        }
      end
    end
  end
end
