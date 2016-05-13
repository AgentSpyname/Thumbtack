require 'spec_helper'
require 'support/factory_girl'

describe PagesController do

  
  describe "GET Index" do
    it "gets the index view" do
      get "index"
      response.status.should be 200
    end
 
    it "gets the correct index view template" do
      get "index"
      response.should render_template("pages/index")
    end
    
  
  end
end