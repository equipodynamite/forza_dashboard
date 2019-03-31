class Admin::PhysicalTestsController < ApplicationController
  layout 'user_dashboard'
  before_action :authenticate_user!
  before_action :verify_admin_role

  def new
    @physical_test = PhysicalTest.new
  end

  def create
    @physical_test = PhysicalTest.new(physical_test_params)
    if @physical_test.save
      redirect_to attendances_path, notice: 'Physical test was successfully created.'
    else
      render :new
    end
  end

  private

  def physical_test_params
    params.require(:physical_test).permit(
      :date,
      :user_id,
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
