require_relative '../../lib/letters_solver'
class ConundrumController < ApplicationController
  def index
  end
  def solve
    to_solve = params[:input]
    solver = LettersSolver.new
    solver.solve to_solve
    @result = solver.connundrum
  end
end
