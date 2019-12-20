class ArticlesController < ApplicationController
    before_action :authenticate_user!

    def new
        @article = Article.new
    end

    def create
        article = Article.create(article_params)
        if article.persisted?
            redirect_to invoices_path, notice: 'Article was succesfully created.'
        else
            redirect_to request.referer, notice: 'Please fill in the form correctly.'
        end
    end

    private 
    
    def article_params
        params.require(:article).permit(:name, :unit, :unit_price, :taxrate).merge(user_id: current_user.id)
    end
end
