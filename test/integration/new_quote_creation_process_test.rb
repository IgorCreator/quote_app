require 'test_helper'

class NewQuoteCreationProcessTest < ActionDispatch::IntegrationTest
  test "get new quote form and create it" do
    @content = "test_content"
    @author = Author.create(first_name: "Henry", last_name: "Ford")

    sing_in_as_user
    get "/quotes/new"
    assert_response :success
    assert_difference 'Quote.count', 1 do
      post quotes_path, params: { quote: { content: @content, author_id: @author.id } }
      assert_response :redirect
    end

    follow_redirect!
    assert_response :success
    assert_match @content, response.body
  end

  test "get empty quote form and reject invalid submission" do
    sing_in_as_user
    get "/quotes/new"
    assert_response :success
    assert_no_difference 'Quote.count' do
      post quotes_path, params: { quote: { title: " ", description: " ", category_ids: [] } }
    end
    assert_select "div.alert"
    assert_select "h4.alert-heading"
    assert_match "errors", response.body
  end
end
