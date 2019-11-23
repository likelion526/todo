class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  # GET /lists
  # GET /lists.json
  def index
    @lists = List.all
    @list = List.new
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to root_url, notice: '할 일이 생성됐습니다.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
    if@list.update(list_params)
          if list_params["completed"] == "1"
            format.html { redirect_to root_url, notice: '할 일을 완료됐습니다.' }
          else
            format.html { redirect_to root_url, notice: '할 일이 수정됐습니다.' }
          end
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  # def update
  #   respond_to do |format|
  #   if@list.update(list_params)
  #       list_params["completed"] == "1"
  #       format.html { redirect_to root_url, notice: '할 일을 완료됐습니다.' }
  #   elsif
  #       format.html { redirect_to root_url, notice: '할 일이 수정됐습니다.' }
  #   else
  #       format.html { render :edit }
  #       format.json { render json: @list.errors, status: :unprocessable_entity }
  #   end
  # end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: '할 일이 삭제됐습니다.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:description, :completed)
    end
    
end


# def update
#     respond_to do |format|
#     if@list.update(list_params)
#        list_params["completed"] == "1"
#        format.html { redirect_to root_url, notice: '할 일을 완료됐습니다.' }
#     elseif
#         format.html { redirect_to root_url, notice: '할 일이 수정됐습니다.' }
#     else
#         format.html { render :edit }
#         format.json { render json: @list.errors, status: :unprocessable_entity }
#     end
#   end