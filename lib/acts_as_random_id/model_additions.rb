module ActsAsRandomId
  module ModelAdditions
    def self.included(base)
      base.send :extend, ClassMethods

      # Handles a generate unique ID 
      # @param [Hash] options. The default format is "!{:field => :id}".
      # @return [Integer, String] the value of unique ID.
      def ensure_unique_id(options)
        begin
          self.send "#{options[:field]}=", yield
        end while self.class.exists?(options[:field] => self.send(options[:field]))
      end
    end

    module ClassMethods
      # Handles a choice of the generator
      # @scope class
      # @param [Hash] options. The default format is "!{:field => :id}".
      # @param [Proc] &block
      # @return [Integer, String] the value of unique ID.
      def acts_as_random_id(options={:field => :id}, &block)
        before_create do |record|
          if block
            record.ensure_unique_id(options, &block)
          else
            record.ensure_unique_id(options) do
              rand(2_147_483_647) + 1 # mysql and SQLite type integer
            end
          end
        end
      end
    end

  end
end