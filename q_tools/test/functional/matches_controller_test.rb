require 'test_helper'

class MatchesControllerTest < ActionController::TestCase
  setup do
    @match = matches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:matches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create match" do
    assert_difference('Match.count') do
      post :create, match: { match_number: @match.match_number, notes: @match.notes, player1_free_1: @match.player1_free_1, player1_free_2: @match.player1_free_2, player1_free_3: @match.player1_free_3, player1_genre: @match.player1_genre, player1_name: @match.player1_name, player1_type: @match.player1_type, player2_free_1: @match.player2_free_1, player2_free_2: @match.player2_free_2, player2_free_3: @match.player2_free_3, player2_genre: @match.player2_genre, player2_name: @match.player2_name, player2_type: @match.player2_type, player3_free_1: @match.player3_free_1, player3_free_2: @match.player3_free_2, player3_free_3: @match.player3_free_3, player3_genre: @match.player3_genre, player3_name: @match.player3_name, player3_type: @match.player3_type, player4_free_1: @match.player4_free_1, player4_free_2: @match.player4_free_2, player4_free_3: @match.player4_free_3, player4_genre: @match.player4_genre, player4_name: @match.player4_name, player4_type: @match.player4_type, round_id: @match.round_id }
    end

    assert_redirected_to match_path(assigns(:match))
  end

  test "should show match" do
    get :show, id: @match
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @match
    assert_response :success
  end

  test "should update match" do
    put :update, id: @match, match: { match_number: @match.match_number, notes: @match.notes, player1_free_1: @match.player1_free_1, player1_free_2: @match.player1_free_2, player1_free_3: @match.player1_free_3, player1_genre: @match.player1_genre, player1_name: @match.player1_name, player1_type: @match.player1_type, player2_free_1: @match.player2_free_1, player2_free_2: @match.player2_free_2, player2_free_3: @match.player2_free_3, player2_genre: @match.player2_genre, player2_name: @match.player2_name, player2_type: @match.player2_type, player3_free_1: @match.player3_free_1, player3_free_2: @match.player3_free_2, player3_free_3: @match.player3_free_3, player3_genre: @match.player3_genre, player3_name: @match.player3_name, player3_type: @match.player3_type, player4_free_1: @match.player4_free_1, player4_free_2: @match.player4_free_2, player4_free_3: @match.player4_free_3, player4_genre: @match.player4_genre, player4_name: @match.player4_name, player4_type: @match.player4_type, round_id: @match.round_id }
    assert_redirected_to match_path(assigns(:match))
  end

  test "should destroy match" do
    assert_difference('Match.count', -1) do
      delete :destroy, id: @match
    end

    assert_redirected_to matches_path
  end
end
