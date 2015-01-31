class SoalansController < ApplicationController
  before_action :set_soalan, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, only: [:index, :new, :edit, :create, :destroy, :update]
  #before_action :authorized_user, only: [:edit, :update, :destroy]


  respond_to :html

  def index
    @soalans = Soalan.all.order(:cached_weighted_score => :desc)
    #@soalans = Soalan.all.order("created_at DESC")
    #try buat query ntok populate data untuk cari soalan berdasarkan user_id, pastu buat page baru nama my question
    # @soalans = Soalan.where(name: 'sarah') .take
    respond_with(@soalans)
  end

  def show
    authorize! :update, @soalan
    respond_with(@soalan)
  end

  def new
    @soalan = current_user.soalans.build
    respond_with(@soalan)

  end

  def edit
    authorize! :update, @soalan
  end

  def create
    @soalan = current_user.soalans.build(soalan_params)
    @soalan.save
    
    respond_to do |format|
      if @soalan.save
        format.html {redirect_to @soalan,  notice: 'Question was successfully created.'}
        format.json {render :show, status: :created, location: @soalan}
      else
        format.html {render :new}
        format.json {render json: @soalan.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    @soalan.update(soalan_params)
    respond_with(@soalan)
  end

  def destroy
    @soalan.destroy
    respond_with(@soalan)
  end

  def upvote
    @soalan.upvote_from current_user
    redirect_to soalans_path
  end
 
  def downvote
    @soalan.downvote_from current_user
    redirect_to soalans_path
  end

  private
    def set_soalan
      @soalan = Soalan.find(params[:id])
    end

    def soalan_params
      params.require(:soalan).permit(:name, :title, :description)
    end

    def authorized_user
      @soalan = current_user.soalans.find_by(id: params[:id])
      redirect_link soalans_path, notice: "Not authorized to edit this link" if @soalan.nil?
    end
end
