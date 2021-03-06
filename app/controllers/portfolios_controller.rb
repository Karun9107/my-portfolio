class PortfoliosController < ApplicationController
    layout "portfolio"

   before_action :set_portfolio_item, only: %i[edit update show destroy]
   access all: [:show, :index, :angular, :ruby_on_rails], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

    def index
        @portfolio_items = Portfolio.all
    end

    def angular
      @angular_items = Portfolio.angular_portfolio_item
    end

    def ruby_on_rails
      @ruby_on_rails_items = Portfolio.ruby_on_rails_portfolio_item
    end

    def new
        @portfolio_item = Portfolio.new
        3.times {@portfolio_item.technologies.build}
    end

    def create
        @portfolio_item = Portfolio.new(portfolio_params)
        respond_to do |format|
          if @portfolio_item.save
            format.html { redirect_to portfolios_path  , notice: "Portfolio item is now live" }
            format.json { render :show, status: :created, location: @portfolio_item }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
          end
        end
    end

    def edit
    end

    def update
        respond_to do |format|
          if @portfolio_item.update(portfolio_params)
            format.html { redirect_to portfolios_path, notice: "Portfolio was successfully updated." }
            format.json { render :show, status: :ok, location: @portfolio_item }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
          end
        end
    end

    def show

    end

    def destroy
      @portfolio_item.destroy
      respond_to do |format|
        format.html { redirect_to portfolios_url, notice: "Portfolio was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private 
    def portfolio_params
      params.require(:portfolio).permit(:title,
                                         :subtitle, 
                                         :body,
                                          technologies_attributes: [:name])
    end

    def set_portfolio_item
      @portfolio_item = Portfolio.find(params[:id])
    end
end

