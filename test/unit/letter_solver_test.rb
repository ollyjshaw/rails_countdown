require 'test/unit'
require_relative '../../lib/letters_solver'
class LettersSolverTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @solver = LettersSolver.new
  end

  #from 8 out of ten cats
  def test_can_solve_connundrum
    @solver.solve("randybush")
    assert_equal('husbandry', @solver.connundrum)
  end

  #from 8 out of ten cats
  def test_can_solve_connundrum2
    @solver.solve("neatknob")
    assert_equal('banknote', @solver.connundrum)
  end

end