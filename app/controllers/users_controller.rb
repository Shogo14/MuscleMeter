class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update,]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.where(activated: true).paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    # training_dates = @user.work_outs.group(:training_date).select(:training_date).limit(2).pluck(:training_date)
    @latest_work_outs = @user.work_outs.group(:training_menu_id).maximum(:training_date)

    # user_training_menus = TrainingMenu.where(id: @user.work_outs.group(:training_menu_id).pluck(:training_menu_id))


    # @graph_datas = [{:name=>"スクワッド", :data=>{'2020-02-20'=>85.0, '2020-03-03'=>82.5, '2020-03-06'=>80.0},:descreate=> true},
    #   {:name=>"デッドリフト", :data=>{'2020-02-20'=>97.5, '2020-03-05'=>95.0, '2020-03-06'=>92.5, '2020-03-08'=>90.0},:descreate=> true},
    #   {:name=>"ベンチプレス", :data=>{'2020-02-20'=>62.5, '2020-02-26'=>65.0, '2020-02-23'=>65.0},:descreate=> true}, 
    #   {:name=>"オーバーヘッドプレス", :data=>{'2020-02-20'=>35.0, '2020-02-29'=>42.5, '2020-02-24'=>40.0, '2020-02-22'=>40.0},:descreate=> true},
    #   {:name=>"ベントオーバーロウ", :data=>{'2020-02-20'=>55.0, '2020-02-26'=>52.5, '2020-02-23'=>50.0},:descreate=> true}, 
    #   {:name=>"ダンベルハンマーカール", :data=>{'2020-02-20'=>9.0, '2020-02-24'=>9.0, '2020-02-22'=>9.0},:descreate=> true}, 
    #   {:name=>"ダンベルショルダープレス", :data=>{'2020-02-20'=>14.0},:descreate=> true},
    #   {:name=>"ダンベルサイドレイズ", :data=>{'2020-02-20'=>5.0, '2020-02-24'=>5.0, '2020-02-22'=>5.0},:descreate=> true}, 
    #   {:name=>"アブドミナルクランチ", :data=>{'2020-02-20'=>27.0},:descreate=> true}]
    # @graph_datas = user_training_menus.map do |user_training_menu|
    #   trainings = @user.work_outs.where(training_menu_id: user_training_menu.id).order(:training_date)
    #   {
    #     name: user_training_menu.name , 
    #     data: trainings.map {|training|
    #       {training.training_date.strftime('%Y-%m-%d') => training.weight}
    #     }.reduce(&:merge),
    #     :discrete => true
    #   }
    # end
    redirect_to root_url and return unless @user.activated?
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def current_user_home
    redirect_to current_user
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation)
    end

        # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # 管理者かどうか確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    
end
