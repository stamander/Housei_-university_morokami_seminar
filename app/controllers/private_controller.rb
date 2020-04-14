class PrivateController < ApplicationController

  before_action :basic_auth,only: [:new,:destroy]

  def index

    t = Time.new
    plan = Plan.find(params[:plan_id].to_i)
    room = Room.find(params[:room_id].to_i)

    case room.basic_info.reserve_period
    when "三ヶ月先" then
      set_sime = 3
    when "六ヶ月先" then
      set_sime = 6
    when "九ヶ月先" then
      set_sime = 9
    when "十二ヶ月先" then
      set_sime = 12
    else
      set_sime = 0
    end

    year = t.year
    sime = t.since(set_sime.month).strftime("20%y-%m-%d")
    today = t.strftime("20%y-%m-%d")

    @dates = (Date.parse(today)..Date.parse(sime)) ###当日から予約締め切り日までの日付を全取得

    @reserves = Reserve.where(room_id: params[:room_id].to_i) #対象施設の予約情報を取得
    reserve_days = []
    @reserves.each do |re|
      re.reserve_dates.each do |day|
        reserve_days << day.start_date    
      end
    end

    cant_weeks = plan.weeks.map{|w|w.name if w.can == false }.compact  #対象施設の貸出不可曜日の取得
    wd = ["祝日", "日曜日", "月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日"]

    if params[:day].to_i == 0 ##時間貸しは未実装
      @can_re = []
      @can_re << {start: t, title: "時間貸し", class_name: "can_reserve"}
    else ##日がしの場合
      @can_re =[] #成形後の日付をここに入れる
      @dates.each do |day|
        title = "¥#{plan.day_price}~"
        class_name = "can_reserve"
        if reserve_days.include?(day.strftime("20%y-%m-%d")) ##予約被り
          class_name = "cant_reserve"
          title = "予約あり"
        end

        if cant_weeks.include?(wd[day.strftime("%u").to_i]) ##予約不可日
          class_name = "cant_reserve"
          title = "不可"
        end
        @can_re << {start: day, class_name: class_name ,title: title  }
      end
    end

    respond_to do |format|
      format.json
    end
end

  def create
    @private= Private.new(private_params)
    if @private.save
      redirect_to root_path
    else
      redirect_to new_private_path
      flash[:private] = "まだ未入力の項目があります"
      
      
    end
  end




  def new
    @private = Private.new
  end

  def show
    @privates = Private.find_by(id:params[:id])
  end

  def destroy
  
    @private = Private.find_by(id:params[:id])
    if @private.destroy
      redirect_to root_path
    else
      redirect_to private_path
    end
  end



  private
  def private_params
    params.require(:private).permit(:title,:content)
  end
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end
end
