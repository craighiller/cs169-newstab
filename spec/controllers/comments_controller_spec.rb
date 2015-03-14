require 'spec_helper'

describe CommentsController do

  it 'should post the comment in the database' do
    Comments.create(:find)
    get :index
  end
  
  it "should display the name of the person who posted the comment" do
    


  # describe "GET 'create'" do
  #   it "returns http success" do
  #     get 'create'
  #     response.should be_success
  #   end
  # end

  # describe "GET 'destroy'" do
  #   it "returns http success" do
  #     get 'destroy'
  #     response.should be_success
  #   end
  # end

end
