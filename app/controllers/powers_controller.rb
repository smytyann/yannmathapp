class PowersController < ApplicationController
  before_action :set_power, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! , except: [:index, :show]
  
  $power_Q1_random_a = 2+rand(10)  
  $power_Q1_random_b = 2+rand(4)
  $power_Q2_random_a = 2+rand(8)  
  $power_Q2_random_b = 2+rand(5)
  $power_Q3_random_a = 2+rand(6)  
  $power_Q3_random_b = 2+rand(3)
  $power_Q4_random_a = 2+rand(10) 
  $power_Q4_random_b = 2+rand(4)
  $power_Q5_random_a = 2+rand(8)  
  $power_Q5_random_b = 2+rand(5)
  $power_Q6_random_a = 2+rand(6)  
  $power_Q6_random_b = 2+rand(3)
  $power_Q7_random_a = 2+rand(10) 
  $power_Q7_random_b = 2+rand(4)
  $power_Q8_random_a = 2+rand(8)  
  $power_Q8_random_b = 2+rand(5)
  $power_Q9_random_a = 2+rand(6)  
  $power_Q9_random_b = 2+rand(3)
  $power_Q10_random_a = 2+rand(100) 
  $power_Q10_random_b = 2+rand(200)
  # GET /Power
  # GET /Power.json
  def power   
    @point =0
    #byebug
    @input1 = params[:search_string1]
    @result1 = Power.find_power($power_Q1_random_a, $power_Q1_random_b,  @input1.to_i)
    @resultofpower1 = Power.value_power($power_Q1_random_a, $power_Q1_random_b)
    if (@result1 === 'WELL DONE')
      @point= @point +1 
    end  
    
    @input2 = params[:search_string2]
    @result2 = Power.find_power($power_Q2_random_a, $power_Q2_random_b,  @input2.to_i)
    @resultofpower2 = Power.value_power($power_Q2_random_a, $power_Q2_random_b)
    if (@result2 === 'WELL DONE')
      @point= @point +1 
    end    
    #byebug
    @input3 = params[:search_string3]
    @result3 = Power.find_power($power_Q3_random_a, $power_Q3_random_b,  @input3.to_i)
    @resultofpower3 = Power.value_power($power_Q3_random_a, $power_Q3_random_b)
    if (@result3 === 'WELL DONE')
      @point= @point +1 
    end
     
    @input4 = params[:search_string4]
    @result4 = Power.find_power($power_Q4_random_a, $power_Q4_random_b,  @input4.to_i)
    @resultofpower4 = Power.value_power($power_Q4_random_a, $power_Q4_random_b)
    if (@result4 === 'WELL DONE')
      @point= @point +1 
    end
    
    @input5 = params[:search_string5]
    @result5 = Power.find_power($power_Q5_random_a, $power_Q5_random_b,  @input5.to_i)
    @resultofpower5 = Power.value_power($power_Q5_random_a, $power_Q5_random_b)
    if (@result5 === 'WELL DONE')
      @point= @point +1 
    end
    
    @input6 = params[:search_string6]
    @result6 = Power.find_power($power_Q6_random_a, $power_Q6_random_b,  @input6.to_i)
    @resultofpower6 = Power.value_power($power_Q6_random_a, $power_Q6_random_b)
    if (@result6 === 'WELL DONE')
      @point= @point +1 
    end
    
    @input7 = params[:search_string7]
    @result7 = Power.find_power($power_Q7_random_a, $power_Q7_random_b,  @input7.to_i)
    @resultofpower7 = Power.value_power($power_Q7_random_a, $power_Q7_random_b)
    if (@result7 === 'WELL DONE')
      @point= @point +1 
    end
    
    @input8 = params[:search_string8]
    @result8 = Power.find_power($power_Q8_random_a, $power_Q8_random_b,  @input8.to_i)
    @resultofpower8 = Power.value_power($power_Q8_random_a, $power_Q8_random_b)
    if (@result8 === 'WELL DONE')
      @point= @point +1 
    end
    
    @input9 = params[:search_string9]
    @result9 = Power.find_power($power_Q9_random_a, $power_Q9_random_b,  @input9.to_i)
    @resultofpower9 = Power.value_power($power_Q9_random_a, $power_Q9_random_b)
    if (@result9 === 'WELL DONE')
      @point= @point +1 
    end
   # byebug
		@input10 = params[:search_string10].to_i
		@result10 = Checkpercentage.find_amount($power_Q10_random_a, $power_Q10_random_b)	
		if(@input10 == @result10)
      @print = "WELL DONE" 
			@point= @point+1
		else
      @print = "WRONG" 
    end
			
			
    
    @final_points = Point.find_point(@point)
    
  end # End of Def opower
  
  # GET /powers
  # GET /powers.json
  def index
   # @powers = Power.all
    return :index
  end

  # GET /powers/1
  # GET /powers/1.json
  def show
  end

  # GET /powers/new
  def new
    @power = current_user.powers.build
  end

  # GET /powers/1/edit
  def edit
  end

  # POST /powers
  # POST /powers.json
  def create
    @power = current_user.powers.build(power_params)

    respond_to do |format|
      if @power.save
        format.html { redirect_to @power, notice: 'Power was successfully created.' }
        format.json { render :show, status: :created, location: @power }
      else
        format.html { render :new }
        format.json { render json: @power.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /powers/1
  # PATCH/PUT /powers/1.json
  def update
    respond_to do |format|
      if @power.update(power_params)
        format.html { redirect_to @power, notice: 'Power was successfully updated.' }
        format.json { render :show, status: :ok, location: @power }
      else
        format.html { render :edit }
        format.json { render json: @power.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /powers/1
  # DELETE /powers/1.json
  def destroy
    @power.destroy
    respond_to do |format|
      format.html { redirect_to powers_url, notice: 'Power was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_power
      @power = Power.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def power_params
      params.require(:power).permit(:powernum)
    end
end
