class UserMailer < ApplicationMailer
	
	default from: 'sanjeevsahu292@gmail.com'
	
	def welcome_email(user)
	   @user = user
	   @url  = 'http://localhost:3000/articles'
	   mail(to:[@user.email], subject: 'Welcome to Article Hub')
	end 

	def writer_email(user, article)
		@user = user
	   	@article = article
	   	@url = 'http://localhost:3000/articles'
		mail(to:[@article.user.email], subject: 'Greetings from Article Hub') do |format|
		      format.html { render 'article_writer_email' }
		      format.text { render text: 'article_writer_email' }
		end
	end

	def article_liker_email(user, article)
	   @user = user
	   @article = article
	   @url  = 'http://localhost:3000/articles'
	   mail(to:[@user.email], subject: 'Greetings from Article Hub')
	end

	def comment_writer_email(user, comment,article)
		@user = user
	   	@comment = comment
	   	@article = article
	   	@url  = 'http://localhost:3000/articles'
		mail(to:[@comment.article.user.email], subject: 'Greetings from Article Hub') do |format|
		      format.html { render 'comment_writer_email' }
		      format.text { render text: 'comment_writer_email' }
		end
	end

	def comment_liker_email(user, comment,article)
	   @user = user
	   @comment = comment
	   	@article = article
	   @url  = 'http://localhost:3000/articles'
	   mail(to:[@user.email], subject: 'Greetings from Article Hub') do |format|
		      format.html { render 'comment_liker_email' }
		      format.text { render text: 'comment_liker_email' }
	   end
	end


end
