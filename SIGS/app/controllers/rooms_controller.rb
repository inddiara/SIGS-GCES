# Class responsible for the room controller methods
class RoomsController < ApplicationController

  def index
    @rooms = Room.all
  end

  def edit
    find_rooms()
  end

  def update
    @room = Room.find(params[:id])
    id = @room.id
    if @room.update_attributes(room_params)
      redirect_to room_index_path(id), :flash => {:success => 'Dados da sala atualizados com sucesso'}
    else
      flash[:error] = 'Dados não foram atualizados'
      render :edit
    end
  end

  def show
    find_rooms()
  end

  private
  def find_rooms
    @room = Room.find(params[:id])
  end

  def room_params
    params[:room].permit(:id, :code, :name, :capacity, :active, :time_grid_id, :build_id)
  end
end
