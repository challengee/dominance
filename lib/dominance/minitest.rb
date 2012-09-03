module Minitest
  raise 'Dominance for minitest/spec needs minitest/spec to be loaded' unless const_defined?(:Spec)

  # Add some functionality to minitest/spec.
  class Spec

    # New it! method that dominates one test.
    # Could be implemented better.
    def self.it! *args, &block
      # First we need to nuke all test methods that were already defined.
      # Herefor we find all decendants of Minitest::Spec.
      test_classes = ObjectSpace.each_object(Class).select do |klass|
        klass < MiniTest::Spec
      end
      # For eahc of this descendants, nuke the test methods.
      test_classes.each(&:nuke_test_methods!)
      # Now define the test method for the dominating test.
      self.it *args, &block
      # Now make sure that no test will be defined anymore by overwriting `it`.
      MiniTest::Spec.class_eval do
        def self.it *args, &block
          # Empty on purpose.
        end
      end
    end
  end
end
