class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]


  def index

    @is_admin = true
    #@is_admin = current_user.has_role? :admin

    @start_date = params[:start_date]
    @start_date = format_time(@start_date, Time.now.beginning_of_month)

    @end_date = params[:end_date]
    @end_date = format_time(@end_date, Time.now.end_of_month)

    if @is_admin == true
      @all_payments = Payment.all.order('date DESC')
    else
      @all_payments = current_user.payments.order('date DESC')
    end

    @montly_payments = @all_payments.group_by_period(
        :month, :date, range: @start_date..@end_date
      ).count

    @montly_payments_count = @montly_payments.sum{ |k, v| v }

    ### estas dos solo las usa el admin
    @weekly_payments_all = @all_payments.group_by_period(
      :week, :date, range: Time.now.beginning_of_year..Time.now
    ).count

    @payments_graph = @all_payments.group_by_period(
      :day_of_week, :date, range: @start_date..@end_date, format: "%a").count

  end

  def new
    @all_members = User.all
    @payment = Payment.new
  end

  def create
    new_params = payment_params.clone
    new_params[:date] = format_time(new_params[:date], Time.now)
    new_params[:status] = "paid";
    @payment = Payment.new(new_params)
    respond_to do |format|
      if @payment.save
        format.html {redirect_to payments_path, notice: 'Payment was successfully created.' }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

  end

  def destroy

  end

  private

    def format_time(time, default_value)
      if time.nil?
        time = default_value
      else
        time = Time.strptime(time, "%m/%d/%Y")
      end
    end

    def payment_params
      params.fetch(:payment, {}).permit(:date, :user_id, :amount)
    end

end
