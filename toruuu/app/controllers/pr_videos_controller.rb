class PrVideosController < ApplicationController
  before_action :set_pr_video, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @pr_videos = PrVideo.all
    respond_with(@pr_videos)
  end

  def show
    respond_with(@pr_video)
  end

  def new
    @pr_video = PrVideo.new
    respond_with(@pr_video)
  end

  def edit
  end

  def create
    @pr_video = PrVideo.new(pr_video_params)
    @pr_video.save
    respond_with(@pr_video)
  end

  # def update
  #   @pr_video.update(pr_video_params)
  #   respond_with(@pr_video)
  # end
  def update
  respond_to do |format|
    if @article.update(article_params) && @article.video.recreate_versions!
      format.html { redirect_to @article, notice: 'Article was successfully updated.' }
      format.json { head :no_content }
    else
      format.html { render action: 'edit' }
      format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pr_video.destroy
    respond_with(@pr_video)
  end

  private
    def set_pr_video
      @pr_video = PrVideo.find(params[:id])
    end

    def pr_video_params
      params.require(:pr_video).permit(:title, :video, :description)
    end
end
