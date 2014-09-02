require 'test_helper'

class WeekTest < ActiveSupport::TestCase

  setup do
    @joe = contestants(:joe)
    @bob = contestants(:bob)

    # Week 1

    @joe.votes.create(      game: games(:giants_v_falcons), team: teams(:giants))
    @joe.tiebreakers.create(game: games(:apes_v_humans),    home_score: 12, away_score: 19)
    @bob.votes.create(      game: games(:giants_v_falcons), team: teams(:falcons))
    @bob.tiebreakers.create(game: games(:apes_v_humans),    home_score: 2, away_score: 13)

    # Week 2

    @joe.votes.create(      game: games(:apes_v_giants), team: teams(:giants))
    @joe.tiebreakers.create(game: games(:falcons_v_humans),    home_score: 23, away_score: 5)
    @bob.votes.create(      game: games(:apes_v_giants), team: teams(:giants))
    @bob.tiebreakers.create(game: games(:falcons_v_humans),    home_score: 13, away_score: 4)

  end

  test "finds winner" do
    weeks(:one).solve_winner!
    assert_equal @joe, weeks(:one).winning_contestant
  end

  test "finds winner with tiebreaker" do
    weeks(:two).solve_winner!
    assert_equal @bob, weeks(:two).winning_contestant
  end
end
