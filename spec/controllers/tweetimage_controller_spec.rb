require 'spec_helper'

describe TweetimageController do
  describe "GET index" do
    context "given a twitter handle" do
      before do
        get :index, :twitter_handle => 'bob'
      end

      it "redirects to show action" do
        response.should redirect_to(:action => :show, :twitter_handle => 'bob')
      end
    end
  end
end
