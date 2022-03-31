class MyarticlesController < ApplicationController
  before_action :set_api_v1_article, only: %i[ show update destroy ]

  def index
    @articles = Myarticle.all
    render json: @articles
  end

  def show
    render json: @article
  end

  def create
    @article = Myarticle.new(title: params[:title],body: params[:body],release_date: params[:release_date], avatar: params[:avatar])

    if @article.save
      #result = { type: 'Success', data: ActiveModelSerializers::SerializableResource.new(@article, each_serializer: ArticleSerializer), message: ["user created successfully"],status: 200}
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(title: params[:title],body: params[:body],release_date: params[:release_date])
      render json: "Successfully updated"
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    render json: "Successfully deleted"
  end

  def title_search
    @article = Myarticle.find_by(title: params[:title])
    if @article
      render json: @article
    else
      render json: "record doesn't exist."
    end
  end

  private
  
    def set_api_v1_article
      @article = Myarticle.find(params[:id])
    end
end
