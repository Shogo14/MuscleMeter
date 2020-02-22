class BodyPartsController < ApplicationController
    helper SessionsHelper
    before_action :new_body_part, only: [:index]
    def index
        @body_parts = BodyPart.all
    end

    def create
      @body_part = BodyPart.new(body_part_params)
      if @body_part.save
        flash[:success] = "新しい筋肉部位の登録が完了しました。"
        redirect_to body_parts_url
      else
        flash[:info] = "失敗。"
        redirect_to body_parts_url
      end
    end
  
    def destroy
      BodyPart.find(params[:id]).destroy
      flash[:success] = "トレーニング種類を削除しました。"
      redirect_to body_parts_url
    end

    private
        def body_part_params
            params.require(:body_part).permit(:name)
        end
  
        def new_body_part
          @body_part = BodyPart.new
        end
end
