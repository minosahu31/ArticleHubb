require 'spec_helper'

describe ArticlesController do
	
	describe " GET #index " do
		it "populates an array of articles" do 
			article = Factory(:article)
			get :index
			assigns(:articles).should eq([article])
		end	
		
		it "renders the :index view" do
			get :index
			response.should render_template :index
		end
	end

	describe "GET #show" do
		  it "assigns the requested article to @article" do
		    article = Factory(:article)
		    get :show, id: article
		    assigns(:article).should eq(article)
		  end
		  
		  it "renders the #show view" do
		    get :show, id: Factory(:article)
		    response.should render_template :show
		  end
		end
	# here we have to add same methods for remaining controller menthods.

	describe "POST #create" do
		
		context "with valid attributes" do
			
			it "saves the new article in a database" do
				expect{
					post :create, article:Factory.attributes_for(:article)	
				}.to change(Article,:count).by(1)
			end
			
			it "redirects to the home page"	do		
				post :create, article: Factory.attributes_for(:article)
				response.should redirect_to Article.index
			end	
				
		end	

		context "with invalid attributes"
			 it "does not save the new article" do
		      expect{
		        post :create, article: Factory.attributes_for(:invalid_article)
		      }.to_not change(Article,:count)
		    end
		    
		    it "re-renders the new method" do
		      post :create, article: Factory.attributes_for(:invalid_article)
		      response.should render_template :new
		    end
		end
	end

end