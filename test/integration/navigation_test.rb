require 'test_helper'

class EditableBigPigTest < ActionDispatch::IntegrationTest
  test "creating a new processed model" do
    get '/big_pigs/new'
    assert_response :success
    assert assigns(:bigpig)
    assert_select('form#new_big_pig')
  end
end
