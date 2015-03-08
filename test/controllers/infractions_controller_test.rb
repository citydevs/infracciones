require 'test_helper'

class InfractionsControllerTest < ActionController::TestCase
  setup do
    @infraction = infractions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:infractions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create infraction" do
    assert_difference('Infraction.count') do
      post :create, infraction: { nombre: @infraction.nombre, placa: @infraction.placa, raking_honestidad: @infraction.raking_honestidad, raking_trato: @infraction.raking_trato }
    end

    assert_redirected_to infraction_path(assigns(:infraction))
  end

  test "should show infraction" do
    get :show, id: @infraction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @infraction
    assert_response :success
  end

  test "should update infraction" do
    patch :update, id: @infraction, infraction: { nombre: @infraction.nombre, placa: @infraction.placa, raking_honestidad: @infraction.raking_honestidad, raking_trato: @infraction.raking_trato }
    assert_redirected_to infraction_path(assigns(:infraction))
  end

  test "should destroy infraction" do
    assert_difference('Infraction.count', -1) do
      delete :destroy, id: @infraction
    end

    assert_redirected_to infractions_path
  end
end
