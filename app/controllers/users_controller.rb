class UsersController < ApplicationController

    # before_action :set_user, only: [:show, :edit, :update, :destroy]

    # GET /users/new
    def new
        @user = User.new
    end

    #POST verfy user
    def authLogin
        @user = User.find_by(email:params[:email])
    
        if @user and @user.email == params[:email] and @user.password == params[:password]
            flash.now[:success] = "Login Successful."
            show
        else
            flash.now[:alert] = "Email or Password doesn't match."
            render :login
        end      
    end
    
#     # POST /users
    def create
        
        @user = User.find_by(email:params[:email])

        if @user
            flash.now[:warning] = "Email already exist."
            render :new
        elsif params[:password] != params[:c_password]
            flash.now[:alert] = "Password doesn't match."
            render :new
        else 
            puts("Add to db")
            @user = User.new

            puts(@user.name)
            @user.name = params[:name]
            @user.email = params[:email]
            @user.password = params[:password]
    
            puts("Here i am in create")
            if @user.save
                flash.now[:success] = "User successfully registered."
                render :show
                puts("Saved")
            else 
                render :new
                puts("Not saved")
            end
        
        end
    end

    # GET /users/:id
    def show 
        render :users/show
    end

#     #GET /users/:id/edit
#     def edit
#     end

#     #PATCH / PUT / users/:id
#     # def update
#     #     if @user.update(user_param)
#     #         redirect_to @user, notice: 'User was successfully update'
#     #     else 
#     #         render : edit
#     #     end
#     # end

    # private 
    #     def set_user
    #         @user = User.find(params[:id])
    #     end

    #     def user_param
    #         params.require(:user).permit(:name, :email, :password)
    #     end
    # end
    
end
