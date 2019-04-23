class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  def index

    @start_date = params[:start_date]
    @start_date = format_time(@start_date, Time.now.beginning_of_month)

    @end_date = params[:end_date]
    @end_date = format_time(@end_date, Time.now.end_of_month)

    #current_user.has_role? :admin
      @all_payments = Payment.all.order('date DESC')
    #else
      @all_payments = current_user.payments.order('date DESC')
    #end

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
    @payment = Payment.new
  end

  def create
    new_params = payment_params.clone
    @payment = Payment.new(build_params)
    respond_to do |format|
      if @payment.save
        flash[:success] = 'El pago fue registrado exitosamente.'
        format.html {redirect_to request.referrer }
        format.json { render :show, status: :created, location: @payment }
      else
        flash[:error] = 'El pago no pudo ser registrado, favor de verificar todos los datos'
        format.html { redirect_to request.referrer }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

  end

  def destroy

  end

  private

  def build_params
    new_params = payment_params.clone
    new_params[:date] = format_time(new_params[:date], Time.now)
    new_params[:user_id] = user_id_from_username(new_params[:username])
    new_params[:status] = "paid";
    return new_params
  end

  def user_id_from_username(username)
    attendance_user = User.find_by(username: username)
    return (!attendance_user.nil?) ? attendance_user.id : nil
  end

    def format_time(time, default_value)
      if time.nil?
        time = default_value
      else
        time = Time.strptime(time, "%m/%d/%Y")
      end
    end

    def payment_params
      params.require(:payment).permit(:date, :username, :amount)
    end

end
