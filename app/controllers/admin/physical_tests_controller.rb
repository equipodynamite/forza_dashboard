class Admin::PhysicalTestsController < ApplicationController
  layout 'user_dashboard'
  before_action :authenticate_user!
  before_action :verify_admin_role

  def new
    @physical_test = PhysicalTest.new
  end

  def create
    @physical_test = PhysicalTest.new(build_params)
    respond_to do |format|
      if @physical_test.save
        flash[:success] = 'La prueba física fue registrada exitosamente.'
        format.html { redirect_to request.referrer }
      else
        flash[:error] = 'La prueba física no pudo ser registrada, favor de verificar todos los datos.'
        format.html { redirect_to request.referrer }
      end
    end
  end

  private

  def build_params
    new_params = physical_test_params.clone
    new_params[:user_id] = user_id_from_username(new_params[:username])
    return new_params
  end

  def user_id_from_username(username)
    physical_test_user = User.find_by(username: username)
    return (!physical_test_user.nil?) ? physical_test_user.id : nil
  end

  def physical_test_params
    params.require(:physical_test).permit(
      :date,
      :username,
      :pull_ups,
      :pull_ups_form,
      :pull_ups_rom,
      :pull_ups_core,
      :pull_ups_rhythm,
      :pull_ups_notes,
      :push_ups,
      :push_ups_form,
      :push_ups_rom,
      :push_ups_core,
      :push_ups_rhythm,
      :push_ups_notes,
      :squats,
      :squats_form,
      :squats_rom,
      :squats_core,
      :squats_rhythm,
      :squats_notes,
      :crunches,
      :crunches_form,
      :crunches_rom,
      :crunches_core,
      :crunches_rhythm,
      :crunches_notes,
      :suggested_program,
      :general_notes
    )
  end

  def verify_admin_role
    redirect_to authenticated_root_path if not current_user.has_role? :admin
  end
end
