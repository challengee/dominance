module MiniTest
  raise 'Dominance for minitest/spec needs minitest/spec to be loaded' unless const_defined?(:Spec)

  # Add some functionality to minitest/spec.
  class Spec
    @@descendants = []

    # New it! method that dominates one test.
    # Could be implemented better.
    def self.it! *args, &block
      # First we need to nuke all test methods that were already defined.
      @@descendants.each(&:nuke_test_methods!)
      @@descendants = []
      # Now define the test method for the dominating test.
      self.it *args, &block
      # Now make sure that no test will be defined anymore by overwriting `it`.
      MiniTest::Spec.class_eval do
        def self.it *args, &block
          # Empty on purpose.
        end
      end
    end

    # We need to gather all descendants of Minitest::Spec in case their tests need to be nuked.
    def self.inherited test_class
      super
      @@descendants << test_class
    end
  end
end
