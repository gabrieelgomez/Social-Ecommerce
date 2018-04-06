module Api::V1
  class Followers::FollowersController < ApiController
    before_action :authenticate_v1_user!
    before_action :set_follower, only: [:create_follow, :unfollow]
    before_action :unfollow_params, only: [:unfollow]

    #Crear un seguidor
    def create_follow
      @follow = current_v1_user.follow(@follower)
      render json: @follow
    end

    def unfollow
      @unfollow = current_v1_user.stop_following(@follower)
      render json: @unfollow
    end

    #Listar todos los seguidores de un User
    def followers
      @followers = current_v1_user.user_followers
      render json: @followers
    end

    #Listar los que sigue un Usuario
    def following
      @following = current_v1_user.all_following
      render json: @following
    end

    private

    def set_follower
      @follower = params[:user_id].nil? ? User.find(unfollow_params[:user_id]) : User.find(params[:user_id])
    end


    def unfollow_params
  		params.require(:unfollow).permit(:user_id)
  	end

  end
end


# module Implantacion
#   class UnidadVI::PuestaEnMarchaDelSistema
#
#     def conversion_migracion
#       conversion_migracion = "Conversion o migracion es la transformacion de estructura de datos, y modos de almacenamiento actuales
#       en las estructuras propuestas, es decir, es la traduccion de archivos actuales, al formato requerido
#       por el nuevo sistema"
#
#       instalacion_directa (
#         concepto: "consiste en instalar de forma directa",
#         ventaja:  "rapido y conciso",
#         desventaja: "borra todo el sistema viejo sin velar por el respaldo"
#       )
#
#       instalacion_paralela (
#         concepto: "instalacion en paralela, sin interrumpir el uso del sistema anterior",
#         ventaja:  "rapido y conciso",
#         desventaja: "borra todo el sistema viejo sin velar por el respaldo"
#       )
#
#     end
#
#
#
#   end
# end
